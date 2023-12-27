$fn=10;

# minkowski()
# {
translate([0,0,15]) base();
base();
# }

module base()
{
  linear_extrude(1.6)
    scale([1.05, 1.05, 1])
      import("base.svg", center=true);
}
