#!/bin/bash

# Pregunto al usuario que nombre quiere investigar
echo -e "Ingresa un nombre para determinar a qué género pertenece"
read -p "[>]: " nombre

# Obtengo la respuesta de la API
respuesta=$(curl -s "https://api.genderize.io/?name=${nombre}")

# Extraer el valor de "gender"
genero=$(echo $respuesta | jq -r '.gender')

# Creo un if para pasar de "male" a "Masculino" y "female" a "Femenino" porque que de la respuesta en ingles no tiene sentido..
if [ "$genero" == "null" ]; then
    traducido="Desconocido"
elif [ "$genero" == "male" ]; then
    traducido="Masculino"
else
    traducido="Femenino"
fi

# Verifico que "nombre" sea lógico, la API devuelve "null" cuando el nombre no es válido
if [ "$genero" != "null" ]; then
    echo "El nombre '$nombre' probablemente corresponde al género: $traducido."
else
    echo "No se pudo determinar el género para el nombre '$nombre'."
fi