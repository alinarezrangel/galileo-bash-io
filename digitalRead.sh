#!/bin/bash
# encode: utf-8

# Por Alejandro Linarez Rangel
# Manejador en bash para los GPIOs comunes de Galileo Gen.1
# Usos:

# digitalRead.sh pin

arduino_pin=$1
digital="1"
gpio=39
gpioA=55
gpioAst=1
gpioI2C_MUX=0

case $arduino_pin in
	0) #echo "Fijando pin"
		gpio=50
		;;
	1) #echo "Fijando pin"
		gpio=51
		;;
	2) #echo "Fijando pin"
		gpio=32
		;;
	3) #echo "Fijando pin"
		gpio=15
		;;
	4) #echo "Fijando pin"
		gpio=28
		;;
	5) #echo "Fijando pin"
		gpio=17
		;;
	6) #echo "Fijando pin"
		gpio=24
		;;
	7) #echo "Fijando pin"
		gpio=27
		;;
	8) #echo "Fijando pin"
		gpio=26
		;;
	9) #echo "Fijando pin"
		gpio=19
		;;
	10) #echo "Fijando pin"
		gpio=16
		;;
	11) #echo "Fijando pin"
		gpio=25
		;;
	12) #echo "Fijando pin"
		gpio=38
		;;
	13) #echo "Fijando pin"
		gpio=39
		;;
	A0) #echo "Fijando pin"
		gpio=44
		;;
	A1) #echo "Fijando pin"
		gpio=45
		;;
	A2) #echo "Fijando pin"
		gpio=46
		;;
	A3) #echo "Fijando pin"
		gpio=47
		;;
	A4) #echo "Fijando pin"
		gpio=48
		;;
	A5) #echo "Fijando pin"
		gpio=49
		;;
esac
read_vl=0
cat "/sys/class/gpio/gpio$gpio/value"

