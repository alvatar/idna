module cyma.view.icanvas;

private {
	import cyma.engine.element;
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

