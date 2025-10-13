Tarea 2 Respuestas FCP
1. ¿Cuántos pasos tiene este script?  6 pasos principales

Alineamiento con GSnap y conversión a BAM (primer for loop). Correr 
pstacks sobre los BAM (segundo for loop). Crear la lista de archivos 
para cstacks (tercer for loop). Construir el catálogo con cstacks. 
Correr sstacks sobre cada muestra (cuarto for loop).
Calcular estadísticas poblacionales con populations

2. ¿Si quisieras correr este script y que funcionara en tu propio equipo, que linea deberias cambiar y a qué?
Cambiar la linea
src=$HOME/research/project
a lo siguiente:
src=/home/fabiola/Bioinfinv/Tareas_BioinfRepro2025_FCP

3. ¿a que equivale la variable $HOME?
Es una variable de entorno de Linux que apunta al directorio de usuario.

4. ¿Qué paso del análisis hace el programa GSnap? gsnap es un alineador 
de secuencias, toma los archivos .fq y los alinea contra el genoma de 
referencia, generando archivos .sam Luego se convierten a .bam con 
samtools que es un formato binario mas eficiente

5.  ¿Qué hace en términos 
generales cada uno de los loops (for)? Primer loop: for file in $files 
Alinea cada archivo de secuencias (.fq) con gsnap, lo convierte a .bam y 
borra el .sam intermedio. Segundo loop: for file in $files Corre pstacks 
para cada BAM, identificando pilas de lecturas coincidentes y preparando 
datos para Stacks. Tercer loop: for file in $files Crea una cadena 
(samp) que contiene la lista de archivos que se usarán en cstacks. 
Cuarto loop: for file in $files
Corre sstacks para comparar cada muestra contra el catálogo de loci construido con cstacks.

