/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Copyright (c) 2010 by Álvaro Castro-Castilla, All Rights Reserved.
 + Licensed under the MIT/X11 license, see LICENSE file for full description
 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/

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
	import cyma.view.DrawableProxy;
}

private {
	import cyma.view.canvas.GlCanvas;
}

alias TypeTuple!( GlCanvas ) CanvasTypes;
