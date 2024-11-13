3D-printed compact case
=======================

If you just want to make small adjustments and generate 
your own version, install openscad, and open a scad file
and press F6 to generate. Export->stl to get printable model.

Make sure you install the development snapshot, since the
last official release is hopelessly out of date...
You need to tweak some settings to be able to build
the model efficiently:
 - Go to preferences->advanced and
increase "turn off rendering at" to 3 million.
 - Go to preferences->features and check "manifold"
   - In OpenSCAD version 2024.11.01, "manifold" is under: Advanced -> 3D Rendering -> Backend
   - <img width="422" alt="image" src="https://github.com/user-attachments/assets/abb358e1-41b6-43b3-9561-21032cae92ca">

(this will enable multi-thread rendering and speed things
 up dramatically!)

For the slicer, I did not do much experimenting... 
Maybe somebody into 3D printing could help me out with
the silicone bumper recesses: removing the supports in
these holes is a pain...

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
9. Import stl files in any slicer to print them
