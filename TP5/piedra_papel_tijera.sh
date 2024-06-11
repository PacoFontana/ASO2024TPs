#!/bin/bash

# Muestro un menu dando la posibilidad al usuario a elegir entre piedra, papel o tijera
# Creo un bulce while que verifique si la respuesta del usuario esta dentro de lo logico
echo -e "Ingresa tu estrategia:\n(1): Piedra\n(2): Papel\n(3): Tijera"
while [[ $usuario -lt 1 || $usuario -gt 3 ]];
do
read -p "[>]: " usuario

# Si la respuesta esta mal, le salta error, sino sigue con el programa..
if [[ $usuario -lt 1 || $usuario -gt 3 ]]; then
    echo -e "\nError: La opcion elegida no existe, vuelve a intentarlo:\n(1): Piedra\n(2): Papel\n(3): Tijera"
fi
done

# Genero un numero aleatorio entre 1 y 3 para que sea la estrategia elegida por el programa
programa=$(( ( RANDOM % 3 ) + 1 ))

# Cree un arreglo y dos variables para ingresar dentro las opciones elegidas en forma de texto
opciones=("Piedra" "Papel" "Tijera") # usuario - 1 = 0 (piedra) o 1 (papel) o (2) tijera (le resto -1 porque el arreglo inicia en 0)
usuario_texto=${opciones[$((usuario-1))]}
programa_texto=${opciones[$((programa-1))]}

# Muestro la eleccion de cada uno
echo -e "Usuario: $usuario_texto vs Computadora: $programa_texto"

# Verifico si el usuario gana en alguna de las ocasiones posibles, de lo contrario pierde o empata..
if [ $usuario -eq $programa ]; then
    echo "¡Empate!"
elif [ $usuario -eq 1 ] && [ $programa -eq 3 ] || [ $usuario -eq 2 ] && [ $programa -eq 1 ] || [ $usuario -eq 3 ] && [ $programa -eq 2 ]; then
    echo "¡Ganaste!"
else
    echo "¡Perdiste!"
fi