#!/bin/bash

kicad-cli pcb export gerbers pcb-top.kicad_pcb -o gerber
cd gerber
zip -r ../pcb-top-gerber.zip .
cd ..
rm -r gerber
