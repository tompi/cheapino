use <modules.scad>

// height = 95.1738;
// width = 132.6134;
step = 0.04;
//$fn=30;

// hotswap socket is ~1.75 high at the highest.
// magsafe ring is 0.4 high
// 2.5 will leave 0.35 at the thinnest(between hotswap and magsafe).


$fn=50;

// Rotate so you dont need to do that in extruder
translate([0,0,2.5])
rotate([0,180,0])
mirror()
{
    difference() {
      bottom();
        //translate([13,11,2.1])
        // magsafe_ring();

        // The exported board from KiCad, for debug
        //translate([0,0,0])
        // board();

        switches(true);

        diodes();

        rj45();

        mcu();

        encoder();

        mounting_holes();

        // Inserts for silicone bumpers
        translate([0, -5, 0]) bumper();
        translate([0, -46, 0]) bumper();
        translate([13, -61.5, 0]) bumper();
        translate([-29.5, -54.6, 0]) bumper();
        translate([-63.3, 12.6, 0]) bumper();
        translate([-63.5, -24.3, 0]) bumper();
        translate([-101, -41.2, 0]) bumper();
        translate([-101, -3, 0]) bumper();

        // Inserts for magnets near MCU
        translate([24,17,0]) magnet();
        translate([24,-18,0]) magnet();


        // Inserts for magnets near bottom
        translate([-43,36.8,0]) magnet();
        translate([-43,-0.2,0]) magnet();
    }
}
