module cyma.engine.commands.DummyCommand;

private {
	import io.Stdout;
	import cyma.engine.Command;
}

class DummyCommand(T...) : Command!(T) {

	void execute( Model model )
	{
		stdout("Dummy Command executed");
	}
}
