module cyma.engine.Driver;

private{
	import util.Singleton;
	import io.Stdout;
	import cyma.engine.Command;
	import cyma.model.Model;
}

class Driver {

	private {
		ICommand[] commandQueue;
	}

	void init() {
	}

	void process( Model model ) {
		foreach_reverse( com; commandQueue ) {
			com.execute( model );
			commandQueue = commandQueue[0..$-1];
			//debug(verbose) stdout("lenght: {}", commandQueue.length);
		}
	}

	debug void injectCommands( ICommand[] commands ) {
		commandQueue ~= commands;
	}
}

alias Singleton!(Driver) driver;

/*
debug void injectCommands( Model model, Command[] commands ) {
	foreach( com; commands ) {
		com.execute( model );
	}
}
*/
