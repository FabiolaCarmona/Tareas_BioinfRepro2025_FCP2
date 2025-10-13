#!/bin/bash

plink --bfile ../data/chilean_all48_hg19 --recode --out ../resource/chilean_all48_hg19

echo "Conversión terminada. Archivos guardados en ../resource"

