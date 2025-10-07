#!/bin/bash

# Directorios y archivos
CODE_DIR=code
RESOURCE_DIR=../resource
DATA_DIR=../data
META_FILE=/home/bioinfo1/fcarmona/Tareas_BioinfRepro2025_FCP/Unidad1/Sesion3/PracUni1Ses3/maices/meta/maizteocintle_SNP50k_meta_extended.txt
FAM_FILE=$DATA_DIR/chilean_all48_hg19.fam

# Crear carpeta resource si no existe
mkdir -p $RESOURCE_DIR

# Extraer Family ID e IID del archivo .fam (solo primeras dos columnas)
awk '{print $1, $2}' $FAM_FILE > $RESOURCE_DIR/ids_fam.txt

# Extraer SampleID y Categ.Altitud de la metadata ignorando encabezado (asumiendo columna 1 y 3)
awk -F"\t" 'NR>1 {print $1"\t"$3}' $META_FILE > $RESOURCE_DIR/meta_altitud.txt

# Unir basándose en IID (col 2 en ids_fam.txt) y SampleID (col 1 meta_altitud.txt)
join -1 2 -2 1 <(sort -k2,2 $RESOURCE_DIR/ids_fam.txt) <(sort -k1,1 $RESOURCE_DIR/meta_altitud.txt) > $RESOURCE_DIR/tmp_join.txt

# Crear archivo para plink update-ids: formato oldFID oldIID newFID newIID
awk '{print $2" "$2" "$3" "$2}' $RESOURCE_DIR/tmp_join.txt > $RESOURCE_DIR/ids_update.txt

echo "Archivo generado para update-ids en: $RESOURCE_DIR/ids_update.txt"

