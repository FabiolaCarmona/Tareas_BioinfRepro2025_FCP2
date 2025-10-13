#!/bin/bash

data_dir=~/fcarmona/Tareas_BioinfRepro2025_FCP/Unidad2/Prac_Uni5/data
output_file=../resource/listado_archivos_plink.txt

# Listar archivos que empiezan con plink basename y su tipo con file
echo "Listado de archivos PLINK en $data_dir y sus tipos:" > "$output_file"

for f in "$data_dir"/*; do
  # Si archivo tiene extensión común PLINK
  ext="${f##*.}"
  basename="$(basename "$f")"
  if [[ "$ext" == "bed" || "$ext" == "bim" || "$ext" == "fam" ]]; then
    tipo=$(file -b "$f")
    echo "$basename : $tipo" >> "$output_file"
  fi
done

echo "Listado guardado en $output_file"

