#!/bin/bash

# Directorio raíz que contiene las carpetas de repositorios
ROOT_DIR=$1

if [ -z "$ROOT_DIR" ]; then
    echo "Uso: $0 <directorio raíz>"
    exit 1
fi

# Recorre cada carpeta dentro del directorio raíz
for dir in "$ROOT_DIR"/*; do
    if [ -d "$dir/.git" ]; then
        echo "Entrando al repositorio: $dir"
        cd "$dir" || exit

        # Agregar cambios y hacer commit
        git add .
        git commit -m "script push" || echo "Nada que commitear en $dir"

        # Intentar hacer push, manejar errores de sincronización
        git push || {
            echo "Fallo el push. Intentando hacer git pull y reintentando en $dir"
            git pull --rebase
            git push
        }

        cd - >/dev/null || exit
    else
        echo "No es un repositorio Git: $dir"
    fi
done

echo "Script terminado."

