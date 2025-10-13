#!/bin/bash
input_frq="../resource/pregunta7_allele_freq_biallelic.frq"
output_file="../resource/pregunta9_maf_less_005.txt"

awk 'NR>1 {
  split($5, freqs, " ");
  min=1;
  for(i in freqs) {
    split(freqs[i], af, ":");
    if(af[2]<min) min=af[2];
  }
  if(min<0.05) count++;
} END {
  print "Número de sitios con MAF < 0.05:", count > "'"$output_file"'"
}' "$input_frq"

echo "Conteo guardado en: $output_file"

