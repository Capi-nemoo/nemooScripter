#!/bin/bash

# Lista de mensajes
mensajes=(
  "Cuando tu Linux se cuelga, pero el adderall te dice que sigas intentando. #Desesperación"
  "Esa sensación cuando tu computadora se apaga y tu esperanza se va con ella. #ApocalipsisDigital"
  "Vivir en un mundo donde el kernel no reconoce tu hardware es como un amor no correspondido. #TristezaLinux"
  "¿Trabajar en Linux o en un universo paralelo donde todos son felices? A veces, la segunda opción parece más viable. #Escape"
  "A veces, creo que mi computadora tiene más problemas emocionales que yo. #LinuxLover"
  "Cuando el adderall te da la energía para compilar, pero tu código no compila. #Tragedia"
  "Si cada línea de código es una batalla, estoy en la guerra del siglo con mi Linux. #Desesperación"
  "Me siento como un zombie buscando trabajo en Linux: ya no tengo emociones, solo ganas de un café. #ApocalipsisLaboral"
  "Linux y adderall: dos cosas que me mantienen en la zona, aunque a veces me descontrolen. #AmorYDesesperación"
  "Cuando intentas hacer algo productivo en Linux, pero terminas llorando en la terminal. #CrisisExistencial"
  "La única relación estable en mi vida es con mi distro de Linux… y eso dice mucho. #Desesperación"
  "Ese momento en que tu script se ejecuta y sientes que el universo finalmente te abraza. #AlegríaMomentánea"
  "Mejorando mi vida con Aderall y comandos de Linux, un día a la vez. #Sobreviviente"
  "Trabajando en Linux: donde las esperanzas y los errores 404 van de la mano. #Desesperación"
  "A veces creo que Linux es como un amigo que siempre necesita más de mí, y yo estoy exhausto. #RelacionesComplicadas"
  "Si la vida fuera un sistema operativo, estaría en el modo de recuperación todo el tiempo. #TristezaExistencial"
  "A veces, el adderall me hace sentir como un hacker de élite… hasta que me doy cuenta de que solo soy yo. #FelicidadMomentánea"
  "El amor por Linux es como un romance tóxico: sabes que no es perfecto, pero no puedes dejarlo ir. #Drama"
  "¿Por qué el trabajo es tan difícil? Debería haber un comando ‘sudo fix my life’. #Desesperación"
  "Cuando me siento en mi terminal, todo lo que quiero es un poco de amor… y que el adderall funcione. #BúsquedaDeLaFelicidad"
)

# Función para mostrar mensaje aleatorio con cowsay
function mostrar_mensaje() {
  local mensaje_aleatorio="${mensajes[$RANDOM % ${#mensajes[@]}]}"
  echo "$mensaje_aleatorio" | cowsay
}

# Verificar si estamos en un repositorio git
if git rev-parse --is-inside-work-tree &>/dev/null; then
  mostrar_mensaje
  read -p "¿Quieres agregar todos los archivos al commit? (s/n): " respuesta

  if [[ "$respuesta" =~ ^[sS]$ ]]; then
    git add .
    mostrar_mensaje
    read -p "Ingresa el mensaje del commit: " mensaje_commit
    git commit -m "$mensaje_commit"
    mostrar_mensaje
    git push
    mostrar_mensaje
  else
    echo "No se agregó ningún archivo."
  fi
else
  echo "Este directorio no es un repositorio de Git. Creando uno..."
  mostrar_mensaje
  git init
  echo "# Nuevo repositorio" > README.md
  git add README.md
  git commit -m "Initial commit"
  git branch -M main
  gh repo create --public --source=. --remote=origin
  git push -u origin main
  mostrar_mensaje
  echo "Repositorio creado exitosamente."
fi
