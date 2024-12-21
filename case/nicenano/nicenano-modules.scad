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



