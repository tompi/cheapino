height = 95.1738;
width = 132.6134;
step = 0.06;
$fn = $preview ? 10 : 50;

height_translation = 0;
include <modules.scad>


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
}


mirror() {
  // RJ45 socket cover
  color("purple") {
    difference() {
      // x = front/back, y = left/right, z = top/down
      // -0.8 is thickness of the back cover
      // -9.33 is the initial size of left/right
      // 8.1 is the intial value of the PCB
      translate([29.2 + (-0.8), -9.33 - 2, 8.1])
        // width = front/back, depth = left/right, height = top cover
        // Add thickness of 4. 2 left 2 right.
        // (reset mcu_height) + 2 is for top cover thickness
        roundedcube([30 - 8, 16.6 + 4, (rj45_height - 4.1) + 2], false, cover_radius, "xmax");

      // To craete a hole, repeat the difference() for initial rj45
      translate([29.2, -9.33, 8.1])
        // 0.5 for tolerance
        linear_extrude((rj45_height - 4.1) + 0.5)
        square([30, 16.6]);
    }
  }
}
