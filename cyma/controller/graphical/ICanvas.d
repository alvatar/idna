/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Copyright (c) 2010 by Álvaro Castro-Castilla, All Rights Reserved.
 + Licensed under the MIT/X11 license, see LICENSE file for full description
 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/

module cyma.controller.graphical.ICanvas;

private {
	import cyma.engine.Element;
}

interface ICanvas {

	/+ Setup ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
	void init();
	void updateContext();
	void clear();

	/+ Operations over DrawableProxies ++++++++++++++++++++++++++++++++++++++++/
	void add( ref Element );
	void regenerate( ref Element );
	void remove( ref Element );

	/+ Operations over the internal drawable structure ++++++++++++++++++++++++/
	void draw();
	void changed();
}

