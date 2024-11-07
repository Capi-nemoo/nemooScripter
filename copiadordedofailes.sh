#!/bin/bash

# donde se va a copiar todo osea donde se ejecute, lo que pongas después del script ese es el destino
DEST_DIR="$1"

# checo si pusiste algo, si no pusiste nada pues que te diga q lo pongas porque sino pues no sabe donde copiar
if [ -z "$DEST_DIR" ]; then
    echo "Uso: $0 /ruta/al/destino" # a te grita cmo usar el script si no le pones destino bvio
    exit 1
fi

# aca va la lista de dotfiles, le pones lo q quieres copiar pa no escribir tanto el cp siempre
DOTFILES=(~/.bashrc ~/.vimrc ~/.zshrc ~/.config/nvim/init.vim) # cambia esto si usas otras cosas

# se crea la carpeta donde va a meter los archivos, si ya existe pues ni pedo, no pasa nada

mkdir -p "$DEST_DIR"

# aqui empieza la magia, se supone q agarra cada archivo de la lista esa q hicimos y lo copia
for file in "${DOTFILES[@]}"; do
    cp -r "$file" "$DEST_DIR" # y aqui copia y listo

    echo "Copiado $file a $DEST_DIR" # para q sepas q hizo algo y no pienses q se trabó
done

echo "Todos los dotfiles han sido copiados a $DEST_DIR" # ya acabócmamo

