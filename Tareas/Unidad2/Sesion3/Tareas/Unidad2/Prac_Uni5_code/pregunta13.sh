#!/bin/bash
vcf_file="/datos/compartido/ChileGenomico/GATK_ChGdb_recalibrated.autosomes.12262013.snps.known.vcf"
filtered_vcf="../resource/pregunta13_filtered_maf.recode.vcf"
output_prefix="../resource/pregunta13_filtered_maf"

# Filtrar variantes con MAF >= 0.05
vcftools --vcf "$vcf_file" --maf 0.05 --recode --out ../resource/pregunta13_filtered_maf

# Convertir a formato PLINK
plink --vcf "$filtered_vcf" --make-bed --out "$output_prefix"

echo "Archivo PLINK generado: ${output_prefix}.bed/.bim/.fam"

