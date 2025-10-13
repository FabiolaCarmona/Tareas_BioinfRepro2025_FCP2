#!/bin/bash

plink --file ../resource/maicesArtegaetal2015_maf05_missing10 --hardy --out ../resource/chilean_all48_hg19_maf05_missing10

echo "Reporte HWE generado en ../resource/chilean_all48_hg19_maf05_missing10.hwe"

