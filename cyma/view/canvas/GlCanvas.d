module idna.cyma.view.canvas.GlCanvas;

private {
	import xf.dog.Dog;
	import xf.omg.core.LinearAlgebra;

	import idna.tools.Compat;
	import idna.cyma.view.Canvas;
	import idna.cyma.view.DrawableObject;
}


/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Canvas using OpenGl
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
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

		switch( drawable.type ) {
			case drawable.Types.Line:
				struct Unpack {
					vec2 pointA;
					vec2 pointB;
				}
				Unpack* unpacked = cast(Unpack*)drawable.data;
				//gl.Clear(GL_COLOR_BUFFER_BIT);
				gl.withState(GL_BLEND).withoutState(GL_LIGHTING) in {
					gl.BlendFunc( GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA );
					//gl.Rotatef(.055f, 0, 0, 1);
					gl.immediate( GL_LINES, {
						gl.Color4f (1,    0,    0, 0.9f);
						gl.Vertex3f(unpacked.pointA.x,  unpacked.pointA.y,   -1);
						gl.Color4f (0,    1,    0, 0.5f);
						gl.Vertex3f(unpacked.pointB.x,  unpacked.pointB.y,   -1);
					} );
				};
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
