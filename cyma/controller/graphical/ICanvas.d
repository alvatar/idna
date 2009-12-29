module cyma.controller.graphical.ICanvas;

private {
	import cyma.engine.Element;
}

interface ICanvas {

	/+ Setup ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
	void init();
	void updateContext();
	void clear();

	/+ Operations over DrawableProxies ++++++++++++++++++++++++++++++++++++++++/
	void add( ref Element );
	void regenerate( ref Element );
	void remove( ref Element );

	/+ Operations over the internal drawable structure ++++++++++++++++++++++++/
	void draw();
	void changed();
}
