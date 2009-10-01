module idna.cyma.view.canvas.GlCanvas;

private {
	import xf.dog.Dog;

	import idna.tools.Compat;
	import idna.cyma.view.Canvas;
	import idna.cyma.view.DrawableObject;
}


class GlCanvas : Canvas {

	/++
	 + Implementation of the init() method for OpenGL backend
	 +/
	void init() {
	}

	/++
	 + Implementation of the draw() method for OpenGL backend
	 +/
	void draw( DrawableObject drawable ) {
		// Cast the DrawActor's environment to the right type for this canvas
		GL gl = cast(GL)drawActor.environment;

		gl.Clear(GL_COLOR_BUFFER_BIT);

		gl.withState(GL_BLEND).withoutState(GL_LIGHTING) in {
			gl.BlendFunc( GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA );
			gl.Rotatef(.005f, 0, 0, 1);
			gl.immediate( GL_TRIANGLES, {
				gl.Color4f (1,    0,    0, 0.5f);
				gl.Vertex3f(-1,  -1,   -2);

				gl.Color4f (0,    1,    0, 0.5f);
				gl.Vertex3f(1,   -1,   -2);

				gl.Color4f (0,    0,    1, 0.5f);
				gl.Vertex3f(0,    1,   -2);
				} );
		};

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
	}
}
