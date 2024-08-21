height = 95.1738;
width = 132.6134;
step = 0.06;
$fn=50;

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
    // translate([0,0,4.1])
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

