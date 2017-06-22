# `userLed.sh` - Controla el LED de usuario #

El comando `userLed.sh` puede habilitar, deshabilitar y controlar el estado del
LED del usuario (*user led* en Arduino).

## Uso ##

```bash
userLed.sh enable # [1]
userLed.sh write $value # [2]
userLed.sh disable # [3]
```

### 1) Comando `enable` ###

El comando `userLed.sh enable` activará el LED de usuario, luego de esto ya se
puede controlar su estado mediante el comando `userLed.sh write ...`.

### 2) Comando `write` ###

Si el LED de usuario está áctivado, puede encenderlo o apagarlo utilizando el
comando `userLed.sh write $value`, donde la variable `$value` contiene un
`0` para apagar el LED o un `1` para encenderlo.

#### Ejemplos ####

```bash
userLed.sh enable
userLed.sh write 0 # Ahora está apagado
sleep 2
userLed.sh write 1 # Ahora está encendido
sleep 2
userLed.sh write 0 # Apagado de nuevo
```

### 3) Comando `disable` ###

El comando `userLed.sh disable` deshabilita el LED de usuario, una vez hecho
esto no se podrá escribir en el otra véz hasta habilitarlo de nuevo con el
comando `enable`.

## Véase también ##

* [`pinMode.sh`](pinMode.md)
* [`undoPinMode.sh`](undoPinMode.md)
