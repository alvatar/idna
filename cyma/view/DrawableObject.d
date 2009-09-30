module idna.cyma.view.DrawableObject;

private {
	import idna.tools.Compat;
}

/+
 + A drawable object is basically an element with some information for its
 + processing in different backends
 +/
struct DrawableObject {
	
	enum Types {
		Line
		, Polyline
		, Circle
		, Arc
		, Rectangle
		, Image
	}

	/++ The type of drawable object +/
	Types type;

	/++ Size in bytes of the drawable object +/
	size_t sizeInBytes = 0;

	/++ The data of the drawable object +/
	void* data;
}
