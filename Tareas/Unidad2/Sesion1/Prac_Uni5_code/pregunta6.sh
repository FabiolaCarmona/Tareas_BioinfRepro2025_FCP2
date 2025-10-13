#!/bin/bash
# Script: pregunta6.sh
# Calcular la frecuencia de cada alelo para todo el archivo VCF y guardar en resource

vcf_file="/datos/compartido/ChileGenomico/GATK_ChGdb_recalibrated.autosomes.12262013.snps.known.vcf"
output_prefix="../resource/pregunta6_allele_freq"

vcftools --vcf "$vcf_file" --freq --out "$output_prefix"

echo "Archivo de frecuencias generado: ${output_prefix}.frq"

