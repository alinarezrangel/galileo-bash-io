# Galileo BASH IO - Galileo Gen 1 Input/Output manage from BASH or SH #

Now, The Intel(r) Galileo Gen 1 board have multiples interfaces for working
on the I/O without use the Arduino(r) interface. You can find it in
Python 2/3, Node JS (javascript) and some others. But it's hard to use
the board's I/O from the command line if you not remember the GPIO map.

Galileo BASH IO have a set of programs (wroted in BASH) that access to
the I/Os using an Arduino(r)-like interface:

```bash
#!/bin/bash
# coding: utf-8

# Blink: blinks a led on the pin 2

# First: set the Galileo's pin 2 to a digital output
pinMode.sh 2 digital out strong
while true
	do
		# Writes on the pin 2 a high value (1)
		digitalWrite.sh 2 1
		sleep 1 # Sleep 1 second
		# Writes on the pin 2 a low value (0)
		digitalWrite.sh 2 0
		sleep 1 # Sleep 1 second
done
```

## Documentation ##

 * `pinMode.sh` [pinMode](pinMode.md): Sets the mode of a pin.
 * `undoPinMode.sh` [undoPinMode](undoPinMode.md): Unsets the mode of a
  pin for change it again with pinMode.
 * `userLed.sh` [userLed](userLed.md): Enables, disables or writes in the
  user led (GP led on the pin 13).
 * `digitalWrite.sh` [digitalWrite](digitalWrite.md): Writes on a digital
  pin (almost all).
 * `digitalRead.sh` [digitalRead](digitalRead.md): Reads from a digital
  pin (almost all).
 * `analogWrite.sh` [analogWrite](analogWrite.md): Writes on a PWM
  output pin (`3`, `5`, `6`, `9`, `10` and `11`).
 * `analogRead.sh` [analogRead](analogRead.md): Reads from an analogic
  input pin (`A0` - `A5`).

## Serial support ##

The Intel(r) Galileo Gen 1 board have like the Arduino(r) Uno serial
pins (`0` and `1`) and `pinMode` can be used to link `/dev/ttyS0` to
these pins and send and receive data from them.

## Why the GP led (led on pin 13) have a special command ##

In the Intel(r) Galileo Gen 1 board, the GP led is **not**
connected to the pin `13`, instead it haves it's own GPIO: using the
pin `13` to handle this led will not work, instead, you can use the
`userLed.sh` command of the form:

```bash
# Usage: userLed.sh (enable|disable|write <value>)

# Enables the led (without enabling it the userLed.sh command will
# not work)
userLed.sh enable
# Powers the led (led is on now)
userLed.sh write 1
sleep 2 # Waits 2 seconds
userLed.sh write 0 # Led is off now
# Disables the led and until enabled the userLed.sh command will
# fail again
userLed.sh disable
```

## License ##

All programs here are under the MIT license.

