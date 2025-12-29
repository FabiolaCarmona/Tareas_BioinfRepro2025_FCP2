# Análisis RNA-seq Lsr Knockdown - Fabiola Carmona
library(DESeq2)
library(ggplot2)

input_dir <- "../count"
count_files <- list.files(input_dir, "*.count")
print(count_files)

# Leer datos
counts_list <- lapply(count_files, function(f) {
  read.delim(file.path(input_dir,f), sep="\t", header=FALSE)
})
names(counts_list) <- c("WT_P","WT_B","Mut_P","Mut_B")

# Matriz
count_matrix <- do.call(cbind, lapply(counts_list, function(x) x$V2))
rownames(count_matrix) <- counts_list[[1]]$V1
colnames(count_matrix) <- names(counts_list)

# Filtrar
keep <- rowSums(count_matrix) >= 10
count_matrix <- count_matrix[keep,]

# DESeq2
colData <- data.frame(condition = factor(c("WT","WT","Mut","Mut")))
dds <- DESeqDataSetFromMatrix(round(count_matrix), colData, ~condition)
dds <- DESeq(dds)
res <- results(dds)

# Resultados
print(summary(res))
pdf("volcano_plot.pdf")
res_df <- as.data.frame(res)
res_df$sig <- ifelse(res_df$padj<0.05 & abs(res_df$log2FoldChange)>1, "DEGs", "No")
plot(res_df$log2FoldChange, -log10(res_df$padj), col=ifelse(res_df$sig=="DEGs","red","grey"),
     pch=19, main="Lsr Knockdown: Mut vs WT", xlab="log2FC", ylab="-log10(padj)")
dev.off()

# Exportar
write.csv(res, "deseq2_results.csv")
cat("DEGs encontrados:", sum(res$padj<0.05, na.rm=TRUE), "\n")
cat("¡ANÁLISIS COMPLETO! PDF y CSV generados.\n")
