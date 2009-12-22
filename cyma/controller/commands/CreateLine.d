module cyma.controller.commands.CreateLine;

private {
	import std.stdio;

	import cyma.controller.InteractiveCommand;
	import cyma.engine.operations.AddLine;
	import math.Vector;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Create a single line
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
class CreateLine : InteractiveCommand!(uint, vec2r, vec2r) {

	this( Ui ui ) {
		super(ui);
	}

	import std.variant;
	override void execute( ref Model model ) {
		_ui.output().test5( 0xDEADC0DE );

		if( context is null ) {
			debug writeln("Command: Add line; No context defined -> requesting data");
			interactiveSequence( model );
		}

		addline( model, context.arguments );
	}

	override void revert( ref Model ) {
		// TODO
		// Implementation note: every command must take care of its own cache
		// method for reverting (keeping a copy of previous state or doing a
		// logical revert (inverse vectors)
	}

	import std.random;
	override void interactiveSequence( ref Model model ) {
		auto rnd = Random(unpredictableSeed);
		rnd.seed(unpredictableSeed);
		context = MakeContext(
					0u // You must supply the right type as it doesn't cast
					, vec2r( uniform(0,1.0,rnd), uniform(0,1.0,rnd) )
					, vec2r( uniform(0,1.0,rnd), uniform(0,1.0,rnd) )
					);
	}
}
