module cyma.controller.commands.CreateLine;

private {
	debug import std.stdio;

	import io.input.input;
	import math.Vector;

	import cyma.controller.Command;
	import cyma.engine.operations.AddLine;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Create a single line
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
class CreateLine : ContextualizedCommand!(uint, vec2r, vec2r) {

	mixin MakeCommandConstructor;

	override bool execute( ref Model model ) {
		//_ui.output().test5( 0xDEADC0DE );
		//output.test5( 0xDEADC0DE );

		if( context is null ) {
			debug writeln("Command: Add line; No context defined -> requesting data");
			interactive( model );
			return false;
		} else {
			addline( model, context.arguments );
			return true;
		}
	}

	override void revert( ref Model model ) {
		// TODO
		// Implementation note: every command must take care of its own cache
		// method for reverting (keeping a copy of previous state or doing a
		// logical revert (inverse vectors)
	}

	override void pipe( Variant input ) {
		alias MouseInput* Mouse;
		alias KeyboardInput[]* Keyboard;
		if( input.type == typeid(Mouse) ) {
			auto mouse = input.get!(Mouse);
			//writeln("MOUSE IN COMMAND");
			//writeln(mouse.position);
		} else if( input.type == typeid(Keyboard) ) {
			auto keyboard = input.get!(Keyboard);
			//writeln("KEYBOARD IN COMMAND");
			//writeln((*keyboard)[0].unicode);
		}
	}

	private :

	import std.random;
	void interactive( ref Model model ) {
		auto rnd = Random(unpredictableSeed);
		rnd.seed(unpredictableSeed);
		context = MakeContext(
			0u // You must supply the right type as it doesn't cast
			, vec2r( uniform(0,1.0,rnd), uniform(0,1.0,rnd) )
			, vec2r( uniform(0,1.0,rnd), uniform(0,1.0,rnd) )
			);
	}
}
