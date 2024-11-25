# Cheapino v2 build guide

## Introduction

Welcome to the Cheapino Keyboard v2 Build Guide!
In this guide, I will walk you through the steps to build your own custom keyboard using the Cheapino v2 kit.
The Cheapino is a budget-friendly DIY split mechanical keyboard that is perfect for beginners who are looking 
to try their hand at building their own keyboard.

I assume you read the [ordering guide](orderingguide.md) and have all the mandatory parts and tools.

This guy also documented his build very good: https://imgur.com/a/building-cheapino-as-complete-beginner-G8dDaJi

This soldering guide is pretty good:
https://www.circuitspecialists.com/blog/how-to-soldering-correctly-soldering-101/

## Steps

In my experience it is easiest to solder the lowest components first, and the highest last, since you need to turn the PCB around with the components on the other side when soldering(and then you want the loose ones to rest directly at the desk). Thats why I suggest starting with the diodes, then the MCU, the switches, the RJ45 socket and lastly the encoder.

### Step 1: Hotswap sockets

This step is optional, and only if you are building for hotswap.
The sockets go on the bottom sides of of the PCB,
Make sure you follow the PCB outline for the sockets(white lines),
its very easy to solder them in the wrong direction(at least that
is what I managed to do with more than half of them first time...)

Just make sure to place them on the white outline, AND that 
the big switch hole is unobstructed.

![Hotswap](images/buildguidev2/hotswap.png)

### Step 2: Diodes

You need to be careful to solder the diodes the correct way. 
The line on the diode should always be closest to the square pad of the footprint, 
NOT the round one. The PCB supports SMD and through hole diodes, 
and you can choose which side you want to mount them. 
I suggest mounting them on the top side, to keep height of board as low as possible.

I like to solder from the component side, not the dangling legs side, but each to his own ;)

![Diodes](images/buildguidev2/diodes.png)

If you use through hole diodes and have sockets for the MCU, 
keep the legs you cut off and use them for socketing the MCU.

![Diode legs](images/buildguidev2/diodes_legs.png)


### Step 3: Bridge solder pads on right side

This step is only for the right side of the keyboard.
You need to bridge the 7 solder pads. If you forget this, the right side will not register keypresses.

This is an improvement over v1, in that no columns or rows are shared between sides, getting rid of ghosting issues.

Bridging can be a bit tricky with a pointed soldering tip, its best to use a flat one.
Both will work though, just make sure you dont spend too much time heating up the pads.
If you fail to bridge, take a break and let them cool down, and apply some flux before retrying.

If you apply too much heat too long, you might lift the pads, and then you will need to bodge wire stuff...

In the picture I bridged 4 of the 7:

![Bridging pads](images/buildguidev2/bridge.png)

### Step 4: MCU

Only the pins on the 2 long sides are actually used, but if you have the RP2040-Zero with pre-soldered pin headers, there is room for that also. Choose one of the following steps:

#### Socket the MCU

Socketing makes it easier to reuse the MCU(the RP2040-Zero) for another build later, or swap it if its broken or malfunctions. 

NB: The cheap sockets linked from the ordering guide happily accepts diode legs, while the more "expensive"
ones typically have larger holes, so for these you might wanna go with picking out the legs that came in the
yellow plastic with the mcu(they are thicker and sturdier than diode legs).

If you have sockets for the MCU, mount them on a breadboard, or stick them in some cardboard to get them straight when mounting.

![Socketing 1](images/socket1.jpeg)

Stick the clipped diode feet through the MCU, and down into the socket. Use a tool, or you will stick it into your fingers(been there, done that...). 

![Socketing 2](images/socket2.jpeg)

Solder all the feet in place, and remove all 3 parts from the breadboard, and put them into the PCB, use some tape to hold it in place when you turn it around and solder it.

![Socketing 3](images/buildguidev2/socket3.jpeg)

#### Use pinheader to mount MCU

Use the two longest yellow pin headers that come with the MCU: solder them to the board first, and then solder the MCU to them.

![MCU pin header](images/mcu_pinheader.jpeg)

### Step 5: Install the Switches

Next, it's time to install the switches. 
Note: if you installed hotswap sockets you do NOT need to solder switches...
If you only have 3 pin switches, refer to hints in the v1 build guide on how to align them.

Pop them all in, turn the PCB around and solder them.
I solder 1 pin from each switch on a row, and then do the other pin for the entire row, to
minimize risk of overheating switch and melting the plastic.

![Switches front](images/buildguidev2/switches1.png)

![Switches back](images/buildguidev2/switches2.png)


### Step 6: Install the RJ45 sockets

Just align them to the white outline. They should stay in place by themselves when you flip the PCB to solder them.

### Step 7: Install the encoder

Put the encoder in the footprint on the right side, make sure its flush to the PCB when you solder it.

![Finished](images/buildguidev2/finished.png)

### Step 8: Trim below and install bumpers

Use the cutters to trim any extruding wires on the underside of the PCBs. 
I havent done this with anything else than the encoder pins which I found to
stick out a little extra.

Maybe clip them inside a plastic bag to prevent the metal from flying around. 

Install rubber bumpers to protect your desk and keep the keyboard from moving.
The v2 outline is a bit smaller than the v1, so be generous with the bumpers,
sprinkle them all around, or typing will be wobbly.

### Step 9: Test that everything works.

There is a good chance you forgot to solder a diode or a switch leg...

Flash the vial firmware in the release section.
The encoder should send arrow up and down by default, and pressing
the encoder should play/pause your currently playing media.

Download vial to test all the keys(and use it to re-map if you want).

## Firmware

Congratulations, you have successfully built your own custom keyboard.

See the [firmware guide](firmware.md) for how to build and customize keyboard firmware.

Send me a mail or issue if something doesnt work as expected!

