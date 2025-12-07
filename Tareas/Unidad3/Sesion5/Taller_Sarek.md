# Análisis germinal y somático con nf-core/sarek
Fabiola Carmona Pastén
Muestra: S5

## Introducción
Se aplicó el pipeline nf-core/sarek para detectar variantes germinales y somáticas a partir de lecturas de secuenciación de una muestra tumoral. El objetivo fue comparar cuantitativamente ambos conjuntos de variantes y explorar su posible relevancia biológica y clínica usando las bases OncoKB (somáticas) y gnomAD (germinales) .

## Metodología
Los FASTQ pareados se analizaron con nf-core/sarek en un servidor Linux, incluyendo pasos de control de calidad, alineamiento al genoma humano GRCh38, marcado de duplicados y llamado de variantes. Para el análisis germinal se utilizó HaplotypeCaller, mientras que para el somático se empleó Mutect2 en modo tumor-only; los resultados principales se obtuvieron como archivos VCF en las carpetas `haplotypecaller` (germinal) y `mutect2` (somático).

Los comandos principales ejecutados fueron:
```
bash sarek_germinal.sh ../data/S5_R1.fastq.gz ../data/S5_R2.fastq.gz ../results
bash sarek_somatic.sh ../data/S5_R1.fastq.gz ../data/S5_R2.fastq.gz ../results
```
Las variantes se inspeccionaron con `bcftools` y se seleccionó un subconjunto de 10–20 variantes germinales y 10–20 somáticas no sinónimas para su interpretación en gnomAD y OncoKB, respectivamente.

## Resultados germinales
El análisis germinal produjo **113 variantes** de alta confianza en el VCF filtrado de HaplotypeCaller (filtro PASS en todas las entradas). La mayoría de las variantes presentaron valores de calidad elevados (ejemplo: QD≈18–28, MQ=60), lo que sugiere buena calidad de alineamiento y soporte de lectura.

![Imagen germinal]()

| CHROM | POS      | REF | ALT | Tipo de mutación | AF gnomAD | Comentario |
|-------|----------|-----|-----|------------------|-----------------|---------|
| 1     | 43348867 | C   | T   | SNP | 0.000 | No observada en gnomAD (variante extremadamente rara) |
| 2     | 197392570| TG  | T   | Deleción de una base (indel) homocigota | ~0.003011 | Deleción de 1 base poco frecuente; presente en gnomAD con AF global ~0.3 %, algo más elevada en población del sur de Asia |
| 2     | 197400626| T   | C   | SNP en variante conocida | ~0.3197 | SNP germinal muy frecuente (AF ~32 % global), presente con frecuencias altas en varios grupos ancestrales, compatible con polimorfismo común |
| 2     | 197402219| C   | T   | SNP heterocigota (0/1) con profundidad elevada (DP=11) | ≈ 0.9991 | SNP germinal extremadamente común (AF ~99.9 % y cientos de miles de homocigotas), compatible con polimorfismo poblacional sin gran efecto patogénico |
| 3     |120523794 | G   | GCC | Inserción corta (indel) |  0 (no reportada) | Inserción de 2 bases no registrada en gnomAD pese a buena cobertura en la región; sugiere una variante extremadamente rara en las cohortes analizadas |
| 4     | 47491238 | A   | G   | SNP homocigota | 0 (no reportada) | SNP germinal no registrado en gnomAD a pesar de buena cobertura en la región; sugiere una variante muy rara en las cohortes analizadas |
| 4     | 54273849 |T    | C   | SNP puntual homocigota | ≈ 0.7592 | SNP germinal muy frecuente (AF ~76 % y >200.000 homocigotas en gnomAD), compatible con polimorfismo común de la población
| 4     | 54273864  | T   | G   | SNP | ~ 0.997            | SNP germinal extremadamente común (AF ~99.7 % y >300.000 homocigotas), típico polimorfismo de alta frecuencia en la población |
| 5     | 150117614  | T   | C   | SNP |~ 0.40      | SNP germinal frecuente (AF ~40 % y >100.000 homocigotas), consistente con polimorfismo común de la población |
| 7     | 50376608  | C   | T   | SNP | 6.2e-7 | SNP ultra-raro (un solo alelo observado, sin homocigotas); marcado como AS_VQSR, por lo que la estimación de frecuencia es muy incierta |
