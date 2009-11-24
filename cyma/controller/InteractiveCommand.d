module cyma.controller.InteractiveCommand;

private {
	import std.stdio;
}

protected {
	import cyma.engine.Command;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Abstract class for common functionality of the commands
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
abstract class InteractiveCommand(T...) : Command {

	enum State {
		Created
		, Initialized
		, Executed
		, OnHold
	}

	protected {
		/++ Holds current state +/
		State _currentState;

		/++ Holds previous state +/
		State _previousState;
	}

	/++ Execution sequence +/
	void interactiveSequence( ref Model );

	InteractiveCommand context( CommandContext context ) {
		debug if( (_context = cast(DefineContext!(T))context) is null )
			throw new Exception("Incorrect context supplied to Command");
		return this;
	}

	DefineContext!(T) context() {
		return _context;
	}
}
