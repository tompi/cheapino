height = 95.1738;
width = 132.6134;
step = 0.06;
$fn = $preview ? 10 : 50;

height_translation = 0;
include <modules.scad>


// Rotate so you dont need to do that in extruder
translate([0,0,9.1])
rotate([0,180,0])
mirror() {
  difference() {
    case();
    linear_extrude(4.1) offset(delta=0.45) base();

    // holes and shape for debug
    //translate([0,0,4.1])
    //    board();

    translate([0,0,top_of_pcb]) switch_holes();

    // Diodes
    translate([0, 0, top_of_pcb]) diodes();

    // RJ45 socket
    color("cyan") {
        translate([29.2, -9.33, 4.1])
        linear_extrude(10)
        square([30, 16.6]);

        translate([45, -4.53, 2.5])
        linear_extrude(10)
        square([15, 7]);
    }

    // EC11 encoder
    color("pink") {
        translate([32.75, 16.5, 4.1])
        linear_extrude(10)
        square(13);

        translate([32.2, 15, 4.1])
        linear_extrude(3)
        square([14.2, 17.5]);
    }

    // solder bridge pads needs some space
    color("red")
    translate([29, -15.53, 4.1])
    linear_extrude(2)
    square([19.5, 3.5]);


    mounting_hole_inserts();
  }

  // RJ45 socket cover
  color("purple") {
    difference() {
      // x = front/back, y = left/right
      // -2 is thickness of the back cover
      // -9.7 is the initial size of left/right
      // 4.1 is the intial value of the PCB
      translate([29.2 + (-2), -9.33 - 2, 4.1])
        // width = front/back, height = left/right
        // Add thickness of 4. 2 left 2 right.
        // +2 is for top cover
        roundedcube([30 - 7, 16.6 + 4, rj45_height + 2], false, cover_radius, "all");
      // repeat the difference() for initial rj45
      translate([29.2, -9.33, 4.1])
        linear_extrude(rj45_height)
        square([30, 16.6]);
    }
  }
}
