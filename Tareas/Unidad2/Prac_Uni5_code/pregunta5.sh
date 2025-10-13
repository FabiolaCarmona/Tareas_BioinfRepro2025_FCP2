#!/bin/bash
# Script: pregunta5.sh
# Calcula la cobertura promedio por individuo usando vcftools
# Guarda la salida en ../resource/

vcf_file="/datos/compartido/ChileGenomico/GATK_ChGdb_recalibrated.autosomes.12262013.snps.known.vcf"
output_prefix="../resource/pregunta5_coverage"

# Ejecuta vcftools para obtener la profundidad media por individuo
vcftools --vcf "$vcf_file" --depth --out "$output_prefix"

# El archivo generado con cobertura promedio es: pregunta5_coverage.idepth
# Puedes revisar las primeras líneas para validar
echo "Primeras líneas del archivo de cobertura promedio por individuo:"
head -n 10 "${output_prefix}.idepth"

