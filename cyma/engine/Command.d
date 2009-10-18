module cyma.engine.Command;

private {
	import io.Stdout;
}

protected {
	import cyma.model.Model;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Interface for executable commands
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
interface ICommand {
	void execute( Model );
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Context of execution. Used for injecting arbitrary data needed
 + for execution
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
abstract class CommandContext {
}

private {

	class StringCommandContext : CommandContext {
		private {
			string _contextInfo;
		}

		this( string contextInfo ) {
			_contextInfo = contextInfo;
		}
	}

	class ArgsCommandContext(T...) : CommandContext {
		T arguments;
	}

	template DefineContext(T...) {
		static if( T.length == 1 && is(typeof(U[0] == string)) ) {
			alias StringCommandContext DefineContext;
		} else {
			alias ArgsCommandContext!(T) DefineContext;
		}
	}
}

template MakeContext(T...) {
	DefineContext!(T) MakeContext(T t) {
		DefineContext!(T) context = new DefineContext!(T);
		foreach( i, arg; t ) {
			context.arguments[i] = arg;
		}
		return context;
	}
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Abstract class for common functionality of the commands
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
abstract class Command(T...) : ICommand {

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

	DefineContext!(T) _context;

	Command context( DefineContext!(T) context ) {
		_context = context;
		return this;
	}

	CommandContext context() {
		return _context;
	}
}

