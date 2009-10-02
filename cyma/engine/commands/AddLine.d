module idna.cyma.engine.commands.AddLine;

private {
	import xf.omg.core.LinearAlgebra;

	import tango.math.random.Random;

	import idna.tools.Compat;
	import idna.cyma.engine.Command;
	import idna.cyma.engine.elements.Line;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Add a single line
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
class AddLine : Command {

	void execute( Model model ) {
		auto r = new Random;
		model
			.randomLayer
			.staticVectorSubstrate
			.addNode(
				new Line(
					vec2(r.uniformR(1.0f),r.uniformR(1.0f)), vec2(0.0,0.0)
				)
			);
		debug(verbose) stdout("Addline executed");
	}
}
