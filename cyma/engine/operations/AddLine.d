/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Copyright (c) 2010 by Álvaro Castro-Castilla, All Rights Reserved.
 + Licensed under the MIT/X11 license, see LICENSE file for full description
 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/

module cyma.engine.operations.AddLine;

private {
	import std.stdio;

	import cyma.engine.IdGenerator;
	import cyma.engine.elements.Line;
	import cyma.model.Model;
	import cyma.model.NodeTree;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + addline: add a line to the given model
 + arguments:
 + [0] uint - layer id
 + [1] vec3r - pointA
 + [2] vec3r - pointB
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
bool addline(T...)( ref Model model, ref T arguments )
in {
	static assert( arguments.length == 3
			&& is( typeof(arguments[0]) == uint )
			&& is( typeof(arguments[1]) == typeof(arguments[2]) )
			, "Incorrect input fed to addline function" );
	assert( arguments[0] >= 0 );
} body {
	debug if(model is null) return false;

	NodeTree tree;
	// If the layer number is 0, take a random layer tree
	if( arguments[0] == 0 ) {
		tree = model
				.randomLayer
				.staticVectorSubstrate
				.tree;
	}
	auto newChild = tree.createNode(
			new Line(arguments[1..$], model.nextId)
			);
	tree.root.attachChild( newChild );
	model.addDelta!(Model.Access.New)( &newChild.value );

	model.updated;

	return true;
}
