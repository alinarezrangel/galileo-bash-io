# Galileo BASH IO

Galileo BASH IO es una colección de programas que crean una interfaz sencilla
entre [BASH](https://www.gnu.org/software/bash/ "BASH") y las entradas y
salidas de la placa
[Intel Galileo Gen 1](http://www.intel.com/content/www/us/en/embedded/products/galileo/galileo-g1-datasheet.html "Galileo Gen 1").

El programa principal de la interfaz es `utility.sh`, el cual provee:

* Entrada de pines digitales.
* Salida de pines digitales.
* Entrada de pines analógicos.
* Salida de pines PWM.
* Entrada y salida serial.

Los nombres de los pines son los mismos que en Arduino.

## Documentación

La documentación principal se encuentra en la Wiki proporcionada por GitHub y
en la [página del proyecto](http://alinarezrangel.github.io/galileo-bash-io/)

## Ejemplos

```
pinMode.sh 0 digital out strong # Salida digital fuerte
while true # Repetir:
	do
		digitalWrite.sh 0 1 # Escribe 1 en el pin 0
		sleep 1 # espera
		digitalWrite.sh 0 0 # Escribe 0 en el pin 1
		sleep 1
done
```

```
pinMode.sh 0 digital out strong # Salida digital fuerte
pinMode.sh A0 analog # Entrada analogica
while true
	do
		a=$(analogRead.sh A0)
		digitalWrite.sh 0 1 # Escribe 1 en el pin 0
		sleep $(( 1 / a )) # Espera proporcionalmente al valor del pin A0
		digitalWrite.sh 0 0
		sleep $(( 1 / a ))
done
```

