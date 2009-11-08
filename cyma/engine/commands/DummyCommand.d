module cyma.engine.commands.DummyCommand;

private {
	import std.stdio;

	import cyma.engine.Command;
}

class DummyCommand(T...) : Command!(T) {

	void execute( Model model )
	{
		writeln("Dummy Command executed");
	}
}
