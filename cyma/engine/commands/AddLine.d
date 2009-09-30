module idna.cyma.engine.commands.AddLine;

private {
	import xf.omg.core.LinearAlgebra;

	import idna.tools.Compat;
	import idna.cyma.engine.Command;
	import idna.cyma.engine.elements.Line;
}

class AddLine : Command {

	void execute( Model model ) {
		model
			.randomLayer
			.staticVectorSubstrate
			.addNode(
				new Node(
					new Line( vec2(0,0), vec2(10,10) ), true
					)
				);
		debug(verbose) stdout("Addline executed");
	}
}
