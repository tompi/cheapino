Configuring using vial
======================

This is the easiest way of setting up your keyboard:

1. Download cheapino_vial.uf2 file for your release(1 or 2)
2. Put your rp2040-zero in dfu mode by holding boot button while you plug in usb c
3. Drag and drop uf2 file to the usb drive that popped up after 2.
4. Download vial from here: https://get.vial.today/download/
5. Open it and start customizing

All keys and encoder actions should be configurable in the Vial program while
your keyboard is configured.

Setting up and compiling qmk
============================

For most flexibility, you want to compile the qmk firmware yourself.

Unfortunately, the cheapino firmware is not merged into the official qmk repository,
so there are a few extra steps to setting up qmk for compiling cheapino.
This is the recipe for windows(for mac/linux, install qmk the recommended way and jump to step 3):

1. Install qmk msys from https://msys.qmk.fm/
2. Inside qmk msys, type qmk setup - this will create a qmk_firmware folder that has cloned the main branch of qmk from git.
3. Run this command(make sure you are in the "qmk_firmware"folder) to add a reference to the cheapino qmk fork:
```sh
git remote add tompi https://github.com/tompi/qmk_firmware
```
4. Run this command to actually fetch the code(replace "cheapino" with "cheapinov2" if you are using cheapino v2 pcbs):
```sh
git fetch tompi cheapino
```
5. Run this command to switch local files to the cheapino variant(again, replace "cheapino" with "chepinov2" if using v2 pcbs):
```sh
git checkout tompi/cheapino
```
6.Now you should be able to make and flash with:
```sh
qmk flash -kb cheapino -km default
```
7. When qmk says "Waiting for drive to deploy", hold boot btn while pressing reset on the rp2040, which should put it in dfu mode, and qmk will then flash.

To make your own version and customize it:

1. Copy the "keyboards/cheapino/keymaps/default/" folder to "keyboards/cheapino/keymaps/thebestkeymap/".
2. Upload the file keymap.json (that you copied) to https://config.qmk.fm/
3. Go wild with configuring up to 15 layers...
4. Press the download button.
5. Move the downloaded json file to "keyboards/cheapino/keymaps/thebestkeymap/keymap.json"
6. Build and flash the keymap with:
```sh
qmk flash -kb cheapino -km thebestkeymap
```
7. When qmk says "Waiting for drive to deploy", hold boot btn while pressing reset on the rp2040, which should put it in dfu mode, and qmk will then flash.

(and you guessed it, you can choose to call it something else than thebestkeymap)

To help learn your keymap, @omark96 made this tool that works on windows: https://github.com/omark96/qmk_keymap_overlay

# Encoder customization

Tweaking the encoder actions needs to be done in the keyboards/cheapino/encoder.c file, they are not part of the keymap.
(you dont HAVE to be a progammer to change it, but you may call yourself a novice programmer once you do...)
In the method called "turned", there are actions defined for multiple layers, this one is tweaked for my personal layer...
The "else" section at line 26, will send page down for clockwise encoder turns, and page down for counter clockwise.
The first if, line 20, sends volume up/down if you are on layer 6. 

The encoder push is defined to media pause/play in the "clicked" method on line 15.
Feel free to remap it to different keys depending on layers, like the turns are done.
TBH, I dont really use the encoder much, so I didnt spend much time tweaking this...

Once you change the encoder file, run the command from step 6 and 7 to deploy changes to your keyboard.

Good luck!
