
$fn = $preview ? 10 : 100;

height_translation = 0;


module plate()
{
	import ("plate.svg", center=false);
}

linear_extrude(1.6)
      plate();
