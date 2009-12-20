module cyma.engine.Command;

private {
	import std.stdio;
}

protected {
	import cyma.model.Model;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Interface for executable commands
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
abstract class Command {

	/++ Execution entry point +/
	void execute( ref Model );

	/++ Revert (undo) the command +/
	void revert( ref Model );

	/++ A function to retrieve name must be implemented +/
	string name() {
		return typeof(this).toString;
	}
}

abstract class ContextualizedCommand(T...) : Command {

	alias DefineContext!T ContextType;

	protected {
		/++ Command's context, info for executing the operations +/
		ContextType _context;
	}

	@property
	typeof(this) context( CommandContext context ) {
		debug if( (_context = cast(DefineContext!T)context) is null )
			throw new Exception("Incorrect context supplied to Command");
		return this;
	}

	@property
	ContextType context() {
		return _context;
	}

	typeof(this) makeContext(T...)(T args) {
		debug if( (_context = cast(DefineContext!T)MakeContext(args)) is null )
			throw new Exception("Incorrect context supplied to Command");
		return this;
	}
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Context of execution. Used for injecting arbitrary data needed
 + for execution
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
interface CommandContext {
}

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
