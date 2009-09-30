module idna.cyma.engine.Driver;

private{
	import xf.utils.Singleton;

	import idna.cyma.engine.Command;
	import idna.cyma.model.Model;
}

class Driver {

	void init() {
	}

	void process( Model model ) {
	}
}

alias Singleton!(Driver) driver;

debug void injectCommands( Model model, Command[] commands ) {
	foreach( com; commands ) {
		com.execute( model );
	}
}
