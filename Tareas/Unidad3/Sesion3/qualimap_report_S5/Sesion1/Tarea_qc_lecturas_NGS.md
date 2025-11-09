# Tarea Unidad 3 Sesión 1: Control de calidad lecturas NGS

Fabiola Carmona Pastén
20 de octubre de 2025

## Conteo de líneas y traducción del control de calidad. 

Se realizó el conteo de cada uno de los archivos tanto crudos como filtrados correspondientes a S5, mediante el script *Contar_lineas.sh*:
```
for f in S5*.fastq.gz; do
  echo "------ $f ------"
  n=$(zcat $f | wc -l)
  echo "Número total de líneas: $n"
  echo "Número de reads: $(($n/4))"
done
```
Producto de lo anterior se obtuvo lo siguiente:
![Contar lineas.png](https://github.com/FabiolaCarmona/Tareas_BioinfRepro2025_FCP2/blob/main/Tareas/Unidad3/Sesion1/Imagenes%20U3S1/Contar%20lineas.png)

Posteriormente se ubica la lectura 3 de cada archivo, analizando la información que presenta. 
![Analisis tercera lectura.png](https://github.com/FabiolaCarmona/Tareas_BioinfRepro2025_FCP2/blob/main/Tareas/Unidad3/Sesion1/Imagenes%20U3S1/Analisis%20tercera%20lectura.png)

Un archivo FASTQ almacena información de secuenciación en bloques de cuatro líneas por cada lectura (read). Entre ellas se encuentran:

- **Línea 1: ID de la lectura**
  
Comienza con el símbolo “@” y es seguida por un identificador único. Este ID puede incluir información sobre la máquina de secuenciación, número de corrida, posición de la lectura, entre otros metadatos. Sirve para referenciar la secuencia y asociarla con su calidad.

- **Línea 2: Secuencia de bases**
  
Contiene la cadena de nucleótidos (A, T, C, G, N) que representa la secuencia obtenida. Esta es la información biológica principal, la base para análisis posteriores.

- **Línea 3: Separador**
  
Es una línea que sólo empieza con el símbolo “+”. Opcionalmente puede repetir el mismo identificador de la lectura. Separa la secuencia de nucleótidos y los valores de calidad.

- **Línea 4: Calidad de la lectura**
  
Contiene una cadena de caracteres ASCII donde cada símbolo codifica la calidad de la base correspondiente en la línea 2. La calidad mide la confianza del secuenciador para cada base y se traduce numéricamente mediante escalas Phred, restando un valor específico al código ASCII.

Para evaluar el efecto del filtrado de calidad, se compararon los valores de calidad Phred (Q) para las primeras 10 bases del tercer read en los archivos crudos y sus versiones filtradas. Los resultados se observan a continuación:

![Traducción archivo r1 crudo](https://github.com/FabiolaCarmona/Tareas_BioinfRepro2025_FCP2/blob/main/Tareas/Unidad3/Sesion1/Imagenes%20U3S1/Traduccion%20archivo%20r1%20crudo.png)
![Traducción archivo r1 filtrado](https://github.com/FabiolaCarmona/Tareas_BioinfRepro2025_FCP2/blob/main/Tareas/Unidad3/Sesion1/Imagenes%20U3S1/Traduccion%20archivo%20r1%20firltrado.png)
![Traducción archivo r2 crudo](https://github.com/FabiolaCarmona/Tareas_BioinfRepro2025_FCP2/blob/main/Tareas/Unidad3/Sesion1/Imagenes%20U3S1/Traduccion%20archivo%20r2%20crudo.png)
![Traducción archivo r2 filtrado](https://github.com/FabiolaCarmona/Tareas_BioinfRepro2025_FCP2/blob/main/Tareas/Unidad3/Sesion1/Imagenes%20U3S1/Traduccion%20archivo%20r2%20firltrado.png)

Los valores numéricos indican que el proceso de filtrado aumenta la calidad de las bases retenidas en las lecturas, al eliminar regiones que presentaban puntuaciones Q bajas.

## Comparación de valores Q con informe obtenido mediante FastQC
### S5_R1 crudo vs filtrado

Al analizar un análisis de calidad con FastQC y conversión de los scores Q (Phred) mediante código Python y Unix sobre los archivos S5_R1 en sus versiones cruda y filtrada se obtiene que el archivo crudo presentó **scores Q con marcada variabilidad**, desde valores bajos (Q=16, probabilidad de error ~1/40) hasta valores aceptables (Q=37, probabilidad de error ~1/5000), mientras que el archivo filtrado mostró **scores Q notablemente superiores y uniformes (Q=35–37)**, lo que indica una mejora sustancial en la fiabilidad de las lecturas. Asímismo, el informe FastQC respalda estos hallazgos, mostrando en el archivo crudo, **zonas con advertencias por baja calidad y presencia de adaptadores/duplicados**. El archivo filtrado pasa las verificaciones principales de calidad, mostrando **gráficos de calidad por base estables y sin artefactos significativos**.

### S5_R2 crudo vs filtrado

Al realizar el mismo analisis de calidad a través de FastQC y conversión de los scores Q en los archivos S5_R2 en sus versiones cruda y filtrada se pudo obtener que en el archivo crudo, varios **valores Q están en el rango bajo a medio (Q30–Q34), aunque la mitad final muestra calidad alta (Q37)**. Sin embargo, el archivo filtrado evidencia una **subida constante en las posiciones iniciales** y todos los **valores Q se ubican por sobre Q32, con la mayoría en Q36–Q37**, mostrando **mayor confiabilidad y menor dispersión**. Los reportes FastQC coinciden con lo observado en los valores Q donde el archivo crudo presenta **advertencias por calidad basal y contenido de adaptadores**, así como **duplicados**. El filtrado elimina la mayoría de estos problemas: la **calidad por base es consistentemente alta (>Q32), baja cantidad de adaptadores y duplicados**, pasando la mayoría de los controles.​

#### Control de calidad de datos NGS con FastQC
Se realizó un control de calidad de las lecturas crudas y filtradas empleando FastQC. Los siguientes apartados muestran los resultados más relevantes ilustrados con las gráficas principales del reporte FastQC.

1. **Gráficos de calidad por base**

Muestran la calidad (Phred score) en cada posición de la secuencia antes y después del filtrado. Se observa una notoria mejora tras el filtrado, eliminando tramos de baja calidad y manteniendo la uniformidad de valores altos (Q>30–35).

![Gráficos de calidad de bases](https://github.com/FabiolaCarmona/Tareas_BioinfRepro2025_FCP2/blob/main/Tareas/Unidad3/Sesion1/Imagenes%20U3S1/Graficos%20de%20calidad%20de%20bases.png)

2. **Distribución de contenido de bases**

Refleja la proporción de cada nucleótido por posición. En las muestras crudas se observan fluctuaciones y posibles sesgos, mientras que tras el filtrado las proporciones se estabilizan, indicando una limpieza eficiente de artefactos y errores de secuenciación.

![Distribución de contenido de bases](https://github.com/FabiolaCarmona/Tareas_BioinfRepro2025_FCP2/blob/main/Tareas/Unidad3/Sesion1/Imagenes%20U3S1/Distribucion%20de%20contenido%20de%20bases.png)

3. **Distribución de longitud de secuencias**

Permite evaluar la homogeneidad de la librería. Antes del filtrado, la distribución es estrecha (longitud uniforme), pero después del filtrado se observa mayor rango de longitudes, reflejo de la remoción de regiones de baja calidad y trimming.

![Distribución de longitud de secuencias](https://github.com/FabiolaCarmona/Tareas_BioinfRepro2025_FCP2/blob/main/Tareas/Unidad3/Sesion1/Imagenes%20U3S1/Distribucion%20de%20longitud%20de%20secuencias.png)

4. **Contenido de adaptador**

El contenido de adaptador es alto en los archivos crudos e inexistente tras el filtrado, evidenciando la eliminación efectiva de secuencias contaminantes.

![Contenido de adaptador](https://github.com/FabiolaCarmona/Tareas_BioinfRepro2025_FCP2/blob/main/Tareas/Unidad3/Sesion1/Imagenes%20U3S1/Contenido%20de%20adaptador.png)

En síntesis, la evidencia gráfica y numérica indica una clara mejora en la calidad global de los datos tras el filtrado, validando la utilidad de las etapas de trimming y limpieza en el preprocesamiento para análisis genómicos posteriores.

