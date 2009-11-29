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
class TCreateLine(T...) : InteractiveCommand!(T) {

	this( Ui ui ) {
		super(ui);
	}

	import std.variant;
	void execute( ref Model model ) {
		//writeln(_ui.output());
		// TODO: BEAUTIFY with opDispatch
		//writeln( _ui.output()("test4",variantArray(0)) );
		_ui.output.test();

		if( context is null ) {
			debug writeln("Command: Add line; No context defined -> requesting data");
			interactiveSequence( model );
		}

		addline( model, context.arguments );
	}

	void revert( ref Model ) {
		// TODO
		// Implementation note: every command must take care of its own cache
		// method for reverting (keeping a copy of previous state or doing a
		// logical revert (inverse vectors)
	}

	import std.random;
	void interactiveSequence( ref Model model ) {
		auto rnd = Random(unpredictableSeed);
		rnd.seed(unpredictableSeed);
		context( MakeContext( 
					0u // You must supply the right type as it doesn't cast
					, vec2r( uniform(0,1.0,rnd), uniform(0,1.0,rnd) )
					, vec2r( uniform(0,1.0,rnd), uniform(0,1.0,rnd) )
					) );
	}
}

alias TCreateLine!(uint, vec2r, vec2r) CreateLine;
