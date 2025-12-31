#!/bin/bash

# 1. Validación: Verificar si el usuario pasó la carpeta madre
if [ -z "$1" ]; then
    echo "❌ Error: Debes indicar la carpeta madre."
    echo "Uso: ./merge_recursive_out.sh /ruta/a/la/carpeta_madre"
    exit 1
fi

# Limpiamos el path (quitamos el slash final si existe)
PARENT_DIR="${1%/}"

# 2. Definir la carpeta de SALIDA (Un nivel arriba de la carpeta madre)
# 'dirname' nos da la ruta del directorio que contiene a nuestra carpeta madre.
OUTPUT_DIR="$(dirname "$PARENT_DIR")"

echo "📂 Procesando carpeta madre: $PARENT_DIR"
echo "📂 Los PDFs se guardarán en: $OUTPUT_DIR"
echo "----------------------------------------"

# 3. Bucle: Iterar sobre cada subcarpeta
for SUBFOLDER_PATH in "$PARENT_DIR"/*; do

    if [ -d "$SUBFOLDER_PATH" ]; then
        
        FOLDER_NAME=$(basename "$SUBFOLDER_PATH")
        
        # AQUÍ ESTÁ EL CAMBIO:
        # El archivo de salida va a OUTPUT_DIR (afuera), no a PARENT_DIR (adentro)
        OUTPUT_FILE="${OUTPUT_DIR}/${FOLDER_NAME}.pdf"

        # Verificamos si hay PDFs dentro de la subcarpeta
        if ls "$SUBFOLDER_PATH"/*.pdf 1> /dev/null 2>&1; then
            
            echo "   🔹 Procesando: '$FOLDER_NAME'..."
            
            # Ejecutamos Ghostscript
            gs -dNOPAUSE -dBATCH -q -sDEVICE=pdfwrite -sOutputFile="$OUTPUT_FILE" "$SUBFOLDER_PATH"/*.pdf
            
            if [ $? -eq 0 ]; then
                echo "      ✅ Generado exitosamente: $OUTPUT_FILE"
            else
                echo "      ⚠️ Error al unir PDFs de: $FOLDER_NAME"
            fi
            
        else
            echo "   ⚠️ La carpeta '$FOLDER_NAME' no tiene PDFs. Se omite."
        fi
    fi
done

echo "----------------------------------------"
echo "🏁 Proceso finalizado."