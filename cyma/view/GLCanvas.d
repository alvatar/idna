module idna.cyma.view.GLCanvas;

private {
	import idna.tools.Compat;

	import idna.cyma.view.DrawableObject;
}

public import idna.cyma.view.Canvas;

class GLCanvas : ICanvas {
	/++
	 + Implementation of the init() method for OpenGL backend
	 +/
	void init() {
	}

	/++
	 + Implementation of the draw() method for OpenGL backend
	 +/
	void draw( DrawableObject drawable ) {
		/*
		switch( drawable.type ) {
			case drawable.Types.Line:
			break;
			case drawable.Types.Polyline:
				stdout("POLYLINE");
			break;
			case drawable.Types.Circle:
				stdout("CIRCLE");
			break;
			case drawable.Types.Arc:
				stdout("ARC");
			break;
			case drawable.Types.Rectangle:
				stdout("RECTANGLE");
			break;
			case drawable.Types.Image:
				stdout("IMAGE");
			break;
		}
		*/
	}
}
