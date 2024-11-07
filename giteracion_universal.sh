#!/bin/bash

# Pedimos el mensaje del commit
read -p "Escribe el mensaje para el commit: " commit_message

# Agregar todos los cambios
git add .

# Hacer el commit con el mensaje proporcionado
git commit -m "$commit_message"

# Hacer el push al repositorio remoto
git push

# Mensaje final para confirmar que se hizo el push
echo "Cambios agregados, commiteados y pusheados. ¡Listo!"

