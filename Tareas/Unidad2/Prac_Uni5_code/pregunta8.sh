#!/bin/bash
# Script: pregunta8.sh
# Llama a un script R para graficar histograma MAF de variantes bialélicas

input_file="../resource/pregunta7_allele_freq_biallelic.frq"
output_file="../resource/histograma_maf.png"
r_script="histograma_maf.R"

Rscript "$r_script" "$input_file" "$output_file"

echo "Histograma guardado en: $output_file"

