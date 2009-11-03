module cyma.view.canvas.GlCanvas;

private {
	import std.stdio;
	
	import dgl.Dgl;
	import dgl.GLConsts;
	import dgl.ext.VERSION_1_5;
	import dgl.ext.VERSION_2_0;
	import dgl.Utils;
	import cyma.engine.elements.all;
	import cyma.view.Canvas;
	import math.Vector;
}


/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Canvas using OpenGl
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
class GlCanvas : Canvas {

	/++ OpenGL context +/
	private {
		GL gl;
	}

	struct Vertex {
		vec2f pointA;
		vec2f pointB;
		vec4f color;
	}

	/++ Indices VBO id +/
	GLuint vertexVBOid;

	/++ Initial VBOs size +/
	immutable(GLsizei) initialBufSize = 0;

	/++ Host-side vertex data +/
	Vertex[] vertices;

	/++ Implementation of interface +/
	void init() {
		gl.ext(VERSION_1_5, VERSION_2_0) in {
			gl.createVBO (
					vertexVBOid 
					, vertices.ptr
					, initialBufSize
					, GL_ARRAY_BUFFER
					, GL_DYNAMIC_DRAW
					);
		};
	}

	/++ Implementation of interface +/
	void updateEnvironment() {
		// Cast the DrawActor's environment to the right type for this canvas
		gl = cast(GL)drawActor.environment;
	}

	/++ Implementation of interface +/
	void add( ref Element element ) {

		// Drawing algorithms
		if( auto line = cast(Line)element ) {

			gl.withState(GL_BLEND).withoutState(GL_LIGHTING) in {
				gl.BlendFunc( GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA );
				gl.immediate( GL_LINES, {
					gl.Color4f( line.data.color.r
						, line.data.color.g
						, line.data.color.b
						, line.data.color.a );
					gl.Vertex3f( line.data.pointA.x, line.data.pointA.y, -1 );
					gl.Color4f( line.data.color.r
						, line.data.color.g
						, line.data.color.b
						, line.data.color.a );
					gl.Vertex3f( line.data.pointB.x, line.data.pointB.y, -1 );
				} );
			};

		} else if( cast(Polyline)element ) {
		}
	}
	
	void regenerate( ref Element element ) {
		// TODO
	}

	void remove( ref Element element ) {
		// TODO
	}

	void draw() {
		// TODO
	}
}
