#!/bin/bash
# Mi primer Script
echo "Hola este es mi primer script en bash"
date
pwd 
echo "Tu directorio actual es: $(pwd)"
name="Carlos"
echo "hola $name"
a=5
b=3
let sum=a+b
echo "la suma es $sum"
sum2=$((a+b))
echo "Lasuma es $sum2"
