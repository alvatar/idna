module cyma.view.canvas.All;

private {
	version( D_Version2 ) {
		import std.typetuple;
	} else {
		import tango.core.Tuple;
	}
}

package {
	import cyma.view.Canvas;
	import cyma.view.DrawableObject;
}

private {
	import cyma.view.canvas.GlCanvas;
}

alias TypeTuple!( GlCanvas ) CanvasTypes;
