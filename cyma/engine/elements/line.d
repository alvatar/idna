module cyma.engine.elements.line;

private {
	import std.stdio;

	import math.vector;
	import cyma.engine.element;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + A line is a geometric entity composed of 2 points
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
final class LineT( PointT, ColorT ) : Element {

	this( PointT _pointA, PointT _pointB, IdType id ) {
		pointA = _pointA;
		pointB = _pointB;
		_id = id;
	}

	/++ 2 Points define a line +/
	PointT pointA;
	PointT pointB;
	ColorT color;

	/++
	 + Set line color
	 +/
	final void setColor( ColorT _color ) {
		color = _color;
	}
}

alias LineT!(vec2r, vec4f) Line;
