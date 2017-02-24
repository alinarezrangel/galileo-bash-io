#!/bin/bash
# encode: utf-8

# Por Alejandro Linarez Rangel
# Manejador en bash para los GPIOs comunes de Galileo Gen.1
# Usos:

# userLed.sh (enable|disable|write) (1|0)

action="$1"

if [ "$action" = "enable" ]
	then
		echo -n "3" > /sys/class/gpio/export
		echo -n "out" > /sys/class/gpio/gpio3/direction
		echo -n "strong" > /sys/class/gpio/gpio3/drive
		echo -n "0" > /sys/class/gpio/gpio3/value
fi
if [ "$action" = "disable" ]
	then
		echo -n "3" > /sys/class/gpio/unexport
fi
if [ "$action" = "write" ]
	then
		echo -n "$2" > /sys/class/gpio/gpio3/value
fi

