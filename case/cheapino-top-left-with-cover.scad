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
    // x = front/back, y = left/right, z = top/down
    // -0.8 is thickness of the back cover
    // -10.6 is the initial size of left/right
    // 8.1 is the start of the case
    translate([29.2 + (-0.8), -10.6 - 2, 8.1])
      // width = front/back, depth = left/right, height = top cover
      // Add thickness of 4. 2 left 2 right.
      // (reset mcu_height) + 2 is for top cover thickness
      roundedcube([30 - 8, 16.6 + 4, rj45_height - 2], false, cover_radius, "xmax");

    // To craete a hole, repeat the difference() for initial rj45
    translate([29.2, -10.6, 8.1])
      // 0.5 for tolerance
      linear_extrude((rj45_height - 4.1) + 0.5)
      square([30, 16.6]);
  }
}

// MCU cover
color("green") {
  difference() {
    // x = left/right, y = front/back
    // 8.1 is the start of the case
    translate([29.5 - 1, 10.2 - 3, 8.1])
      // To set the cube height
      // width = left/right, height = front/back
      // Add thickness of 3. 2 outer, 1 inner.
      // (reset mcu_height) + 2 is for top cover thickness
      roundedcube([19.5 + 3, 26 + 3, (mcu_height - 4.1) + 2], false, cover_radius, "xmax");

    // To craete a hole, repeat the difference() for initial mcu cutout
    translate([29.5, 10.2, 8.1])
      linear_extrude(mcu_height - 3.1)
      square([19.5, 25]);

    // Repeat USB C port opening
    translate([34.25, 25.2, 8.1])
      linear_extrude(mcu_height - 3.1)
      square([10, 20]);
  }
}
