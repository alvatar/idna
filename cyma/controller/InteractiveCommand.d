module cyma.controller.InteractiveCommand;

private {
	import std.stdio;
}

protected {
	import cyma.controller.Ui;
	import cyma.engine.Command;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Abstract class for common functionality of the commands
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
abstract class InteractiveCommand(T...) : ContextualizedCommand!T {

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

		/++ Ui link +/
		Ui _ui;
	}

	this( Ui ui ) {
		_ui = ui;
	}

	/++ Execution sequence +/
	void interactiveSequence( ref Model );
}
