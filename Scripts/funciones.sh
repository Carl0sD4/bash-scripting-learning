my_funtion() {
	echo "hola de la desde la funcion"
}

my_funtion

my_funtion_with_params() {
	echo "hola $1"
}

my_funtion_with_params Carlitos

name=Carlos

my_funtion_2() {
	msj=", mundito"
	echo "hola $msj $name"
}

echo "hola desde fuera $msj"

my_funtion_2


my_funtion_with_return(){
	return 1
}

my_funtion_with_return
echo $?
