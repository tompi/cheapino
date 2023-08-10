Cheapino
========

Probably one of the cheapest split keyboards you can build.

![Cheapino with Iceberg keycaps](cheapino.jpg "Ceapino")

This is the result of really enjoying building keyboards, 
but not wanting to spend that much money on it. 
The pcb is reversible, connected using rj45, 
and utilizes a japanese duplex matrix, so only one
mcu is needed(in fact it only uses 7 of the rj45 wires to 
support 18 switches and an encoder on the right side).

Checkout the [build guide](doc/buildguide_v1.md) for more details and pictures.

If you just want to flash [Miryoku](https://github.com/manna-harbour/miryoku) 
on your Cheapino, download the [uf2 file from the release section](https://github.com/tompi/cheapino/releases/download/v1.0/cheapino_manna-harbour_miryoku.uf2), 
put the rp2040-zero in dfu mode by holding boot while pressing reset, then return,
then you should get a new usb drive which you can just copy the uf2 file to.

A qmk branch with support is located here: 
https://github.com/tompi/qmk_firmware/tree/cheapino

If you are wondering if this is actually usable, Im writing this on it, and Im pretty happy with it. 
My son is also using his at his work and claims its very usable.

These are a few other people that built it:

https://www.reddit.com/r/ErgoMechKeyboards/comments/12xg4u7/built_the_cheapino/
![Cheapino by TentacleSenpai69](otherbuild.jpeg)

https://www.reddit.com/r/ErgoMechKeyboards/comments/13c274r/cheapino_build/
![Cheapino by Palbi](otherbuild2.jpeg)

https://discuss.tchncs.de/post/410101
![Cheapino by PixelPrimer](otherbuild3.jpeg)

https://discuss.tchncs.de/post/852362
![Cheapino by Chraccoon](otherbuild4.jpeg)

https://lemmy.world/post/2080485
![Cheapino by Hansamann](otherbuild5.jpeg)

https://lemmy.world/post/2832967
![Cheapino by createkarma](otherbuild6.jpeg)

https://lemmy.world/post/2480447
![Case by Chraccoon](case.jpeg)
Printable file  for the case here: https://www.printables.com/model/541536-cheapino-case-with-basic-tenting

Drawbacks:

* Without a plate, its pretty difficult to solder swithes straight. I made a small helper "fork" to hold each column in place when soldering.
* RJ45 cables are a bit rigid, so they do not lay down on the table nicely like audio cables.
* There is no official qmk support, you need to compile from my branch manually... Keymap can be edited in qmk configurator though.


![Cheapino PCB](cheapino_pcb.jpg "Cheapino PCB")
