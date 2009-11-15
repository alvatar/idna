module cyma.view.drawableproxy;

private {
	import cyma.engine.element;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + A drawable object is basically an element with some information for its
 + processing in different backends
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
struct DrawableProxy {

	/++ Link to the element this proxy is representing +/
	Element* element = void;

	/++ The data of the drawable object +/
	void[] data = void;
}
