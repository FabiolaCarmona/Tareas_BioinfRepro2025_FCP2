#!/bin/bash

BASE_DIR="$HOME/fcarmona/Tareas_BioinfRepro2025_FCP/Unidad2/Prac_Uni5"
FAM="$BASE_DIR/data/chilean_all48_hg19.fam"
POPINFO="$BASE_DIR/data/chilean_all48_hg19_popinfo.csv"
OUTPUT="$BASE_DIR/resource/sex_discordance_prop.txt"

mkdir -p "$BASE_DIR/resource"

# Función para normalizar ID: mayúsculas, quitar espacios y guiones
normalize_id() {
  echo "$1" | tr '[:lower:]' '[:upper:]' | tr -d ' -'
}

# Extraer ID y sexo del .fam, normalizar ID, ordenar
awk '{print toupper($2)","$5}' "$FAM" | sed 's/[- ]//g' | sort > "$BASE_DIR/resource/fam_sex_sorted.csv"

#!/bin/bash

BASE_DIR="$HOME/fcarmona/Tareas_BioinfRepro2025_FCP/Unidad2/Prac_Uni5"
FAM="$BASE_DIR/data/chilean_all48_hg19.fam"
POPINFO="$BASE_DIR/data/chilean_all48_hg19_popinfo.csv"
OUTPUT="$BASE_DIR/resource/sex_discordance_prop.txt"

mkdir -p "$BASE_DIR/resource"

# Extraer ID y sexo del .fam, convertir 1->M, 2->F, normalizar ID, ordenar
awk '{ id=toupper($2); sex=($5==1?"M":($5==2?"F":"U")); gsub(/ /,"",id); print id","sex}' "$FAM" | sort > "$BASE_DIR/resource/fam_sex_sorted.csv"

# Extraer ID y sexo del popinfo, eliminar comillas, normalizar IDs y ordenar
awk -F',' 'NR>1 {
  id=toupper($1);
  sex=$2;
  gsub(/"/,"",id);
  gsub(/"/,"",sex);
  gsub(/[- ]/,"",id);
  print id","sex
}' "$POPINFO" | sort > "$BASE_DIR/resource/pop_sex_sorted.csv"

# Unir ambos archivos por ID
join -t, "$BASE_DIR/resource/fam_sex_sorted.csv" "$BASE_DIR/resource/pop_sex_sorted.csv" > "$BASE_DIR/resource/sex_compare.txt"

# Calcular total y discordancias
total=$(wc -l < "$BASE_DIR/resource/sex_compare.txt")
discord=$(awk -F',' '$2 != $3' "$BASE_DIR/resource/sex_compare.txt" | wc -l)

if [ "$total" -gt 0 ]; then
  prop=$(awk "BEGIN {print $discord/$total}")
else
  prop=0
fi

echo "Discordancias: $discord/$total" > "$OUTPUT"
echo "Proporción de discordancias: $prop" >> "$OUTPUT"

rm "$BASE_DIR/resource/fam_sex_sorted.csv" "$BASE_DIR/resource/pop_sex_sorted.csv" "$BASE_DIR/resource/sex_compare.txt"

