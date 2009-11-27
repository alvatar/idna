module cyma.controller.ICanvas;

private {
	import cyma.engine.Element;
}

interface ICanvas {

	/+ Setup ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
	void init();
	void updateEnvironment();
	void clear();

	/+ Operations over DrawableProxies ++++++++++++++++++++++++++++++++++++++++/
	void add( ref Element );
	void regenerate( ref Element );
	void remove( ref Element );

	/+ Operations over the internal drawable structure ++++++++++++++++++++++++/
	void draw();
	void changed();
}

