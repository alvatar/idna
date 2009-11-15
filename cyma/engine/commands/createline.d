module cyma.engine.commands.createline;

private {
	import std.stdio;

	import cyma.engine.command;
	import cyma.engine.operations.all;
	import math.vector;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Add a single line
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
class TCreateLine(T...) : Command!(T) {

	void execute( ref Model model ) {

		if( !context ) {
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
