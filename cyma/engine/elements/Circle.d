/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Copyright (c) 2010 by Álvaro Castro-Castilla, All Rights Reserved.
 + Licensed under the MIT/X11 license, see LICENSE file for full description
 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/

module cyma.engine.elements.circle;

private {
	import cyma.engine.element;
}

class Circle : Element {
	protected DrawableProxy generateDrawable() {
		// TODO
		//debug(verbose) stdout("line!");
		DrawableProxy drawable;
		drawable.type = DrawableProxy.Types.Line;
		drawable.sizeInBytes = 2 * vec2.sizeof;
		return drawable;
	}

}
