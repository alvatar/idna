module cyma.view.canvas.GlCanvas;

private {
	import std.stdio;
	
	import dgl.dgl;
	import dgl.glconsts;
	import dgl.ext.VERSION_1_5;
	import dgl.ext.VERSION_2_0;
	import cyma.engine.elements.All;
	import cyma.view.Canvas;
	import math.Vector;
}


/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Canvas using OpenGl
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
final class GlCanvas : Canvas {

	private {
		/++ OpenGL context +/
		GL gl;

		/++ Vertex for VBO +/
		struct VertexData {
			float x, y;
			float r, g, b, a;
		}
		
		/++ Vertex buffers IDs +/
		GLuint vboIDs[1];

		/++ Host-side vertex data +/
		void[] _vertices;
	}

	/+ Setup ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/

	final void init() {
		gl.ext(VERSION_1_5) in {
			if(!_initialized) {
				gl.GenBuffers(1, &vboIDs[0]);

				gl.BindBuffer( GL_ARRAY_BUFFER, vboIDs[0] );
				gl.BufferData( GL_ARRAY_BUFFER
						, _vertices.length
						, _vertices.ptr
						, GL_STREAM_DRAW );

				_initialized = true;
			}
		};
	}

	~this() {
		gl.ext(VERSION_1_5) in {
			gl.DeleteBuffers(1, &vboIDs[0]);
		};

	}

	final void updateContext() {
		// Cast the DrawActor's environment to the right type for this canvas
		gl = cast(GL)drawActor.context;
	}

	final void clear() {
		_proxies.clear();
		delete _vertices;
		_vertices.length = 0;
	}

	/+ Operations over DrawableProxies ++++++++++++++++++++++++++++++++++++++++/

	/++
	 + Adds a new DrawableProxy associated to the element
	 +/
	final void add( ref Element element ) {
		// OPTIMIZATION?: memory allocator with dynamic arrays
		if( auto line = cast(Line)element ) {
			// Build data (optimization: if too small, add empty proxy)
			auto proxyData = [VertexData( line.pointA.x
											, line.pointA.y
											, 1.0, 1.0, 1.0, 1.0
										)
										, VertexData( line.pointB.x
											, line.pointB.y
											, 1.0, 1.0, 1.0, 1.0
										)];
			// TODO: set an existing one if available IDs
			_proxies.add( element.id, DrawableProxy(&element, proxyData.dup) );
		} else if( cast(Polyline)element ) {
		}
	}
	
	/++
	 + Regenerates the DrawableProxy associated to the element
	 +/
	final void regenerate( ref Element element ) {
		// OPTIMIZATION?: memory allocator with dynamic arrays
		if( auto line = cast(Line)element ) {
			// Build data (optimization: if too small, add empty proxy)
			auto proxyData = [VertexData( line.pointA.x
											, line.pointA.y
											, 1.0, 1.0, 1.0, 1.0
										)
										, VertexData( line.pointB.x
											, line.pointB.y
											, 1.0, 1.0, 1.0, 1.0
										)];
			_proxies[cast(uint)element.id].data = proxyData;
		} else if( cast(Polyline)element ) {
		}
	}

	/++
	 + Removes the DrawableProxy associated to the element
	 +/
	final void remove( ref Element element ) {
		// Removing a DrawableProxy consists in nullifying its data. It leaves
		// the object for substitution with a new one. It must then inform the
		// ID management system that it has been freed.
		_proxies[element.id].data = null;
		// TODO: available IDs!
	}

	/+ Operations over the internal drawable structure ++++++++++++++++++++++++/

	/++
	 + Draws the VBO
	 +/
	final void draw() {

		gl.ext(VERSION_1_5) in {
			if( _isProxiesChanged ) {
				debug {
					try {
						_isProxiesChanged = false;
						_updateVBO(gl);
					} catch( Exception e ) {
						writeln(e);
					}
				} else {
					_isProxiesChanged = false;
					_updateVBO(gl);
				}
			}
			_drawVBO(gl);
		};
	}

	/++
	 + Update the VBO, used when proxies have been changed
	 +/
	final private void _updateVBO(GL gl) {
		// POSSIBLE OPTIMIZATION: dynamically growing local buffer that will be uploaded to VBO only
		// up to the point it needs, using an accumulator of sizes that is updated in the same
		// loop

		// Sum drawable proxies' data sizes
		size_t proxiesSizeCouter = 0;
		foreach( proxy; _proxies ) {
			if( proxy.data ) {
				proxiesSizeCouter += proxy.data.length;
			}
		}
		_vertices.length = proxiesSizeCouter;

		// Fill the local buffer
		size_t i; foreach( proxy; _proxies ) {
			if( proxy.data ) {
				_vertices[i .. i+proxy.data.length] = proxy.data;
				i += 2*VertexData.sizeof;
			}
		}

		// Upload the local buffer
		gl.ext(VERSION_1_5) in {
			gl.EnableClientState(GL_VERTEX_ARRAY);
			gl.EnableClientState(GL_COLOR_ARRAY);

			gl.BindBuffer(GL_ARRAY_BUFFER, vboIDs[0]);

			/* foreach( vertex; cast(VertexData[])_vertices ) {
				writeln(vertex);
			} */
			gl.BufferData(GL_ARRAY_BUFFER
						, _vertices.length
						, _vertices.ptr
						, GL_STREAM_DRAW );
			// When buffers are binded, vertex pointers are specified in pointer offsets
			gl.VertexPointer(2
						, GL_FLOAT
						, VertexData.sizeof
						, null);
			gl.ColorPointer( 4
						, GL_FLOAT
						, VertexData.sizeof
						, cast(void*)(2*float.sizeof) );

			gl.DisableClientState(GL_VERTEX_ARRAY); 
			gl.DisableClientState(GL_COLOR_ARRAY);
			gl.BindBuffer(GL_ARRAY_BUFFER, 0);
		};
	}

	/++
	 + Draw the VBO in the OpenGL context
	 +/
	final private void _drawVBO(GL gl) {
		gl.EnableClientState(GL_VERTEX_ARRAY);
		gl.EnableClientState(GL_COLOR_ARRAY);

		gl.Ortho( -1.0, 1.0, -1.0, 1.0, 0.0, 100.0 );

		gl.DrawArrays(GL_LINES, 0, _vertices.length/VertexData.sizeof);

		gl.DisableClientState(GL_VERTEX_ARRAY); 
		gl.DisableClientState(GL_COLOR_ARRAY);
	}
}

