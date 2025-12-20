#!/bin/bash
num=25
if [ $num -ge 10 ]; then 
	echo "numero mayor o igual que 10" 
elif  [ $num -eq 0 ]; then 
	echo "numero igual a 0"
else 
	echo "condicion por defecto"
fi
read -p "elige una opcion (1/2/3): " option 
case $option in 
	1) echo "elegiste el 1";;
	2) echo "elegiste 2";;
	3) echo "elegiste 3";;
	*) echo "opticion no valida";;
esac
name=Carlos_Campo
if [ -n $name ]; then
	echo "el nombre no existe"
fi
if [ $num -ge 18 ] && [ -n $name ]; then 
	echo "mayor de edad" 
fi
if [ -e "./script.sh" ]; then 
	echo "el archivo existe"
fi
