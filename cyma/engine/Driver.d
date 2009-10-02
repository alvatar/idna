module idna.cyma.engine.Driver;

private{
	import xf.utils.Singleton;

	import idna.tools.Compat;

	import idna.cyma.engine.Command;
	import idna.cyma.model.Model;
}

class Driver {

	private {
		Command[] commandQueue;
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

	debug void injectCommands( Command[] commands ) {
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
