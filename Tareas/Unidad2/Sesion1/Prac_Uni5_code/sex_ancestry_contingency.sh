#!/bin/bash

BASE_DIR="$HOME/fcarmona/Tareas_BioinfRepro2025_FCP/Unidad2/Prac_Uni5"
POPINFO="$BASE_DIR/data/chilean_all48_hg19_popinfo.csv"
OUTPUT="$BASE_DIR/resource/sex_ancestry_contingency.csv"

mkdir -p "$BASE_DIR/resource"

awk -F',' 'NR>1 {
  gsub(/"/,"",$2);
  gsub(/"/,"",$6);
  count[$2","$6]++
}
END {
  print "Sex,Ancestry,Count"
  for (key in count) print key "," count[key]
}' "$POPINFO" > "$OUTPUT"

echo "Tabla de contingencia sex-ancestry generada en: $OUTPUT"

