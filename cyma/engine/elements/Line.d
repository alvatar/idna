module idna.cyma.engine.elements.Line;

private {
	import xf.omg.core.LinearAlgebra;

	import idna.tools.Compat;
	import idna.cyma.engine.Element;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + A line is a geometric entity composed of 2 vectors
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
final class Line : Element {

	this( vec2 pointA, vec2 pointB ) {
		data.pointA = pointA;
		data.pointB = pointB;
	}

	/++
	 + Generate drawable representation on the fly
	 +/
	protected DrawableObject generateDrawable() {
		return DrawableObject(DrawableObject.Types.Line, Data.sizeof, &data);
	}

	/++ 2 Points define a line +/
	struct Data {
		vec2 pointA;
		vec2 pointB;
	} Data data;

	/++ Make sure struct is packed +/
	invariant() {
		assert( Data.sizeof == (vec2.sizeof * 2) );
    }

}
