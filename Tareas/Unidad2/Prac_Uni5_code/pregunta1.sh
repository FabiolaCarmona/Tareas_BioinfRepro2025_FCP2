#!/bin/bash
# Script: pregunta1.sh
# Contar individuos y SNPs de un archivo VCF usando VCFtools
# Guarda los resultados en el directorio ../resource/

vcf_file="/datos/compartido/ChileGenomico/GATK_ChGdb_recalibrated.autosomes.12262013.snps.known.vcf"
output_prefix="../resource/pregunta1_output"

# Contar el número de individuos (muestras)
num_individuals=$(head -n 100 "$vcf_file" | grep "^#CHROM" | awk '{print NF-9}')
echo $num_individuals > ${output_prefix}_num_individuals.txt

# Contar sólo los SNPs (sin indels)
num_snps=$(vcftools --vcf "$vcf_file" --remove-indels --recode --stdout | grep -v "^#" | wc -l)
echo $num_snps > ${output_prefix}_num_snps.txt

# Imprimir en pantalla
echo "Número de individuos: $num_individuals"
echo "Número de variantes (SNPs): $num_snps"

