module cyma.view.canvas_impl.all;

private {
	version( D_Version2 ) {
		import std.typetuple;
	} else {
		import tango.core.Tuple;
	}
}

package {
	import cyma.view.canvas;
	import cyma.view.drawableproxy;
}

private {
	import cyma.view.canvas_impl.glcanvas;
}

alias TypeTuple!( GlCanvas ) CanvasTypes;
