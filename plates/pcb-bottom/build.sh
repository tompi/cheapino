#!/bin/bash

kicad-cli pcb export gerbers pcb-bottom.kicad_pcb -o gerber
kicad-cli pcb export drill pcb-bottom.kicad_pcb -o gerber --generate-map --map-format gerberx2
cd gerber
zip -r ../pcb-bottom-gerber.zip .
cd ..
rm -r gerber
