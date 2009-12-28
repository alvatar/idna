module cyma.application.messages;

private {
	import core.Message;
}

class QuitMessage : Message {}

class CommandFinishedMessage : Message {}

class CommandStartedMessage : Message {}
