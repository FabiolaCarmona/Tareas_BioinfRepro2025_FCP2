#!/bin/bash

plink --bfile ../data/chilean_all48_hg19 --recode --maf 0.05 --mind 0.1 --out ../resource/maicesArtegaetal2015_maf05_missing10

echo "Filtrado terminado. Revisa ../resource/maicesArtegaetal2015_maf05_missing10.log para detalles."

