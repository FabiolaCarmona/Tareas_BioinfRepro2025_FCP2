#!/bin/bash

DATA_DIR=../data
RESOURCE_DIR=../resource
BFILE=chilean_all48_hg19
UPDATE_IDS=ids_update.txt
OUTPUT=chilean_all48_hg19_updated

# Ejecuta PLINK para actualizar los IDs con el archivo generado
plink --bfile $DATA_DIR/$BFILE --update-ids $RESOURCE_DIR/$UPDATE_IDS --make-bed --out $RESOURCE_DIR/$OUTPUT

echo "PLINK update completo. Archivos con IDs actualizados en: $RESOURCE_DIR"

