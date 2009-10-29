module cyma.view.canvas.GlCanvas;

private {
	import std.stdio;
	
	import dgl.Dgl;
	//import dgl.VERSION_2;
	import cyma.view.Canvas;
	import cyma.view.DrawableObject;
	import math.Vector;
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
	void draw( ref DrawableObject drawable ) {

		if( !drawable.modified ) return;

		switch( drawable.type ) {
			case drawable.Types.Line:
				struct Unpack {
					vec2r pointA;
					vec2r pointB;
					vec4r color;
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
				writeln("POLYLINE");
			break;
			case drawable.Types.Circle:
				writeln("CIRCLE");
			break;
			case drawable.Types.Arc:
				writeln("ARC");
			break;
			case drawable.Types.Rectangle:
				writeln("RECTANGLE");
			break;
			case drawable.Types.Image:
				writeln("IMAGE");
			break;
		}
	}
}
