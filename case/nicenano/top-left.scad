height = 95.1738;
width = 132.6134;
step = 0.06;
$fn = $preview ? 5 : 50;

height_translation = 0;
include <../modules.scad>
include <nicenano-modules.scad>

// Rotate so you dont need to do that in extruder
translate([0,0,9.1])
rotate([0,180,0])
difference() {
  case();
  linear_extrude(4.1) offset(delta=0.45) base();

  // For debug: comment out above 5 lines and comment in this
  //translate([0,0,4.1]) 
  //      board();

  translate([0,0,top_of_pcb]) switch_holes();

  // Diodes
  translate([0, 0, top_of_pcb]) diodes();


  mcu_wireless_cutout();

  power_switch_cutout();

  // mounting holes
  mounting_hole_inserts();

}