$fn = $preview ? 5 : 50;
$step = $preview ? 0.5 : 0.05;

include <nicenano-modules.scad>

mirror()
case_top($step);
