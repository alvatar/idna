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

	private {
		GL gl;
	}

	void updateEnvironment() {
		// Cast the DrawActor's environment to the right type for this canvas
		gl = cast(GL)drawActor.environment;
	}

	/++
	 + Implementation of the draw() method for OpenGL backend
	 +/
	void draw( DrawableObject drawable ) {
		switch( drawable.type ) {
			case drawable.Types.Line:
				struct Unpack {
					vec2 pointA;
					vec2 pointB;
					vec4 color;
				}
				Unpack* unpacked = cast(Unpack*)drawable.data;

				gl.withState(GL_BLEND).withoutState(GL_LIGHTING) in {
					gl.BlendFunc( GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA );
					gl.immediate( GL_LINES, {
						gl.Color4f( unpacked.color.r
							, unpacked.color.g
							, unpacked.color.b
							, unpacked.color.a );
						gl.Vertex3f(unpacked.pointA.x,  unpacked.pointA.y,   -1);
						gl.Color4f( unpacked.color.r
							, unpacked.color.g
							, unpacked.color.b
							, unpacked.color.a );
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
