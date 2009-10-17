module dgl.GLContext;

public {
	import dgl.Common;
	import dgl.OpenGL;
	import util.Use;
}



abstract class GLContext {
	abstract GLContext	create();
	abstract GLContext	destroy();
	abstract GLContext	show();
	abstract GL				begin();
	abstract void				end();
	
	
	void useInHandler(void delegate(GL) dg) {
		synchronized (this) {
			dg(begin());
			end();
		}
	}


	GLContext width(size_t w) {
		_width = w;
		return this;
	}
	
	
	size_t width() {
		return _width;
	}
	
	
	GLContext height(size_t h) {
		_height = h;
		return this;
	}
	
	
	size_t height() {
		return _height;
	}
	
	
	GLContext colorBits(size_t b) {
		_colorBits = b;
		return this;
	}
	
	
	size_t colorBits() {
		return _colorBits;
	}
	
	
	GLContext depthBits(size_t d) {
		_depthBits = d;
		return this;
	}
	
	
	size_t depthBits() {
		return _depthBits;
	}
	
	
	GLContext alphaBits(size_t a) {
		_alphaBits = a;
		return this;
	}
	
	
	size_t alphaBits() {
		return _alphaBits;
	}
	
	
	GLContext stencilBits(size_t s) {
		_stencilBits = s;
		return this;
	}
	
	
	size_t stencilBits() {
		return _stencilBits;
	}
	
	
	bool created() {
		return _created;
	}
	

	void reshape(void delegate(size_t width, size_t height) dg) {
		_reshapeCallback = dg;
	}
	
	
	protected {
		size_t		_width			= 640;
		size_t		_height			= 480;
		size_t		_colorBits 		= 0;
		size_t		_depthBits		= 16;
		size_t		_alphaBits		= 0;
		size_t		_stencilBits	= 0;
		
		bool		_created = false;

		void delegate(size_t width, size_t height)	_reshapeCallback;
	}
}
