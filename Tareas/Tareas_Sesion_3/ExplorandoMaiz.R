# ExplorandoMaiz.R
# Script para cargar archivo maizteocintle_SNP50k_meta_extended.txt y explorar su contenido

# Establecer directorio de trabajo a la carpeta del script 
# setwd("C:/Users/fabio/Desktop/Doctorado/Semestre 2/Bioinformatica/Sesion 3/PracUni1Ses3/maices/bin")

# Ruta relativa al archivo de datos
archivo_meta <- "../meta/maizteocintle_SNP50k_meta_extended.txt"

# Cargar datos, asumiendo tabulaciones y cabecera
meta_data <- read.delim(archivo_meta, header = TRUE, stringsAsFactors = TRUE)

# Mostrar el tipo de objeto creado
print(paste("Clase del objeto cargado:", class(meta_data)))

# Mostrar las primeras 6 filas
print("Primeras 6 filas:")
print(head(meta_data))

# Inspeccionar estructura rápida
print("Estructura del objeto:")
str(meta_data)
