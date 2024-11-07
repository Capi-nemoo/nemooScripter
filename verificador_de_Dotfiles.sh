#!/bin/bash

# Lista de archivos y carpetas a verificar, si no entiendes qué es cada uno, pues ni modo
FILES=(
    "~/.config/alacritty/alacritty.yml"
    "~/.config/btop/"
    "~/.config/conky/conky.conf"
    "~/.conkyrc"
    "~/.config/copyq/"
    "~/.config/dunst/dunstrc"
    "~/.config/fastfetch/config.conf"
    "~/.config/i3/config"
    "~/.config/i3blocks/config"
    "~/.config/i3status/config"
    "~/.config/kitty/kitty.conf"
    "~/.config/nvim/init.vim"
    "~/.config/nvim/init.lua"
    "~/.config/nitrogen/"
    "~/.config/obsidian/"
    "~/.config/picom/picom.conf"
    "~/.config/polybar/config"
    "~/.config/ranger/rc.conf"
    "~/.config/rofi/config.rasi"
    "~/.config/starship.toml"
    "~/.config/yadm/"
)

# Aca revisamos cada archivo para ver si existe o no
for file in "${FILES[@]}"; do
    # expandimos la variable porque si no Bash la toma literal
    eval file_path="$file"

    if [ -e "$file_path" ]; then
        echo "Encontrado: $file_path" # Todo bien, existe
    else
        echo "No encontrado: $file_path" # Si no existe, pues te avisa y luego ves qué haces
    fi
done

echo "Revisión completada, si algo falta pues ya sabes qué hacer." # Mensaje pa que sepas que ya acabó

