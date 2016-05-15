#!/bin/bash
# encode: utf-8

# Por Alejandro Linarez Rangel
# Manejador en bash para los GPIOs comunes de Galileo Gen.1
# Usos:

# analogWrite.sh pin value(duty)

arduino_pin=$1
digital="1"
gpio=39
gpioA=55
gpioAst=1
gpioI2C_MUX=0

case $arduino_pin in
	3) #echo "Analog Write en el pin"
		gpio=3
		;;
	5) #echo "Analog Write en el pin"
		gpio=5
		;;
	6) #echo "Analog Write en el pin"
		gpio=6
		;;
	9) #echo "Analog Write en el pin"
		gpio=1
		;;
	10) #echo "Analog Write en el pin"
		gpio=7
		;;
	11) #echo "Analog Write en el pin"
		gpio=4
		;;
esac
echo -n "$2" > "/sys/class/pwm/pwmchip0/pwm$gpio/duty_cycle"

