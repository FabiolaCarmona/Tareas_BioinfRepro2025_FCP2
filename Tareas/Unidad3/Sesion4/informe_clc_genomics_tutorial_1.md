# Identificación de variantes en una muestra de tumor mediante CLC Genomics (QUIAGEN)

Fabiola Carmona Pastén

## Introducción

La identificación de variantes genómicas en tumores es esencial para comprender su biología y posibles implicancias clínicas. Estas alteraciones pueden revelar
mecanismos de progresión y guiar estrategias terapéuticas personalizadas. Este software permite analizar datos de secuenciación masiva (NGS) mediante herramientas
de alineamiento, detección y anotación de variantes. En este informe se describe el flujo de trabajo aplicado para identificar variantes somáticas en una muestra
tumoral usando esta plataforma.

En este caso, se utilizarán lecturas de una pequeña fracción del cromosoma 5.

### Llamado de variantes

Para la identificación de variantes somáticas del análisis del cromosoma 5, se utilizaron los siguientes parámetros configurables en la herramienta de detección de variantes:

![Imagen 1: Configuración de filtros para variantes de baja frecuencia]()

Estos parámetros fueron seleccionados basado en las recomendaciones del tutorial para detectar variantes somáticas de baja frecuencia, priorizando un balance entre sensibilidad y especificidad. En particular, la frecuencia mínima del 5% permite detectar variantes presentes en una fracción pequeña de la población celular, común en muestras tumorales heterogéneas.

Este set de parámetros está orientado para datos secuenciados con la plataforma Illumina, evitando filtros muy estrictos que podrían eliminar variantes relevantes.

#### Comprobación del informe de control de calidad para las regiones objetivo

Se generó un reporte de calidad (QC) para las regiones objetivo del cromosoma 5 con los siguientes resultados principales:

![Imagen2: ]()

- **Cobertura promedio:** 22.5 lecturas por posición.
- **Cobertura mediana:** 18.0 lecturas por posición.
- **Cobertura máxima:** 106 lecturas.
- **Porcentaje de posiciones con ≥10x:** 82.6%.
- **Número de regiones objetivo con cobertura <10x:** 72 de 124 (58%).

Estos resultados indican que, si bien la cobertura global es mayor al umbral recomendado para detección confiable de variantes (≥10x), cerca del 17.4% de las posiciones permanece por debajo de ese umbral, lo que podría limitar la sensibilidad en algunas regiones particulares.

La interpretación de estos datos sugiere que la mayoría de las regiones objetivo cumplen con los criterios mínimos de cobertura necesarios para la identificación precisa de variantes, aunque se recomienda revisar manualmente aquellas regiones con baja profundidad si contienen genes de relevancia clínica

**Cobertura uniforme en regiones target**

![Imagen 3]()

El análisis detallado de la fracción de las regiones objetivo cubiertas por al menos 10 lecturas revela que el 70% de las regiones (88 de 124) cuentan con al menos el 80% de su extensión cubierta a una profundidad adecuada. Solo el 41.9% de las regiones tienen el 100% de su longitud cubierta ≥10x, reflejando zonas donde la llamada de variantes podría verse afectada por baja cobertura.

**Especificidad del mapeo**

![Imagen 4]()

Respecto a la eficiencia del enriquecimiento, se observó que un 36% de las lecturas totales mapeadas corresponden a las regiones target, lo cual es esperable considerando la extensión de las regiones seleccionadas y el tamaño del cromosoma 5. Estos valores pueden variar dependiendo del tipo de panel y la eficiencia del método de captura utilizado.

En síntesis, la alta cobertura en la mayoría de las regiones asegura la sensibilidad y fiabilidad del análisis para variantes somáticas de baja frecuencia. Sin embargo, para sitios con <10x de cobertura, se recomienda cautela y, si es relevante clínicamente, validación complementaria con métodos ortogonales.

##### Visualización Integrada de Cobertura, Genes y Variantes en Cromosoma 5

![Imagen 5]()

La visualización tipo genome browser presentada integra diversos tracks informativos a lo largo del cromosoma 5: la posición y distribución de genes se representa en azul, los transcritos mRNA en verde y los exones codificantes en amarillo. Sobre estos, se superpone la cobertura de secuenciación obtenida para cada región target (en lila), junto con las posiciones donde se identificaron variantes somáticas (en rojo).

Esta representación resulta fundamental, ya que permite evaluar de forma directa el contexto funcional de las variantes, verificando si se localizan en zonas génicas, exónicas, o en regiones bien cubiertas por las lecturas de secuenciación. Además, facilita corroborar que la mayoría de los genes y regiones de interés están adecuadamente cubiertos, lo que incrementa la confianza en la calidad del mapeo y la solidez de los resultados obtenidos en el análisis de variantes.

Una vez validada la calidad de la cobertura y la correcta identificación de las regiones génicas y variantes, resulta fundamental enfocar el análisis sobre genes con potencial relevancia clínica en cáncer. Para el presente informe, se ha seleccionado el gen *RAD17* como foco principal debido a su función esencial en los mecanismos de reparación del ADN y control del ciclo celular. RAD17 participa como componente clave en la activación de puntos de control ante daño genómico y su disfunción se ha asociado con diferentes tipos de cáncer, incluidas neoplasias de mama y páncreas. Además, alteraciones en RAD17 pueden inducir inestabilidad cromosómica y afectar la sensibilidad a terapias dirigidas (PMID: 38872153). Por lo tanto, el análisis de variantes encontradas en RAD17 dentro del cromosoma 5 puede aportar información valiosa, tanto para la interpretación clínica como para el entendimiento de mecanismos moleculares relevantes en oncología.

##### Cobertura del gen RAD17 en regiones objetivo

![Imagen 6]()

Para profundizar el análisis, se evaluó la cobertura específica de las regiones correspondientes al gen RAD17 dentro del cromosoma 5. La tabla filtrada muestra que la mayoría de las regiones asociadas a RAD17 presentan una cobertura por encima del umbral crítico (≥10 lecturas), con valores que en varios casos alcanzan el 100%. Esto sería indicativo de que las variantes identificadas en RAD17 pueden ser consideradas confiables en el contexto de este análisis, permitiendo avanzar hacia su interpretación clínica. Sin embargo, algunas regiones presentan cobertura subóptima o nula, lo que debe ser tenido en cuenta en la evaluación final de las variantes detectadas.

En conjunto, estos datos respaldan la selección de RAD17 como gen de interés para el análisis de variantes somáticas, dada su relevancia en mecanismos de reparación de ADN y la robustez de los datos obtenidos para la mayoría de sus regiones codificantes en este ensayo.
