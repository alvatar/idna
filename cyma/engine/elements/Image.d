module dnia.dosd.engine.elements.Line;

private {
	import xf.omg.core.LinearAlgebra;
}

/++
 + A line is a geometric entity composed of 2 vectors
 +/
class Line : Element {
	/++ 2 Points define a line +/
	vec2 pointA;
	vec2 pointB;
}