module cyma.view.ICanvas;

private {
	import cyma.view.DrawableObject;
}

interface ICanvas {

	void init();
	void updateEnvironment();
	void draw( DrawableObject );
}

