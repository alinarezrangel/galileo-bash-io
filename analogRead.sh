#!/bin/bash
# encode: utf-8

# Por Alejandro Linarez Rangel
# Manejador en bash para los GPIOs comunes de Galileo Gen.1
# Usos:

# analogRead.sh pin

arduino_pin=$1
digital="1"
gpio=39
gpioA=55
gpioAst=1
gpioI2C_MUX=0

case $arduino_pin in
	A0) cat "/sys/bus/iio/devices/iio\:device0/in_voltage0_raw"
		;;
	A1) cat "/sys/bus/iio/devices/iio\:device0/in_voltage1_raw"
		;;
	A2) cat "/sys/bus/iio/devices/iio\:device0/in_voltage2_raw"
		;;
	A3) cat "/sys/bus/iio/devices/iio\:device0/in_voltage3_raw"
		;;
	A4) cat "/sys/bus/iio/devices/iio\:device0/in_voltage4_raw"
		;;
	A5) cat "/sys/bus/iio/devices/iio\:device0/in_voltage5_raw"
		;;
esac

