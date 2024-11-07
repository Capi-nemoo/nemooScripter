#!/bin/bash

# Lista de paquetes instalados desde los repositorios oficiales
echo "Paquetes instalados desde los repositorios oficiales:"
pacman -Qe | awk '{print $1}' > official_packages.txt
cat official_packages.txt

echo ""
echo "----------------------"
echo ""

# Lista de paquetes instalados manualmente (AUR o localmente)
echo "Paquetes instalados manualmente (AUR o local):"
pacman -Qm | awk '{print $1}' > manual_packages.txt
cat manual_packages.txt

echo ""
echo "----------------------"
echo ""

# Mostrar ambos archivos si necesitas guardar las listas
echo "Listas guardadas en 'official_packages.txt' y 'manual_packages.txt'."

# Opcional: eliminar archivos si no quieres guardar las listas
# rm official_packages.txt manual_packages.txt

