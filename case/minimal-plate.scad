$fn = $preview ? 10 : 50;

height_translation = 0;
include <modules.scad>
difference() {
  translate([0,0, top_of_pcb + 4.1]) 
  linear_extrude(1.6)
  import ("plate-minimal.svg", center=true);;

  // For debug: comment out above 3 lines and comment in this
  //translate([0,0,4.1])
  //      board();

  translate([0,0,top_of_pcb]) switch_holes();

}