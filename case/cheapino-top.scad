height = 95.1738;
width = 132.6134;
step = 0.06;
$fn=50;

height_translation = 0;
include <modules.scad>



difference() {
  case();
  linear_extrude(4.1) offset(delta=0.1) base();

  //translate([0,0,4.1])
  //       board();

translate([0,0,top_of_pcb]) switch_holes();

// Diodes
translate([0, 0, top_of_pcb]) diodes();

// RJ45 socket
color("cyan") {
    translate([29.955, -10.3, 4.1])
    linear_extrude(10)
    square([30, 16]);

    translate([45, -5.8, 2.5])
    linear_extrude(10)
    square([15, 7]);
}

mcu_cutout();
// mounting holes
mounting_hole_inserts();

}


