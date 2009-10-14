module idna.cyma.view.ICanvas;

private {
	import idna.cyma.view.DrawableObject;
}

interface ICanvas {

	void init();
	void updateEnvironment();
	void draw( DrawableObject );
}

