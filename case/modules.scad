//$fn=50;
pcb_thickness = 1.6;
bottom_plate_thickness = 2.5;
top_of_pcb = bottom_plate_thickness + pcb_thickness;


// bottom plate
module bottom()
{
color("pink")
translate([0,0,0])
  linear_extrude(bottom_plate_thickness)
    offset( delta=0)
       base();
}

module base()
{
	import ("plate.svg", center=true);
}

module board()
{
    color("#1f77b4")
    translate([0,0,-1.6])
    linear_extrude(1.6)
    rotate([0,180,0])
    import("cheapino-brd.svg", center=true);
}

module hotswap_mx() {
    thickness=1.85;

    // Holes
    translate([3.175,2.2,0])
    linear_extrude(height=3.05)
        circle(d=3);

    translate([-3.175,-0.36,0])
    linear_extrude(height=3.05)
        circle(d=3);

    // Body
    linear_extrude(height=thickness)
    square([11.8,5.2], center=true);

    translate([0,1.9,0])
    linear_extrude(height=thickness)
    square([5.65, 2.39]);

    // Metal soldering parts
    translate([5.45,1.04,0])
    linear_extrude(height=thickness)
    square([2.5, 2.55]);

    translate([-7.95,-1.7,0])
    linear_extrude(height=thickness)
    square([2.5, 2.55]);
}


module column(bottom) {
switch(bottom);

translate([0, 19, 0]) switch(bottom);

translate([0, 38, 0]) switch(bottom);
}

module switch(bottom) {
  // hotswap socket
  color("#ff7f0e")
  translate([0,bottom ? -9.42 : 0,1.85])
  rotate([180,0,0])
  mirror([0,bottom ? 1 : 0,0])
    hotswap_mx();

  // main pin of switch
  // 4mm d, 2.8mm high, 1.6mm pcb
  // means 1.2 of it sticks below, 1.3 for margin
  color("#2ca02c")
  translate([-0.57, -4.7, 0])
  linear_extrude(height=1)
  circle(d=4.2);



  // The two switch alignment pins
  // They will need to be snipped if too long
  color("#d62728")
  translate([-5.74, -4.7, 0])
  linear_extrude(height=1)
  circle(d=1.8);

  color("#d62728")
  translate([4.45, -4.7, 0])
  linear_extrude(height=1)
  circle(d=1.8);

}

module diode() {
color("#8c564b")
linear_extrude(height=1.85)
square([9.9, 2]);
}

module rdiode() {
  rotate(90)
  diode();
}



module magsafe_ring()
{
translate([0,0,0])
linear_extrude(height=1.4)
difference() {
    circle(d=55.1);
    circle(d=44.9);
  }
}


module rj_hole() {
color("#e377c2")
  linear_extrude(1.7) {
  translate([40.1,3.5,0])
  circle(d=3.5);
  translate([40.1,4.8,0])
  circle(d=3.5);
  }
}

module rj_pin_hole() {
  color("#e377c2")
  linear_extrude(1.3)
  translate([33.7,3.5,0])
  circle(d=2);
}

module encoder() {
    color("#7f7f00")
    linear_extrude(0.6) {
        translate([32.65, 21.6])
        square([2, 3.3]);
        translate([43.85, 21.6])
        square([2, 3.3]);
    }
    color("#7f0000")
    linear_extrude(1) {
        translate([35.7, 29.8])
        square([7,2]);
        translate([36.8, 16.3])
        circle(d=2);
        translate([41.77, 16.3])
        circle(d=2);
    }
}

module mcu() {
    color("#7f7f7f")
    linear_extrude(1.5) {
    translate([30.65, 11.5])
    square([2,22.5]);
    translate([45.83, 11.5])
    square([2,22.5]);
    }

    color("#7f7f7f")
    linear_extrude(1)
    translate([31.65, 11.5])
    square([15,2]);
}

module mounting_hole() {
    color("#bcbd22")
    translate([45.85, -23, 0]) {
      cylinder(h=1.5, r1=1, r2=2.2);

      translate([0,0,1.5])
      cylinder(h=4, r=2.2);
    }
}

module bumper() {
    color("#17becf")
    translate([41, 29, 2.5])
      cylinder(h=2, r=5);
    color("#17becf")
    translate([41, 29, 1.3])
      cylinder(h=1.2, r1=4.5, r2=5);
}

module magnet() {
    color("#9467bd")
    cylinder(h=2.1, r=3.05);
}

module switches(bottom) {
    // Columns starting from MCU
    translate([19.3,-2.84,0])
    column(bottom);

    //rotate([0,0,180])
    translate([0.3,-0.3,0])
    column(bottom);

    translate([-18.7,6.05,0])
    column(bottom);

    translate([-37.7,-0.3,0])
    column(bottom);

    translate([-56.7,-10.308,0])
    column(bottom);

    // Thumb cluster
    translate([14.6264,-24.52])
    switch(bottom);

    rotate([0,0,-10])
    translate([40.3,-19.3])
    switch(bottom);

    rotate([0,0,-23])
    translate([65.65,-7.09])
    switch(bottom);
}

module diodes() {
    // The horizontal diodes
    translate([-18.2, 10.01, 0]) diode();
    translate([-28.79, 10.01, 0]) diode();
    translate([-26.43, 28.98, 0]) diode();
    translate([-9.663,21.77,0]) diode();
    translate([0.8, 21.77, 0]) diode();
    translate([13.906, 19.672, 0]) diode();
    translate([15.938,0.866,0]) diode();
    translate([5.688,-19.328,0]) diode();
    translate([-5.218, 2.771, 0]) diode();
    translate([-37.467,3.355,0]) diode();
    translate([-47.827,3.355,0]) diode();
    translate([-61.434,11.813,0]) diode();
    translate([-61.8,-7.211,0]) diode();
    translate([-47.816,22.304,0]) diode();

    // The vertical(ish) diodes
    translate([10.81, 24.5, 0]) rdiode();
    translate([10.785, 6.861, 0]) rdiode();
    translate([29.86, 24.906, 0]) rdiode();
    translate([28.565, -2.935, 0]) rdiode();
    translate([10.785, -13.346, 0]) rdiode();
    translate([26.177, -31.38, 0]) rdiode();

    translate([46.58, -35.6, 0])
    rotate(76)
    diode();
}

module rj45() {
    // rj 45 stabilizers
    rj_hole();
    translate([0,-11.43,0]) rj_hole();

    // rj 45 housing through holes
    translate([3.1,2,0]) rj_hole();
    translate([3.1,-13.49,0]) rj_hole();

    // rj 45 pins
    rj_pin_hole();
    translate([0,-2.54,0]) rj_pin_hole();
    translate([0, -5.08,0]) rj_pin_hole();
    translate([0,-7.62,0]) rj_pin_hole();
    translate([0,-10.16,0]) rj_pin_hole();
    translate([-2.54,-1.27,0]) rj_pin_hole();
    translate([-2.54,-3.81,0]) rj_pin_hole();
    translate([-2.54,-6.35,0]) rj_pin_hole();
    translate([-2.54,-8.89,0]) rj_pin_hole();
}

module mounting_holes() {
    // Mounting holes
    mounting_hole();
    translate([-27.432,4.572,0]) mounting_hole();
    translate([-18.288,44.704,0]) mounting_hole();
    translate([-36.132,25.02,0]) mounting_hole();
    translate([-56.183,52.928,0]) mounting_hole();
    translate([-75.399,46.599,0]) mounting_hole();
    translate([-94.267,36.473,0]) mounting_hole();
    translate([-94.241,17.313,0]) mounting_hole();
    translate([-3.048,-16.256,0]) mounting_hole();
}

//color("green")
//translate([0,0,0])
// import("hotswap.stl");

// Height of case is:
//  5.0mm from pcb to switch inset
//  1.6mm pcb height
//  2.5mm bottom plate
//
//  for a total of 9.1mm.
//
// The case only adds 0.7mm extra height
// to the keyboard.
module case() {
    color("red")
    for (i = [0:step:8.1])
    {
        // factor = sqrt(pow(9.1, 2) - pow(i, 2));
        factor = min(3 - abs(i*0.7-3), 2.5);
        //echo(pow(i, 2));
        //echo(factor);
        translate([0,0,i]) //height_translation])
            linear_extrude(height=1)
                offset( delta=factor + 1 )
                    base();
            //base_extended(factor, 1);
    }
}

module switch_holes() {
    // Columns starting from mcu
    hole_column();
    translate([-19, 2.54, 0]) hole_column();
    translate([-38, 8.89, 0]) hole_column();
    translate([-57, 2.54, 0]) hole_column();
    translate([-76, -7.468, 0]) hole_column();

    // Thumb cluster
    translate([-4.674, -59.69, 0]) switch_hole();
    rotate(-10) translate([21, -54.45, 0]) switch_hole();
    rotate(-23) translate([46.25, -42.25, 0]) switch_hole();
}

module hole_column() {
switch_hole();
translate([0, -19, 0]) switch_hole();
translate([0, -38, 0]) switch_hole();
}

module switch_hole() {
  translate([11.64, 23.45, 0]){
    color("green") {
        linear_extrude(10) {
          square(14);
          translate([0.2,0.2,0]) circle(d=1);
          translate([13.8,0.2,0]) circle(d=1);
          translate([13.8,13.8,0]) circle(d=1);
          translate([0.2,13.8,0]) circle(d=1);
        }
      }
      linear_extrude(3.5) {
          translate([4.5, -1, 0])
          color("yellow") square([5, 1]);
          translate([4.5, 14, 0])
          color("yellow") square([5, 1]);
      }
    }
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

module mounting_hole_insert() {
    color("#bcbd22")
    translate([45.85, -23, 0]) {
      translate([0,0,4.1])
      cylinder(h=4, r=1.4);
    }
}

module mounting_hole_inserts() {
    // Mounting holes
    mounting_hole_insert();
    translate([-27.432,4.572,0]) mounting_hole_insert();
    translate([-18.288,44.704,0]) mounting_hole_insert();
    translate([-36.132,25.02,0]) mounting_hole_insert();
    translate([-56.183,52.928,0]) mounting_hole_insert();
    translate([-75.399,46.599,0]) mounting_hole_insert();
    translate([-94.267,36.473,0]) mounting_hole_insert();
    translate([-94.241,17.313,0]) mounting_hole_insert();
    translate([-3.048,-16.256,0]) mounting_hole_insert();
}

// MCU cutout
module mcu_cutout() {
    color("pink") {
        translate([29.5, 10.2, 4.1])
        linear_extrude(10)
        square([19.5, 25]);

        // USB C port opening
        translate([34.25, 25.2, 4.1])
        linear_extrude(10)
        square([10, 20]);
    }
}

