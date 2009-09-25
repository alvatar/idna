module idna.cyma.view.Canvas;

private {
	import idna.tools.Compat;
	import idna.cyma.view.DrawableObject;
}

interface ICanvas
{
	void init();
	void draw( DrawableObject );
}
