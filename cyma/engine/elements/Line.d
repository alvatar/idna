module cyma.engine.elements.Line;

private {
	import io.Stdout;
	import cyma.engine.Element;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + A line is a geometric entity composed of 2 vectors
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
final class Line : Element {

	struct vec2 {
		float x;
		float y;
	}

	struct vec4 {
		float r;
		float g;
		float b;
		float a;
	}

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
		vec4 color;
	} Data data;

	/++
	 + Set line color
	 +/
	void setColor( vec4 color ) {
		data.color = color;
	}

	/++ Make sure struct is packed +/
	invariant() {
		assert( Data.sizeof == ((vec2.sizeof * 2) + vec4.sizeof ));
    }

}
