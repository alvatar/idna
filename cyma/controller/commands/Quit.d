module cyma.controller.commands.Quit;

private {
	import core.MessageHub;

	import cyma.application.messages;
	import cyma.controller.InteractiveCommand;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Create a single line
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
class Quit : InteractiveCommand!() {

	this( EnvironmentProbe environment, OutputActor output ) {
		super(environment,output);
	}

	override bool execute( ref Model model ) {
		messageHub.sendMessage(new QuitMessage);
		return true;
	}

	override void revert( ref Model ) {
		assert(false, "You shouldn't be calling revert in a Quit command");
	}

	override void interactiveSequence( ref Model model ) {
	}
}
