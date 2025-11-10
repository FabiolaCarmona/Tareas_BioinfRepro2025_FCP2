# Llamado de Variantes

Fabiola Carmona Pastén

Muestra a utilizar: S5

La selección de regiones blanco para la secuenciación se realizó sobre un panel clínico de genes, definido en el archivo BED proporcionado para esta práctica. El panel incluyó un total de **369 genes únicos**, que corresponden a los principales candidatos asociados a la sospecha clínica de los pacientes estudiados.
La lista completa de genes se presenta en la Tabla 1 y fue derivada mediante la extracción de las anotaciones genéticas del cuarto campo de `regiones_blanco.bed`.

[insertar tabla 1]

La región genómica total cubierta por el panel es de aproximadamente **91120 pares de bases**, según el cálculo del tamaño acumulado de los intervalos definidos en el archivo BED. Este valor representa el espacio objetivo para la captura, enriquecimiento y posterior secuenciación, asegurando una cobertura adecuada sobre los exones y regiones de relevancia médica de los genes seleccionados.

Foto del codigo 
El proceso de filtrado de variantes utilizando los criterios DP<10 y QUAL<30 no eliminó ninguna variante del archivo VCF de la muestra analizada. Esto indica que todas las variantes llamadas superan ambos umbrales mínimos de profundidad y calidad, reflejando una alta confiabilidad en la detección de variantes para esta muestra.

## Resultados de filtrado de variantes

Se realizó la detección y filtrado de variantes para la muestra analizada. En la siguiente tabla se resume el número total de variantes detectadas (totales, SNPs e INDELs), la cantidad de variantes eliminadas con el filtro de profundidad (DP<10), el filtro combinado (DP<10 o QUAL<30), y el número final de variantes que pasan ambos filtros aplicados:

Insertar tabla 2

Para ejemplificar la visualización de variantes, se utilizó **IGV (Integrative Genomics Viewer)**. Se cargaron los archivos de alineamiento (`S5_sorted_RG.bam` junto con su índice `.bai`) y el archivo de variantes (`S5_FILTERED_FINAL.vcf`). La región correspondiente a una variante de interés fue buscada y visualizada, permitiendo la inspección simultánea tanto de las lecturas alineadas como de las variantes llamadas sobre el mismo panel genómico.
