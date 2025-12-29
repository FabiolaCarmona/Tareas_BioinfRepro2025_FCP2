library(DESeq2)
library(pheatmap)

# Recrear DESeq2 desde tus archivos
input_dir <- "count"
count_files <- list.files(input_dir, "*.count")
counts_list <- lapply(count_files, function(f) {
  read.delim(file.path(input_dir,f), sep="\t", header=FALSE, col.names=c("gene","count"))
})
names(counts_list) <- gsub(".count","",count_files)

# Matriz
count_matrix <- do.call(cbind, lapply(counts_list, function(x) x$count))
rownames(count_matrix) <- counts_list[[1]]$gene
colnames(count_matrix) <- names(counts_list)

# Filtrar
keep <- rowSums(count_matrix) >= 10
count_matrix <- count_matrix[keep,]
colData <- data.frame(condition = factor(c("WT","WT","Mut","Mut"), levels=c("WT","Mut")))

# DESeq2 rápido
dds <- DESeqDataSetFromMatrix(round(count_matrix), colData, ~condition)
dds <- DESeq(dds)
res <- results(dds)

# VST + Heatmap TOP 50
vsd <- vst(dds, blind=FALSE)
top_genes <- rownames(res)[order(res$padj, na.last=NA)][1:min(50, nrow(res))]

png("heatmap_Lsr_KD.png", width=1000, height=800, res=150)
pheatmap(assay(vsd)[top_genes, ], 
         scale="row",
         cluster_rows=TRUE, cluster_cols=TRUE,
         annotation_col=colData,
         annotation_colors=list(condition=c("WT"="steelblue", "Mut"="tomato")),
         main="Top 50 DEGs - Lsr Knockdown (Mut vs WT)",
         fontsize_row=8,
         filename="heatmap_Lsr_KD.png")
dev.off()

cat("✅ heatmap_Lsr_KD.png CREADO!\n")
cat("DEGs totales:", sum(res$padj < 0.05, na.rm=TRUE), "\n")
