include <../modules.scad>

mcu_width = 20.5;
mcu_length = 45;
mcu_offset_x = 29;
mcu_offset_y = 10.2;
mcu_notch_width = 2;
battery_length=25;
battery_width=22;

// MCU cutout
module mcu_wireless_cutout() {
    color("pink") {
        translate([mcu_offset_x, mcu_offset_y, 4.1])
        linear_extrude(10)
        square([mcu_width, mcu_length]);

        translate([mcu_offset_x - mcu_notch_width/2, mcu_offset_y+13, 5.6])
        linear_extrude(1.5)
        square([mcu_width  + mcu_notch_width, mcu_length-13]);
    }
    
    color("red") {
        translate([mcu_offset_x+0.5, mcu_offset_y-10, 4.1])
        linear_extrude(10)
        square([mcu_width-1, 10]);    
    }
    color("orange") {
        translate([mcu_offset_x-3, mcu_offset_y-5-battery_length, 4.1])
        linear_extrude(4.4)
        square([battery_width, battery_length]);    
    }
}

module power_switch_cutout() {
    color("cyan") {
        translate([40, -20, 4.1])
        linear_extrude(4)
        square([20, 8.5]);        
    }
}


module case_top(step) {
  // Rotate so you dont need to do that in extruder
  translate([0,0,9.1])
  rotate([0,180,0])
  difference() {
    case(step);
    linear_extrude(4.1) offset(delta=0.45) base();

    // For debug: comment out above 5 lines and comment in this
    //translate([0,0,4.1]) 
    //      board();

    translate([0,0,top_of_pcb]) switch_holes();

    translate([0, 0, top_of_pcb]) diodes();

    mcu_wireless_cutout();

    power_switch_cutout();

    mounting_hole_inserts();
  }
}
