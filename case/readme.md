3D-printed compact case
=======================

If you just want to make small adjustments and generate 
your own version, install openscad, and open a scad file
and press F6 to generate. Export->stl to get printable model.

For the top parts, I recommend rotating them 180 degrees
in the slicer, so the top is on the printer bed.
I used 100% infill, since its not that much difference
in time/weight, and I hope that it contributes to a more
compact and better sounding case...

Recipe for re-making this
=========================

1. Export board outline from kicad
2. Open in inkscape, select all and combine
3. For every point: mark(there will be 2) and select "join points": shft+L(shft L
4. Import in openscad
5. Export holes from kicad as svg
6. Create cutouts, and measure position from kicad
7. Import holes, just to check that positions match
8. Comment out holes, generate with F6 and export as stl
