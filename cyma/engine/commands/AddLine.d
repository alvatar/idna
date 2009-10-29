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
		tree.root
			.attachChild(
				tree.createNode(
					new Line(
						(cast(DefineContext!(T))context).arguments
					)
				)
			);
		debug(verbose) writeln("Addline executed");
	}
}
