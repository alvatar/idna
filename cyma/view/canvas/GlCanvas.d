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

	/++ Vertex and Color for VBOs +/
	struct Vertex { float x, y; }
	struct Color { float r, g, b, a; }

	/++ Indices VBO id +/
	GLuint vertexVBOid;

	/++ Vertices VBOs size +/
	GLsizei verticesBufSize = 0;

	/++ Host-side vertex data +/
	Vertex[] vertices;

	/+ Setup ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/

	void init() {
		gl.ext(VERSION_1_5) in {
			gl.createVBO (
				vertexVBOid 
				, vertices.ptr
				, verticesBufSize
				, GL_ARRAY_BUFFER
				, GL_DYNAMIC_DRAW
				);
		};
	}

	~this() {
		gl.ext(VERSION_1_5) in {
			gl.DeleteBuffers(1, &vertexVBOid);
		};

	}

	void updateEnvironment() {
		// Cast the DrawActor's environment to the right type for this canvas
		gl = cast(GL)drawActor.environment;
	}

	void clear() {
		_proxies.clear();
		verticesBufSize = 0;
		vertices = null;
	}

	/+ Operations over DrawableProxies ++++++++++++++++++++++++++++++++++++++++/

	/++
	 + Adds a new DrawableProxy associated to the element
	 +/
	void add( ref Element element ) {
		if( auto line = cast(Line)element ) {
			// Create new DrawableProxy
			// TODO

			//_proxies.add( DrawableProxy(&line, line.data.sizeof, &line.data) );



			/*
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
			*/
		} else if( cast(Polyline)element ) {
		}
	}
	
	/++
	 + Regenerates the DrawableProxy associated to the element
	 +/
	void regenerate( ref Element element ) {
		// TODO
		_proxies.get(element.id);
	}

	/++
	 + Removes the DrawableProxy associated to the element
	 +/
	void remove( ref Element element ) {
		//TODO
		_proxies.removeAt(element.id);
	}

	/+ Operations over the internal drawable structure ++++++++++++++++++++++++/

	/++
	 + Draws the VBO
	 +/
	void draw() {

		gl.ext(VERSION_1_5) in {
			if( _isProxiesChanged ) {
				try {
					updateVBO(gl);
					_isProxiesChanged = false;
				} catch( Exception e ) {
					writeln(e);
				}
			}

		};
	}

	import std.c.string;
	import std.random;
	private void updateVBO(GL gl) {
		// OPTIMIZATION: dynamically growing local buffer that will be uploaded to VBO only
		// up to the point it needs, using an accumulator of sizes that is updated in the same
		// loop

		// Sum drawable proxies' data sizes
		size_t verticesBufSize = 0;
		foreach( proxy; _proxies ) {
			verticesBufSize += proxy.sizeOfData;
		}

	}
}

