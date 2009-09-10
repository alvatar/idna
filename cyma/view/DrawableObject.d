module idna.cyma.view.DrawableObject;

private {
	import idna.cyma.engine.Element;
}

/+
 + A drawable object is basically an element with some information for its
 + processing in different backends
 +/
class DrawableObject {
	/++ The type of drawable object +/
	uint type;

	/++ The element to draw +/
	Element element;
}
