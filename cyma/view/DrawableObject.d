module idna.cyma.view.DrawableObject;

private {
	import idna.cyma.engine.Element;
}

/+
 + A drawable object is basically an element with some information for its
 + processing in different backends
 +/
class DrawableObject
{
	enum Type {
		Line
		, Polyline
		, Circle
		, Arc
		, Rectangle
		, Image
	}
	/++ The type of drawable object +/
	Type type;

	/++ Size in bytes of the drawable object +/
	size_t sizeInBytes;

	/++ The element to draw +/
	Element element;
}
