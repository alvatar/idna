module cyma.engine.operations.addline;

private {
	import std.stdio;

	import cyma.engine.idgenerator;
	import cyma.engine.elements.line;
	import cyma.model.model;
	import cyma.model.nodetree;
}

bool addline(T...)( ref Model model, ref T arguments ) {
	debug if(model is null) return false;

	NodeTree tree;
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
