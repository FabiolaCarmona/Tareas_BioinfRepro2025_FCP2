#!/bin/bash

output_file="../resource/explicacion_fam.txt"

cat << EOF > "$output_file"
Descripción de columnas en un archivo PLINK .fam:

Columna 1: Family ID (FID) - Identificador del grupo familiar.
Columna 2: Individual ID (IID) - Identificador único del individuo.
Columna 3: Paternal ID - ID del padre (0 si desconocido o no registrado).
Columna 4: Maternal ID - ID de la madre (0 si desconocido o no registrado).
Columna 5: Sex - Sexo codificado como 1=masculino, 2=femenino, 0=desconocido.
Columna 6: Phenotype - Fenotipo codificado como 1=control, 2=caso, -9 o 0=desconocido.

Información contenida en el archivo .fam:
- Identificadores familiares e individuales.
- Relaciones familiares (padres).
- Sexo del individuo.
- Estado fenotípico (caso/control/desconocido).

Información NO contenida en el archivo .fam:
- Datos genéticos (genotipos).
- Información demográfica detallada (edad, etnia, etc.).
- Información clínica o ambiental.
- Variables cuantitativas o continuas (a menos que se modifique la codificación del fenotipo).

EOF

echo "Archivo de explicación generado en $output_file"

