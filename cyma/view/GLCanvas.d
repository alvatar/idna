module idna.cyma.view.GLCanvas;

private {
	import idna.tools.Compat;

	import idna.cyma.view.Drawer;
	import idna.cyma.view.DrawableObject;
}

public import idna.cyma.view.Canvas;

class GLCanvas : ICanvas
{
	/++
	 + Implementation of the init() method for OpenGL backend
	 +/
	void init()
	{
	}

	/++
	 + Implementation of the draw() method for OpenGL backend
	 +/
	void draw( DrawableObject drawable )
	{
		switch( drawable.type ) {
			case drawable.Type.Line:
				stdout("LINE");
			break;
			case drawable.Type.Polyline:
				stdout("POLYLINE");
			break;
			case drawable.Type.Circle:
				stdout("CIRCLE");
			break;
			case drawable.Type.Arc:
				stdout("ARC");
			break;
			case drawable.Type.Rectangle:
				stdout("RECTANGLE");
			break;
			case drawable.Type.Image:
				stdout("IMAGE");
			break;
		}
	}
}
