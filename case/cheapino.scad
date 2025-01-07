height = 95.1738;
width = 132.6134;
step = 0.05;
$fn = $preview ? 10 : 50;

height_translation = 0;


/*
// Height of case is 5mm from pcb to switch inset,
// plus 1.6mm pcb height, for a total of 6.6mm
color("red")
for (i = [0:step:2.5])
{
    translate([0,0,i]) //height_translation])
        base_line_extruded(i, 1);
}

color("green")
translate([0,0,2.5]) //height_translation])
  base_line_extruded(2.5, 1.6);


color("blue")
for (i = [4.1:step:6.6])
{
    translate([0,0,i-1]) //height_translation])
        base_line_extruded(6.6-i, 1);
}
*/
// Lip to stop pcb
color("yellow")
translate([0,0,1.6])
  difference()
  {
    offset( delta=1)
            base();
    offset( delta=-1)
            base();
  }

  /*
// Top plate
color("pink")
translate([0,0,5.1])
  linear_extrude(1.5)
offset( delta=0.5)
       base();

*/

module base_line_extruded (factor, extrusion)
{
    linear_extrude(extrusion)
            base_line(factor);
}

module base_extended (factor, extrusion)
{
    linear_extrude(extrusion)
        offset( delta=factor)
            base();
}

module base()
{
	import ("plate.svg", center=true);
}


module base_line(expanded)
{
  difference()
  {
    offset( delta=expanded+1)
            base();
    offset( delta=expanded)
            base();
  }
}

