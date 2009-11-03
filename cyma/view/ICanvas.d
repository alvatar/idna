module cyma.view.ICanvas;

private {
	import cyma.engine.Element;
}

interface ICanvas {

	void init();
	void updateEnvironment();
	void add( ref Element );
	void regenerate( ref Element );
	void remove( ref Element );
	void draw();
}

