module idna.cyma.view.GLCanvas;

private {
	import idna.cyma.view.Drawer;
}

class GLCanvas : ICanvas {
	this() {
		mixin Drawer.registerCanvas!(this);
	}
	/++
	 + Implementation of the draw() method for OpenGL backend
	 +/
	void draw( DrawableObject drawable ) {
	}
}
