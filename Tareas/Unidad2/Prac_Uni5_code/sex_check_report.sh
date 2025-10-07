#!/bin/bash

BASE_DIR="$HOME/fcarmona/Tareas_BioinfRepro2025_FCP/Unidad2/Prac_Uni5"
BFILE="$BASE_DIR/data/chilean_all48_hg19"
OUT_PREFIX="$BASE_DIR/resource/sex_check"
REPORT="$BASE_DIR/resource/sex_discordant_report.txt"

mkdir -p "$BASE_DIR/resource"

# Ejecutar estimación de sexo con plink
plink --bfile "$BFILE" --check-sex --out "$OUT_PREFIX"

# Extraer individuos con discordancia (STATUS != OK)
awk 'NR==1 || $5 != "OK" {print $1, $2, $3, $4, $5, $6}' "${OUT_PREFIX}.sexcheck" > "$REPORT"

echo "Reporte de discordancias de sexo generado en: $REPORT"

