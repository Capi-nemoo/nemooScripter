#!/bin/bash

# Archivo de salida
output_file="installed_packages.md"

# etc
echo "# List of Packages" > "$output_file"
echo "" >> "$output_file"

# Listar paquetes instalados manualmente por pacman
echo "## Pacman Packages" > "$output_file"

pacman -Qqe >> "$output_file"

echo "" >> "$output_file"

# Listar paquetes instalados manualmente desde AUR (yay)
echo "## AUR Packages " >> "$output_file"
yay -Qqe | grep -v "$(pacman -Qqe)" >> "$output_file"

echo "List saved in $output_file"

