Setting up and compiling qmk
============================

Unfortunately, the cheapino firmware is not merged into the official qmk repository,
so there are a few extra steps to setting up qmk for compiling cheapino.
This is the recipe for windows(for mac/linux, install qmk the recommended way and jump to step 3):

1. Install qmk msys from https://msys.qmk.fm/
2. Inside qmk msys, type qmk setup - this will create a qmk_firmware folder that has cloned the main branch of qmk from git.
3. Run this command to add a reference to the cheapino qmk fork:
```sh
git remote add tompi https://github.com/tompi/qmk_firmware..
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

Tweaking the encoder actions needs to be done in the keyboards/cheapino/encoder.c file.
(you dont HAVE to be a progammer to change it, but you may call yourself a novice programmer once you do...)

Once you change the encoder file, run the command from step 6 and 7 to deploy changes to your keyboard.

Good luck!
