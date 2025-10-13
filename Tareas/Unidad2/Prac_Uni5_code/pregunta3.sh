#!/bin/bash
# Script: pregunta3.sh
# Extraer SNPs en ventana 2Mb del cromosoma 3 en archivo VCF con vcftools
# Uso: ./pregunta3.sh <Inicio en bp>
# Guarda el archivo en ../resource con el formato CLG_Chr3_<Start>-<End>Mb.vcf

vcf_file="/datos/compartido/ChileGenomico/GATK_ChGdb_recalibrated.autosomes.12262013.snps.known.vcf"

chromosome=3
start=$1
window_size=2000000
end=$((start + window_size))

startMb=$(echo "scale=2; $start/1000000" | bc)
endMb=$(echo "scale=2; $end/1000000" | bc)

output_file="../resource/CLG_Chr${chromosome}_${startMb}-${endMb}Mb.vcf"

vcftools --vcf "$vcf_file" --chr "$chromosome" --from-bp "$start" --to-bp "$end" --remove-indels --recode --out temp_output

mv temp_output.recode.vcf "$output_file"

echo "Archivo generado en: $output_file"

