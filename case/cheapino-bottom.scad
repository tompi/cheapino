use <hotswap.scad>

height = 95.1738;
width = 132.6134;
step = 0.05;
$fn=30;

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
linear_extrude(1)
rotate([0,180,0])
import("cheapino-brd.svg", center=true);
}

//import("plate_and_holes.svg", center=true);


//difference()
//{
//  bottom();
//v  translate([13,11,-0.4])
 // magsafe_ring();
 
// The exported board from KiCad, for debug
translate([0,0,0])
 board();

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
 
// The diodes
translate([-18, 10.21, 0]) diode();
translate([-28.59, 10.21, 0]) diode();
translate([-26.23, 29.18, 0]) diode();
translate([-9.463,21.97,0]) diode();
translate([0.8, 21.97, 0]) diode();
translate([14.106, 19.872, 0]) diode();
translate([16.138,1.066,0]) diode();
translate([5.888,-19.128,0]) diode();
translate([-5.018, 2.971, 0]) diode();
translate([-18,10.21,0]) diode();

/*
translate([-18,10.21,0]) diode();
translate([-18,10.21,0]) diode();
translate([-18,10.21,0]) diode();
translate([-18,10.21,0]) diode();
translate([-18,10.21,0]) diode();
translate([-18,10.21,0]) diode();
translate([-18,10.21,0]) diode();
translate([-18,10.21,0]) diode();
translate([-18,10.21,0]) diode();
translate([-18,10.21,0]) diode();
translate([-18,10.21,0]) diode();
translate([-18,10.21,0]) diode();
translate([-18,10.21,0]) diode();
translate([-18,10.21,0]) diode();
 */
//} 
// circle(55.3);