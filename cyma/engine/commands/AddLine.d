module cyma.engine.commands.AddLine;

private {
	import std.stdio;

	import cyma.engine.Command;
	import cyma.engine.elements.Line;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Add a single line
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
class AddLine(T...) : Command!(T) {

	void execute( Model model ) {
		auto tree = model
						.randomLayer
						.staticVectorSubstrate
						.tree;

		auto newChild = tree.createNode(
			new Line( (cast(DefineContext!(T))context).arguments)
		);

		tree.root.attachChild( newChild );

		model.addDelta!(Model.Deltas.New)( &newChild.value );

		model.updated;
	}
}
