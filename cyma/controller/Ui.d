module idna.cyma.controller.Ui;

private {
	import idna.tools.Compat;

	import idna.cyma.engine.Driver;
}

interface IUi {
	/++
	 + Defines all actions to be taken in order to collect and process the
	 + input from the system. This is also in charge of changing any state
	 + inside the Ui itself
	 +/
	void processInput();

	/+
	 + Defines the process of building commands from input
	 +/
	void makeCommands( IDriver );
}

