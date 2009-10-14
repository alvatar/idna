module idna.cyma.engine.commands.AddLine;

private {
	import xf.omg.core.LinearAlgebra;

	import idna.tools.Compat;
	import idna.cyma.engine.Command;
	import idna.cyma.engine.elements.Line;
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
		debug(verbose) stdout("Addline executed");
	}
}
