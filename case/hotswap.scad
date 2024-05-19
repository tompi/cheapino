//$fn=50;

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
square([11.1,4.2], center=true); 

translate([0,1.9,0])
linear_extrude(height=thickness)
square([5.65, 2.09]); 

// Metal soldering parts
translate([5.45,1.04,0])
linear_extrude(height=thickness)
square([2.5, 2.55]); 

translate([-7.95,-1.7,0])
linear_extrude(height=thickness)
square([2.5, 2.55]); 
}

module column() {
switch();

translate([0, 19, 0]) switch();

translate([0, 38, 0]) switch();
}
 
module switch() {
  // hotswap socket
  color("#ff7f0e")
  translate([0,0,1.85])
  rotate([180,0,0])
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
linear_extrude(height=1.65)
square([9.5, 1.6]);
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
    color("#7f7f7f")
    linear_extrude(0.6) {
        translate([35.7, 29.8])
        square([7,2]);
        translate([32.65, 21.6])
        square([2, 3.3]);
        translate([43.85, 21.6])
        square([2, 3.3]);
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
      cylinder(h=1.5, r1=1, r2=2);

      translate([0,0,1.5])
      cylinder(h=4, r=2);
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
/*
hotswap_mx();

color("green")
translate([0,0,0]) 
 import("hotswap.stl");
 */