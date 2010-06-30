/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Copyright (c) 2010 by Álvaro Castro-Castilla, All Rights Reserved.
 + Licensed under the MIT/X11 license, see LICENSE file for full description
 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/

module cyma.engine.IdGenerator;

private {
	import std.random;
	import std.stdio;
}

alias long IdType;

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Generate and manage the unique Ids of the model elements
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
final class IdGenerator {

	private {
		Random _generator;
	}

	this() {
		_generator = Random(unpredictableSeed);
	}

	void setFreeId( IdType id ) {
	}

	IdType getNextId() {
		return uniform(0,uint.max,_generator);
	}
}
