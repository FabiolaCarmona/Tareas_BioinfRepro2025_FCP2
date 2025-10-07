#!/bin/bash
# Script: pregunta2.sh
# Contar sitios sin datos perdidos (missing) en un archivo VCF usando VCFtools
# Guarda el resultado en ../resource/

vcf_file="/datos/compartido/ChileGenomico/GATK_ChGdb_recalibrated.autosomes.12262013.snps.known.vcf"
output_file="../resource/pregunta2_output_num_sites_no_missing.txt"

# Contar sitios con 0% missing data (max-missing=1)
num_sites_no_missing=$(vcftools --vcf "$vcf_file" --max-missing 1 --recode --stdout | grep -v "^#" | wc -l)

# Guardar resultado en archivo
echo $num_sites_no_missing > $output_file

# Mostrar resultado en pantalla
echo "Número de sitios sin datos perdidos: $num_sites_no_missing"

