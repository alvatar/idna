module cyma.engine.operations.AddLine;

private {
	import std.stdio;

	import cyma.engine.IdGenerator;
	import cyma.engine.elements.Line;
	import cyma.model.Model;
	import cyma.model.NodeTree;
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
