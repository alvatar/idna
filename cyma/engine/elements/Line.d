module cyma.engine.elements.Line;

private {
	import std.stdio;

	import math.Vector;
	import cyma.engine.Element;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + A line is a geometric entity composed of 2 vectors
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
final class LineT( PointT, ColorT ) : Element {

	this( PointT pointA, PointT pointB ) {
		data.pointA = pointA;
		data.pointB = pointB;
	}

	/++
	 + Generate drawable representation on the fly
	 +/
	final protected DrawableObject generateDrawable() {
		return DrawableObject(DrawableObject.Types.Line, true, Data.sizeof, &data);
	}

	/++ 2 Points define a line +/
	struct Data {
		PointT pointA;
		PointT pointB;
		ColorT color;
	} Data data;

	/++
	 + Set line color
	 +/
	final void setColor( ColorT color ) {
		data.color = color;
	}

	/++ Make sure struct is well packed +/
	invariant() {
		assert( Data.sizeof == ((PointT.sizeof * 2) + ColorT.sizeof ));
    }

}

alias LineT!(vec2r, vec4r) Line;
