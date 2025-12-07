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

### Tabla 1: Comparación de variantes germinales utilizando gnomAD

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

## Resultados somáticos

  A partir del VCF somático de Mutect2, de **440 variantes** se seleccionaron diez variantes con buen soporte de lectura y distribuidas en distintos genes para su anotación en OncoKB. Para cada una se registró el gen afectado, el tipo de cambio, la oncogenicidad asignada (si existe), el nivel de evidencia clínica y cualquier información terapéutica disponible, lo que se resume en la siguiente tabla:

### Tabla 2: Comparación de variantes germinales utilizando OncoKB

| Gen | Variante (p.) | CHROM:POS:REF>ALT | Oncogenicidad | Nivel evidencia | Comentario OncoKB |
|----------|----------------------|---------------------------------------|--------------------|-----------------|-------------------|
| DDX41 | C>G | 1:43338069:C>G  | Unknown / Not annotated | – | Mutación no revisada por el equipo OncoKB; no hay evidencia clínica ni terapéutica asignada |
| CAMTA1 | C>G | 1:43338085:C>G | Unknown / Not annotated | – | Mutación de CAMTA1 sin anotación específica en OncoKB, significado biológico desconocido |
| ASXL1 | C>G | 2:197398454:C>G | Unknown / Not annotated | – | Variante de ASXL1 no curada por OncoKB; no se asigna nivel de evidencia ni indicaciones terapéuticas |
| ASXL1 | T>A  | 1:43339459:T>A  | Unknown / Not annotated | –   | Mutación T>A en ASXL1 sin datos funcionales o clínicos en OncoKB |
| DKK4     | T>TGGGGATGC  | 1:43339464:T>TGGGGATGC  | Unknown / Not annotated | –  | Indel en DKK4 no revisado por OncoKB; no hay información sobre su rol oncogénico ni terapias asociadas |
| ASXL1    | G>A   | 1:43346436:G>A   | Unknown / Not annotated | –  | Cambio G>A en ASXL1 sin clasificación de oncogenicidad ni nivel de evidencia en OncoKB |
| CYSLTR2  | G>A  | 1:159476819:G>A  | Unknown / Not annotated | –   | Mutación G>A en CYSLTR2 reportada como no anotada por OncoKB; impacto clínico desconocido |
| PTPRS | G>GGAAACCCTCACTGGCCCTG | 2:197396017:G>GGAAACCCTCACTGGCCCTG | Unknown / Not annotated | –           | Indel complejo en PTPRS sin anotación en OncoKB; se considera variante de significado incierto |
| KDM6A  | G>GTA  | 4:54263853:G>GTA  | Unknown / Not annotated | – | Inserción en KDM6A no curada en OncoKB; no hay nivel de evidencia ni recomendaciones terapéuticas |

## Comparación germinal vs somático

  El VCF germinal filtrado contiene 113 variantes de alta confianza, mientras que el VCF somático de Mutect2 reporta 440 variantes somáticas llamadas en modo tumor-only. Entre las variantes seleccionadas para interpretación, el conjunto germinal incluye principalmente SNP junto con algunos indels, mientras que el somático está compuesto mayoritariamente por SNV con unos pocos indels complejos, lo que sugiere que la carga mutacional adquirida en el tumor se concentra en cambios puntuales más que en reordenamientos estructurales.

  Al intersectar ambos VCF no se identificaron variantes exactamente compartidas entre los análisis germinal y somático, por lo que las alteraciones somáticas seleccionadas parecen corresponder a eventos adquiridos en el tumor y no a polimorfismos constitutivos presentes en la línea germinal. 

## Discusión y conclusiones

  Las variantes germinales analizadas muestran un espectro mixto de polimorfismos muy frecuentes en la población (AF > 0.01 en gnomAD) y variantes raras o ausentes en esta base, lo que ilustra que la mayoría de los hallazgos corresponden a variación poblacional conocida, mientras que solo un subconjunto pequeño representa alelos de baja frecuencia potencialmente más relevantes desde el punto de vista funcional. En cambio, ninguna de las variantes somáticas seleccionadas presenta anotación de oncogenicidad ni niveles de evidencia clínica en OncoKB, por lo que no se identificaron mutaciones claramente accionables ni biomarcadores terapéuticos establecidos en esta muestra.

  En conjunto, estos resultados muestran que el pipeline nf-core/sarek permite obtener de forma reproducible VCF germinales y somáticos a partir de los mismos datos de secuenciación, y que la integración posterior con bases de datos de referencia es crítica para priorizar variantes. Mientras gnomAD ayuda a descartar polimorfismos comunes de bajo interés clínico, OncoKB permite evaluar si las alteraciones somáticas detectadas se han descrito como drivers tumorigénicos o dianas terapéuticas en contextos oncológicos específicos. 

