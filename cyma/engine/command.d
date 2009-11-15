module cyma.engine.command;

private {
	import std.stdio;
}

protected {
	import cyma.model.model;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Interface for executable commands
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
interface ICommand {
	/++ Context setup ++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
	ICommand context( CommandContext context );
	CommandContext context();

	/++ Execution entry point ++++++++++++++++++++++++++++++++++++++++++++++++/
	void execute( ref Model );

	/++ Revert (undo) the command ++++++++++++++++++++++++++++++++++++++++++++/
	void revert( ref Model );

	/++ Execution sequence +++++++++++++++++++++++++++++++++++++++++++++++++++/
	void interactiveSequence( ref Model );
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Context of execution. Used for injecting arbitrary data needed
 + for execution
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
abstract class CommandContext {}

private {
	class StringCommandContext : CommandContext {
		public string arguments;
	}

	class ArgsCommandContext(T...) : CommandContext {
		public T arguments;
	}

	template DefineContext(T...) {
		static if( T.length == 1 && is(typeof(T[0] == string)) ) {
			alias StringCommandContext DefineContext;
		} else {
			alias ArgsCommandContext!(T) DefineContext;
		}
	}
}

template MakeContext(T...) {
	DefineContext!(T) MakeContext(T t) {
		DefineContext!(T) context = new DefineContext!(T);
		context.tupleof = t;
			/* TODO: Review
		static if( is(typeof(context == StringCommandContext)) ) {
			pragma( msg, "String" ~ context);
			context.arguments[0] = t;
		} else {
			pragma( msg, context);
			context.arguments = t;
		}
		*/
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

	Command context( CommandContext context ) {
		_context = cast(DefineContext!(T))context;
		debug if( _context is null )
			throw new Exception("Incorrect context supplied to Command");
		return this;
	}

	DefineContext!(T) context() {
		return _context;
	}
}

