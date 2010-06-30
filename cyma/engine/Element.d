/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Copyright (c) 2010 by Álvaro Castro-Castilla, All Rights Reserved.
 + Licensed under the MIT/X11 license, see LICENSE file for full description
 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/

module cyma.engine.Element;

protected {
	import cyma.engine.IdGenerator;
	import cyma.view.DrawableProxy;
}

abstract class Element {
	protected IdType _id;
	public IdType id() {
		return _id;
	}
}

