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

	protected {
		/++ Name of the command +/
		string _name;

		/++ Command's context, info for executing the operations +/
		CommandContext _context;
		//DefineContext!(T) _context;
	}

	/++ Execution entry point +/
	void execute( ref Model );

	/++ Revert (undo) the command +/
	void revert( ref Model );

	/++ Context setup +/
	Command context( CommandContext context );

	CommandContext context();

	/++ Command name set/get +/
	string name( string name ) {
		return _name = name;
	}

	string name() {
		return _name;
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
