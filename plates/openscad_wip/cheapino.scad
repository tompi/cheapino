height = 95.1738;
width = 132.6134;
$fn=30;

height_translation = 10;
for (i = [1:0.5:10])
{
	height_translation = height_translation + 10;
    translate([0,0,i])
        base_extended (1 + (i*01), i);
}

/*
for (i = [11:0.5:20])
{
	height_translation = height_translation + 10;
	translate(10,0,i)
	 base_extended (1.2+ (i*-0.01), height_translation);
}
*/

module base_extended (factor, extrusion)
{
    linear_extrude(extrusion)
    //scale( [factor, factor, 11])
        base();
}

module base()
{
	import ("base.svg", center=false);
}

/*
module base_line()
{
  difference()
  {
    base_extended(1.05, 1);
    base_extended(1, 2);
  }
}

module base_extended(factor, extrusion)
{
  linear_extrude(extrusion)
    offset([factor, factor, 1])
      base();
}

module base()
{
  import("base.svg", center=false);
}
*/