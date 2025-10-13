Ejercicio 1:
Pantallazo del archivo modificado con mis datos y fecha de modificación
![](C:\Users\fabio\AppData\Roaming\marktext\images\2025-09-01-21-10-17-image.png)
Pantallazo del terminal con el resultado ```git status```mostrando que los datos fueron confirmados
![](C:\Users\fabio\AppData\Roaming\marktext\images\2025-09-01-21-10-32-image.png)

Ejercicio 2:

1. ¿Cuántos pasos tiene este script?

   El script tiene 7 pasos principales desde el alineamiento de lecturas hasta el análisis de poblaciones usando Stacks. 
- Definición de variables y lista de archivos.

- Alineamiento con gsnap y conversión a BAM.

- Procesamiento con pstacks para cada muestra.

- Armado de la lista de muestras para cstacks.

- Construcción del catálogo con cstacks.

- Ejecución de sstacks para relacionar cada muestra con el catálogo.

- Cálculo de estadísticas con populations.

2. ¿Si quisieras correr este script y que funcionara en tu propio equipo, qué línea deberías cambiar y a qué?

La línea que define ```src=$HOME/research/project``` debe ser cambiada para reflejar la ubicación real de los archivos. En este caso debería ser ```src=/home/tu_usuario/ruta/a/proyecto```

3. ¿A qué equivale $HOME?

   ```$HOME``` es una variable de entorno en sistemas Unix/Linux que representa el directorio personal del usuario

4. ¿Qué paso del análisis hace el programa gsnap?

```gsnap```` en este contexto realiza la alineación de las lecturas de secuenciación contra un genoma de referencia, generando archivos SAM con los resultados.

5. ¿Qué hace en términos generales cada uno de los loops?

- El primer loop alinea los archivos y los convierte de SAM a BAM, luego elimina el SAM.

- El segundo loop ejecuta pstacks para cada archivo BAM, automatizando la identificación de loci.

- El tercer loop arma una cadena de argumentos para cstacks y ejecuta sstacks para cruzar resultados entre muestras.
