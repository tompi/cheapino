height = 95.1738;
width = 132.6134;
step = 0.06;
$fn = $preview ? 10 : 50;

height_translation = 0;
include <modules.scad>

difference() {
  case();
  linear_extrude(4.1) offset(delta=0.45) base();

  // For debug: comment out above 3 lines and comment in this
  //translate([0,0,4.1])
  //      board();

  translate([0,0,top_of_pcb]) switch_holes();

  // Diodes
  translate([0, 0, top_of_pcb]) diodes();

  // RJ45 socket
  color("cyan") {
    translate([29.2, -10.6, 4.1])
      linear_extrude(10)
      square([30, 16.6]);

    translate([45, -5.8, 2.5])
      linear_extrude(10)
      square([15, 7]);
  }

  mcu_cutout();
  // mounting holes
  mounting_hole_inserts();

}

// RJ45 socket cover
color("purple") {
  difference() {
    // x = front/back, y = left/right
    // -2 is thickness of the back cover
    // -10.6 is the initial size of left/right
    // 4.1 is the intial value of the PCB
    translate([29.2 + (-2), -10.6 - 2, 4.1])
      // width = front/back, height = left/right
      // Add thickness of 4. 2 left 2 right.
      // +2 is for top cover
      roundedcube([30 - 7, 16.6 + 4, rj45_height + 2], false, cover_radius, "all");
    // repeat the difference() for initial rj45
    translate([29.2, -10.6, 4.1])
      linear_extrude(rj45_height)
      square([30, 16.6]);
  }
}

// MCU cover
color("gray") {
  difference() {
    // x = left/right, y = front/back
    translate([29.5 - 2, 10.2 - 2, 4.1])
      // width = left/right, height = front/back
      // Add thickness of 4. 2 left 2 right.
      // +2 is for top cover
      roundedcube([19.5 + 4, 25 + 2, mcu_height + 2], false, cover_radius, "all");

    // repeat the difference() for initial mcu cutout
    translate([29.2, 10.2, 4.1])
      linear_extrude(mcu_height)
      square([19.5, 25]);
  }
}
