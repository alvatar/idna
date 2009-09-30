module idna.cyma.engine.commands.DummyCommand;

private {
	import idna.tools.Compat;
	import idna.cyma.engine.Command;
	//import idna.cyma.model.Model;
}

class DummyCommand : Command {

	void execute( Model model )
	{
		stdout("Dummy Command executed");
	}
}
