args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
output_file <- args[2]

data <- read.table(input_file, header=TRUE, stringsAsFactors=FALSE, row.names=NULL)

allele_freqs <- data[[5]]

calc_maf <- function(freq_str) {
  freq_str <- gsub("[{}]", "", freq_str)
  pairs <- unlist(strsplit(freq_str, "[ \t]*,[ \t]*|[ \t]+"))
  freqs <- suppressWarnings(as.numeric(sapply(pairs, function(x) unlist(strsplit(x, ":"))[2])))
  freqs <- freqs[!is.na(freqs)]
  if(length(freqs) == 0) return(NA)
  return(min(freqs))
}

maf <- sapply(allele_freqs, calc_maf)

maf <- maf[!is.na(maf)]

if(length(maf) == 0) {
  stop("No se encontraron valores válidos de MAF para graficar.")
}

png(filename=output_file, width=800, height=600)
hist(maf, breaks=30, col="steelblue", main="Histograma de MAF en variantes bialélicas",
     xlab="Frecuencia Menor Alélica (MAF)", ylab="Número de Variantes")
dev.off()

