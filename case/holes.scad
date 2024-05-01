
$fn=100;

height_translation = 0;


module holes()
{
	import ("holes.svg", center=false);
}


linear_extrude(1.6)      holes();

