#!/bin/bash
# Script: pregunta4.sh
# Contar variantes en el archivo VCF generado almacenado en resource
# El archivo VCF debe pasarse como parámetro

input_vcf="../resource/$1"

# Contar líneas que no son encabezado
num_variants=$(grep -v "^#" "$input_vcf" | wc -l)

echo $num_variants > ../resource/"${1%.vcf}"_num_variants.txt
echo "Número de variantes en $1: $num_variants"

