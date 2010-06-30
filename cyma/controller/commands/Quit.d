/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Copyright (c) 2010 by Álvaro Castro-Castilla, All Rights Reserved.
 + Licensed under the MIT/X11 license, see LICENSE file for full description
 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/

module cyma.controller.commands.Quit;

private {
	import core.MessageHub;

	import cyma.application.messages;
	import cyma.controller.Command;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Create a single line
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
class Quit : ContextualizedCommand!() {

	mixin MakeCommandConstructor;

	override bool execute( ref Model model ) {
		messageHub.sendMessage(new QuitMessage);
		return true;
	}

	override void revert( ref Model ) {
		assert(false, "You shouldn't be calling revert in a Quit command");
	}
}
