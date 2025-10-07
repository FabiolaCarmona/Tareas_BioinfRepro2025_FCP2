#!/bin/bash

output_file="../resource/explicacion_hwe.txt"

cat << EOF > "$output_file"
Descripción de columnas en el archivo .hwe:

CHR     : Cromosoma donde está localizado el SNP.
SNP     : Identificador único del SNP.
TEST    : Subgrupo para el cual se calcula el HWE:
          - ALL: todos los individuos
          - AFF: individuos afectados
          - UNAFF: individuos no afectados
A1      : Alelo 1 para el SNP (generalmente el alelo menor o el de referencia).
A2      : Alelo 2 para el SNP.
GENO    : Conteo de genotipos observados en formato: homocigoto A1 / heterocigoto / homocigoto A2.
O(HET)  : Proporción observada de heterocigotos.
E(HET)  : Proporción esperada de heterocigotos bajo el equilibrio de Hardy-Weinberg.
P       : Valor p del test estadístico para evaluar desviación del equilibrio. Un valor p bajo (p < 0.05) indica desviación significativa.

Ejemplo de interpretación:
Para el SNP rs9701055 (CHR 1) en el grupo ALL,
- GENO 18/0/28 indica 18 homocigotos A1, 0 heterocigotos, 28 homocigotos A2.
- O(HET) es 0, pero E(HET) esperada es 0.4764.
- Un valor p muy bajo (5.994e-14) señala desviación significativa del equilibrio.
EOF

echo "Archivo de explicación generado en $output_file"

