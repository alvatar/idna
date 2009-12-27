module cyma.controller.InteractiveCommand;

private {
	import std.stdio;
}

protected {
	import cyma.application.EnvironmentProbe;
	import cyma.controller.OutputActor;
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

		/++ EnvironmentProbe +/
		EnvironmentProbe _environment;

		/++ OutputActor +/
		OutputActor _output;
	}

	this( EnvironmentProbe environment, OutputActor output ) {
		_environment = environment;
		_output = output;
	}

	@property
	EnvironmentProbe environment() {
		return _environment;
	}

	@property
	OutputActor output() {
		return _output;
	}

	/++ Execution sequence +/
	void interactiveSequence( ref Model );
}
