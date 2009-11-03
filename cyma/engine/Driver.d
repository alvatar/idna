module cyma.engine.Driver;

private{
	import cyma.engine.Command;
	import cyma.model.Model;
	import util.Singleton;
}

class Driver {

	private {
		ICommand[] commandQueue;
	}

	void init() {
	}

	void process( Model model ) {
		model.flatten;
		foreach_reverse( com; commandQueue ) {
			com.execute( model );
			commandQueue = commandQueue[0..$-1];
		}
	}

	debug void injectCommands( ICommand[] commands ) {
		commandQueue ~= commands;
	}
}

alias Singleton!(Driver) driver;

