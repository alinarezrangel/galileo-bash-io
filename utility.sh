#!/bin/bash
# encode: utf-8

# Por Alejandro Linarez Rangel
# Manejador en bash para los GPIOs comunes de Galileo Gen.1
# Usos:

# setPin.sh (INTpin) (BOOLdigital) (STRorden) args...
# setPin.sh x y c z w (in|out) (strong|pullup|pulldown|hiz)
# X: pin
# Y: si es digital(para cuando es 0, si es un a entrada analoga la fija a tal
# y si es PWM lo fija a tal)
# Z: para PWM, periodo
# W: para PWM, ciclo
# in|out: in para entrada y out para salida
# strong|pullup|pulldown|hiz: strong para salidas, pullup,pulldown,hiz para
# entradas.
# C: pinMode,pinModeInLed,digitalWrite,digitalWriteInLed,analogWrite,
# digitalRead,analogRead.

arduino_pin=$1
digital=$2
gpio=39
gpioA=55
gpioAst=1
gpioI2C_MUX=0

if [ "$3" = "pinMode" ]
	then
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
			echo -n "$6" > "/sys/class/gpio/gpio$gpio/direction"
			echo -n "$7" > "/sys/class/gpio/gpio$gpio/drive"
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
			echo -n "$6" > "/sys/class/gpio/gpio$gpio/direction"
			echo -n "$7" > "/sys/class/gpio/gpio$gpio/drive"
		fi
		if [ "$gpioI2C_MUX" != "" ]
		then
			echo -n "29" > /sys/class/gpio/export
			echo -n "out" > /sys/class/gpio/gpio29/direction
			echo -n "strong" > /sys/class/gpio/gpio29/drive
			echo -n "1" > /sys/class/gpio/gpio29/value
		fi
fi
if [ "$3" = "digitalWrite" ]
	then
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
		echo -n "$4" > "/sys/class/gpio/gpio$gpio/value"
fi
if [ "$3" = "analogWrite" ]
	then
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
		echo -n "$4" > "/sys/class/pwm/pwmchip0/pwm$gpio/duty_cycle"
fi
if [ "$3" = "digitalRead" ]
	then
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
fi
if [ "$3" = "analogRead" ]
	then
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
fi
if [ "$3" = "pinModeInLed" ]
	then
		echo -n "3" > /sys/class/gpio/export
		echo -n "out" > "/sys/class/gpio/gpio3/direction"
fi
if [ "$3" = "digitalWriteInLed" ]
	then
		echo -n "$4" > "/sys/class/gpio/gpio3/value"
fi
if [ "$3" = "undoPinMode" ]
	then
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
		echo -n "$gpio" > /sys/class/gpio/unexport
fi
