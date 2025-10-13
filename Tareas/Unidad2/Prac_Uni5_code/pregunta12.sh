#!/bin/bash
input_frq="../resource/pregunta7_allele_freq_biallelic.frq"
output_frq="../resource/pregunta12_maf_less_005.frq"

awk 'NR==1 {print; next} {
  split($5, freqs, " ");
  min=1;
  for(i in freqs) {
    split(freqs[i], af, ":");
    if(af[2]<min) min=af[2];
  }
  if(min<0.05) print
}' "$input_frq" > "$output_frq"

echo "Archivo con sitios MAF < 0.05 generado: $output_frq"

