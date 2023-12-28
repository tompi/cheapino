height = 95.1738;
width = 132.6134;
$fn=100;

translate([0,0,7]) base_line();


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
    scale([factor, factor, 1])
      base();
}

module base()
{
  import("base.svg", center=false);
}
