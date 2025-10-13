#!/bin/bash
vcf_file="/datos/compartido/ChileGenomico/GATK_ChGdb_recalibrated.autosomes.12262013.snps.known.vcf"
output_prefix="../resource/pregunta11_site_pi"

vcftools --vcf "$vcf_file" --site-pi --out "$output_prefix"

echo "Archivo de diversidad nucleotídica por sitio generado: ${output_prefix}.sites.pi"

