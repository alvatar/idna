module idna.cyma.engine.Command;

private {
	import idna.tools.Compat;
}

package {
	import idna.cyma.model.Model;
	import idna.cyma.model.Node;
}

interface ICommand {
	void execute( Model );
}

/++
+ Context of execution. Used for injecting arbitrary data needed
+ for execution
+/
class CommandContext {

	private {
		string _contextInfo;
	}

	this( string contextInfo )
	{
		_contextInfo = contextInfo;
	}
}

/++
 + Abstract class for common functionality of the commands
 +/
abstract class Command : ICommand {

	enum State {
		Created
		, Initialized
		, Executed
		, OnHold
	}

	/++ Holds current state +/
	State _currentState;

	/++ Holds previous state +/
	State _previousState;

	/++ Name of the command +/
	string _name;

	string name( string name ) {
		return _name = name;
	}

	string name() {
		return _name;
	}

	CommandContext _context;

	Command context( CommandContext context ) {
		_context = context;
		return this;
	}

	CommandContext context() {
		return _context;
	}
}

