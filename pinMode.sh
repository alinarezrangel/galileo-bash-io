#!/bin/bash
# encode: utf-8

# Por Alejandro Linarez Rangel
# Manejador en bash para los GPIOs comunes de Galileo Gen.1
# Usos:

# pinMode.sh pin special mode type
# pin: 0-A5
# mode: (in|out)
# type: (strong|pullup|pulldown|hiz)
# special: (pwm|analog|digital|serial)

# pinMode.sh pin digital mode type   # digital IO
# pinMode.sh pin analog              # analog I
# pinMode.sh pin pwm freq duty       # pwm O

arduino_pin=$1
digital="1"
gpio=39
gpioA=55
gpioAst=1
gpioI2C_MUX=0

if [ "$2" != "digital" ]
	then
		digital="0"
fi

case "$arduino_pin" in
	0) #echo "Pin 0 de arduino"
		if [ "$digital" = "1" ]
		then
			gpio=50
			gpioA=40
			gpioAst=1
		else
			gpio=50
			gpioA=40
			gpioAst=0
			echo "/dev/ttyS0"
		fi
		;;
	1) #echo "Pin 1 de arduino"
		if [ "$digital" = "1" ]
		then
			gpio=51
			gpioA=41
			gpioAst=1
		else
			gpio=51
			gpioA=41
			gpioAst=0
			echo "/dev/ttyS0"
		fi
		;;
	2) #echo "Pin 2 de arduino"
		gpio=32
		gpioA=31
		gpioAst=1
		;;
	3) #echo "Pin 3 de arduino"
		if [ "$digital" = "1" ]
		then
			gpio=15
			gpioA=30
			gpioAst=0
		else
			gpio=""
			gpioA=""
			gpioAst=""
			echo -n "3" > /sys/class/pwm/pwmchip0/export
			echo -n "1" > /sys/class/pwm/pwmchip0/pwm3/enable
			echo -n "$4" > /sys/class/pwm/pwmchip0/pwm3/period
			echo -n "$5" > /sys/class/pwm/pwmchip0/pwm3/duty_cycle
		fi
		;;
	4) #echo "Pin 4 de arduino"
		gpio=28
		gpioA=""
		gpioAst=""
		;;
	5) #echo "Pin 5 de arduino"
		if [ "$digital" = "1" ]
		then
			gpio=17
			gpioA=""
			gpioAst=""
		else
			gpio=""
			gpioA=""
			gpioAst=""
			echo -n "5" > /sys/class/pwm/pwmchip0/export
			echo -n "1" > /sys/class/pwm/pwmchip0/pwm5/enable
			echo -n "$4" > /sys/class/pwm/pwmchip0/pwm5/period
			echo -n "$5" > /sys/class/pwm/pwmchip0/pwm5/duty_cycle
		fi
		;;
	6) #echo "Pin 6 de arduino"
		if [ "$digital" = "1" ]
		then
			gpio=24
			gpioA=""
			gpioAst=""
		else
			gpio=""
			gpioA=""
			gpioAst=""
			echo -n "6" > /sys/class/pwm/pwmchip0/export
			echo -n "1" > /sys/class/pwm/pwmchip0/pwm6/enable
			echo -n "$4" > /sys/class/pwm/pwmchip0/pwm6/period
			echo -n "$5" > /sys/class/pwm/pwmchip0/pwm6/duty_cycle
		fi
		;;
	7) #echo "Pin 7 de arduino"
		gpio=27
		gpioA=""
		gpioAst=""
		;;
	8) #echo "Pin 8 de arduino"
		gpio=26
		gpioA=""
		gpioAst=""
		;;
	9) #echo "Pin 9 de arduino"
		if [ "$digital" = "1" ]
		then
			gpio=19
			gpioA=""
			gpioAst=""
		else
			gpio=""
			gpioA=""
			gpioAst=""
			echo -n "1" > /sys/class/pwm/pwmchip0/export
			echo -n "1" > /sys/class/pwm/pwmchip0/pwm1/enable
			echo -n "$4" > /sys/class/pwm/pwmchip0/pwm1/period
			echo -n "$5" > /sys/class/pwm/pwmchip0/pwm1/duty_cycle
		fi
		;;
	10) #echo "Pin 10 de arduino"
		if [ "$digital" = "1" ]
		then
			gpio=16
			gpioA=42
			gpioAst=1
		else
			gpio=""
			gpioA=""
			gpioAst=""
			echo -n "7" > /sys/class/pwm/pwmchip0/export
			echo -n "1" > /sys/class/pwm/pwmchip0/pwm7/enable
			echo -n "$4" > /sys/class/pwm/pwmchip0/pwm7/period
			echo -n "$5" > /sys/class/pwm/pwmchip0/pwm7/duty_cycle
		fi
		;;
	11) #echo "Pin 11 de arduino"
		if [ "$digital" = "1" ]
		then
			gpio=25
			gpioA=43
			gpioAst=1
		else
			gpio=""
			gpioA=""
			gpioAst=""
			echo -n "4" > /sys/class/pwm/pwmchip0/export
			echo -n "1" > /sys/class/pwm/pwmchip0/pwm4/enable
			echo -n "$4" > /sys/class/pwm/pwmchip0/pwm4/period
			echo -n "$5" > /sys/class/pwm/pwmchip0/pwm4/duty_cycle
		fi
		;;
	12) #echo "Pin 12 de arduino"
		gpio=38
		gpioA=54
		gpioAst=1
		;;
	13) #echo "Pin 13 de arduino"
		gpio=39
		gpioA=55
		gpioAst=1
		;;
	A0) #echo "Pin A0 de arduino"
		if [ "$digital" = "1" ]
		then
			gpio=44
			gpioA=37
			gpioAst=1
		else
			gpio=""
			gpioA=37
			gpioAst=0
		fi
		;;
	A1) #echo "Pin A1 de arduino"
		if [ "$digital" = "1" ]
		then
			gpio=45
			gpioA=36
			gpioAst=1
		else
			gpio=""
			gpioA=36
			gpioAst=0
		fi
		;;
	A2) #echo "Pin A2 de arduino"
		if [ "$digital" = "1" ]
		then
			gpio=46
			gpioA=23
			gpioAst=1
		else
			gpio=""
			gpioA=23
			gpioAst=0
		fi
		;;
	A3) #echo "Pin A3 de arduino"
		if [ "$digital" = "1" ]
		then
			gpio=47
			gpioA=22
			gpioAst=1
		else
			gpio=""
			gpioA=22
			gpioAst=0
		fi
		;;
	A4) #echo "Pin A4 de arduino"
		gpioI2C_MUX=1
		if [ "$digital" = "1" ]
		then
			gpio=48
			gpioA=21
			gpioAst=1
		else
			gpio=""
			gpioA=21
			gpioAst=0
		fi
		;;
	A5) #echo "Pin A5 de arduino"
		gpioI2C_MUX=1
		if [ "$digital" = "1" ]
		then
			gpio=49
			gpioA=20
			gpioAst=1
		else
			gpio=""
			gpioA=20
			gpioAst=0
		fi
		;;
esac
buf="n"
if [ "$gpio" != "" ] && [ "$gpioA" != "" ] && [ "$gpioAst" != "" ]
then
	echo -n "$gpio" > /sys/class/gpio/export
	echo -n "$4" > "/sys/class/gpio/gpio$gpio/direction"
	echo -n "$5" > "/sys/class/gpio/gpio$gpio/drive"
	echo -n "$gpioA" > /sys/class/gpio/export
	echo -n "out" > "/sys/class/gpio/gpio$gpioA/direction"
	echo -n "strong" > "/sys/class/gpio/gpio$gpioA/drive"
	echo -n "$gpioAst" > "/sys/class/gpio/gpio$gpioA/value"
	buf="s"
fi
if [ "$gpio" = "" ] && [ "$gpioA" != "" ] && [ "$gpioAst" != "" ] && [ "$buf" = "n" ]
then
	echo -n "$gpioA" > /sys/class/gpio/export
	echo -n "out" > "/sys/class/gpio/gpio$gpioA/direction"
	echo -n "strong" > "/sys/class/gpio/gpio$gpioA/drive"
	echo -n "$gpioAst" > "/sys/class/gpio/gpio$gpioA/value"
	buf="s"
fi
if [ "$gpio" != "" ] && [ "$gpioA" = "" ] && [ "$gpioAst" = "" ] && [ "$buf" = "n" ]
then
	echo -n "$gpio" > /sys/class/gpio/export
	echo -n "$4" > "/sys/class/gpio/gpio$gpio/direction"
	echo -n "$5" > "/sys/class/gpio/gpio$gpio/drive"
fi
if [ "$gpioI2C_MUX" != "" ]
then
	echo -n "29" > /sys/class/gpio/export
	echo -n "out" > /sys/class/gpio/gpio29/direction
	echo -n "strong" > /sys/class/gpio/gpio29/drive
	echo -n "1" > /sys/class/gpio/gpio29/value
fi

