#!/bin/bash
# Filtrar variantes bialélicas según valor en columna 3 (N_ALLELES)

input_frq="../resource/pregunta6_allele_freq.frq"
output_frq="../resource/pregunta7_allele_freq_biallelic.frq"

awk 'NR==1 || $3==2' "$input_frq" > "$output_frq"

echo "Archivo bialélico generado: $output_frq"

