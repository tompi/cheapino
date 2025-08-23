# Cheapino troubleshooting

## The keyboard lights up but does not work

This can happen for 2 reasons:

### You used a charging only cable.
Solution: Find a cable with data support.

### There is an issue with certain combinations of high end cables and computers.
Checkout this issue:
https://github.com/tompi/cheapino/issues/78
and this reddit post for more info:
https://www.reddit.com/r/ErgoMechKeyboards/comments/1fx67uz/cheapino_not_working_but_powers_on_with_usba/

Solution: Try a USB 2.0 cable(usually this just means "cheaper"...)

## Single switches are not working

Usually, this is caused by either not soldering the diode, soldering the diode in the wrong direction, or in some very rare cases a malfunctioning diode or switch.

To rule out the switch: try to short the two pins of the switch with a wire.
If this fires the key, you got a bad switch: desolder it and put in a new one.
(Get yourself an "engineer ss02", its amazing for desoldering work...)

If it doesnt, try to short the circuit "before" the diode. If this works the diode is either bad or in the wrong direction. Desolder and realign or switch it.

## Entire rows or entire columns are not working

This could be caused by several things. Read up below, and view [the interactive schematic](https://tompi.github.io/cheapino/doc/troubleshooting/routing.html) for easy troubleshooting.

### Bad connection on MCU

Check that the pins of your rp2040-zero are all soldered ok. There should not be a "blob" of solder, it should look like a volcano. Retouch any strange looking soldering points on the MCU.

### Shorts on the MCU or the RJ45 socket

Check your soldering on both MCU and the RJ45 sockets. If there are any shorts, try sucking up some solder with e.g. some solder wick or your solder sucker.

### Magnetic usb c cable frying the MCU

There have been reports of magnetic cables frying the MCU, some details here:
https://github.com/tompi/cheapino/issues/130

TLDR: If your computer complains about "The USB port is drawing too much power", you should inspect the magnetic cable, and consider swapping it out before something bad happens...

### Ethernet crossover cable

Not all ethernet cables are the same... There are different variants more or less rare, for different purposes. The most common which will create problems for the cheapino is the crossover cable: https://en.wikipedia.org/wiki/Ethernet_crossover_cable

Try different cables, if one is working fine, this is your issue.

## Suddenly my cheapino outputs A LOT of random characters

This will happen with some cheap encoders, they may not de-tent properly, and get stuck in a position which creates problems for the firmware. The solution to this is just to turn the encoder a little, and it should go away... (this should NOT happen on v2...)

## The keyboard outputs random/none/wrong keys

Make sure you flashed the version matching your PCB. V1 firmware will NOT work on V2, and vica versa.
If in doubt, just download from the release section and flash again.

## The keyboard/mcu is heating up really fast

This can happen if there is a short between gnd and vcc. Check continuity and find the short, and fix it with some solder wick or a pump.

## None of the above helped!

Open up an issue! I just think its fun to troubleshoot, this project is a really nice hobby which I enjoy spending time on!

