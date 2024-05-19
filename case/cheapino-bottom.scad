use <hotswap.scad>

// height = 95.1738;
// width = 132.6134;
step = 0.05;
//$fn=30;

// hotswap socket is ~1.75 high at the highest.
// magsafe ring is 0.4 high
// 2.5 will leave 0.35 at the thinnest(between hotswap and magsafe).

height = 2.5;
$fn=30;


// bottom plate
module bottom()
{
color("pink")
translate([0,0,0])
  linear_extrude(height)
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
translate([0,0,-1])
linear_extrude(1)
rotate([0,180,0])
import("cheapino-brd.svg", center=true);
}

//import("plate_and_holes.svg", center=true);


difference()
{
  bottom();
translate([13,11,2.1])
 magsafe_ring();
 
// The exported board from KiCad, for debug
//translate([0,0,0])
// board();

// Columns starting from MCU
translate([19.3,-2.84,0])  
column();

translate([0.3,-0.3,0])  
column();

translate([-18.7,6.05,0])  
column();

translate([-37.7,-0.3,0])  
column();

translate([-56.7,-10.308,0])  
column();

// Thumb cluster
translate([14.6264,-24.52])  
switch();

rotate([0,0,-10])
translate([40.3,-19.3])  
switch();

rotate([0,0,-23])
translate([65.65,-7.09])  
switch();
 
// The horizontal diodes
translate([-18, 10.21, 0]) diode();
translate([-28.59, 10.21, 0]) diode();
translate([-26.23, 29.18, 0]) diode();
translate([-9.463,21.97,0]) diode();
translate([0.8, 21.97, 0]) diode();
translate([14.106, 19.872, 0]) diode();
translate([16.138,1.066,0]) diode();
translate([5.888,-19.128,0]) diode();
translate([-5.018, 2.971, 0]) diode();
translate([-37.267,3.555,0]) diode();
translate([-47.627,3.555,0]) diode();
translate([-61.234,12.013,0]) diode();
translate([-61.6,-7.011,0]) diode();
translate([-47.616,22.504,0]) diode();

// The vertical(ish) diodes
translate([10.61, 24.7, 0]) rdiode();
translate([10.585, 7.061, 0]) rdiode();
translate([29.66, 25.106, 0]) rdiode();
translate([28.365, -2.935, 0]) rdiode();
translate([10.585, -13.146, 0]) rdiode();
translate([25.977, -31.18, 0]) rdiode();

translate([46.5, -35.5, 0])
rotate(76)
diode();

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

mcu();

encoder();

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

// Inserts for silicone bumpers
bumper();
translate([0, -46, 0]) bumper();
translate([10.3, -67, 0]) bumper();
translate([-29.5, -61.6, 0]) bumper();
translate([-64, 7.5, 0]) bumper();
translate([-64, -31, 0]) bumper();
translate([-101, -47.7, 0]) bumper();
translate([-101, -9, 0]) bumper();

// Inserts for magnets
translate([24,26,0]) magnet();
translate([24,-18,0]) magnet();
translate([-43,28,0]) magnet();
translate([-43,-9,0]) magnet();
}