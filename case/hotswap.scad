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
  color("yellow")
  translate([0,0,1.85])
  rotate([180,0,0])
    hotswap_mx();
 
  // main pin of switch
  // 4mm d, 2.8mm high, 1.6mm pcb 
  // means 1.2 of it sticks below, 1.3 for margin 
  color("teal")
  translate([-0.57, -4.7, 0])
  linear_extrude(height=1.3)
  circle(d=4.2);
  
  // The two switch alignment pins
  // Could not find specs for these, assuming max 3.3=1.7 below
  color("brown")
  translate([-5.74, -4.7, 0])
  linear_extrude(height=1.7)
  circle(d=1.8);
 
  color("brown")
  translate([4.45, -4.7, 0])
  linear_extrude(height=1.7)
  circle(d=1.8);
  
}

module diode() {
color("blue")
linear_extrude(height=1.65)
square([9.5, 1.6]);
}

module magsafe_ring()
{
linear_extrude(height=0.5)
difference() {
    circle(d=55.3);
    circle(d=50.2);
  }
}



/*
hotswap_mx();

color("green")
translate([0,0,0]) 
 import("hotswap.stl");
 */