#!/bin/bash
vcf_file="/datos/compartido/ChileGenomico/GATK_ChGdb_recalibrated.autosomes.12262013.snps.known.vcf"
output_prefix="../resource/pregunta10_heterozygosity"

vcftools --vcf "$vcf_file" --het --out "$output_prefix"

echo "Archivo de heterocigosidad generado: ${output_prefix}.het"

