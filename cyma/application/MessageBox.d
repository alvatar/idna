module idna.cyma.application.MessageBox;

private {
	import xf.core.Message;
	import xf.core.MessageHub;
	import xf.core.MessageHandler;
	import xf.utils.Singleton;

	import idna.tools.Compat;
}


/++
 + Message class encapsulates message command and arguments
 + Examples:
 + ----------------------------------------------------------------------------
 + MessageHandler handler = new MessageHandler;
 + handler.register!(StringMessage)(&this.handleStringMsg); // member function
 + messageHub.registerMessageHandler(handler);
 + ----------------------------------------------------------------------------
 +/
class StringMessage {
	private string[] tokens;

	string[] getMessageString() {
		debug checkValid();
		return tokens;
	}
	
	string getCommand() {
		debug checkValid();
		return tokens[0];
	}
	
	bool hasArguments() {
		debug checkValid();
		return( tokens.length > 1 );
	}

	string[] getArguments() {
		if( !hasArguments() ) {
			return ( [""] );
		} else {
			return tokens[1 .. $];
		}
	}

	void checkValid() {
		if( tokens.length == 0 ) {
			throw new Exception("Requesting empty message");
		}
	}
}

/++
 + Class encapsulating message passing and management
 +/
class AsyncMessageHub : MessageHub {

	private {
		Message[] droppedMessages;
	}

	void dropMessage( Message msg )	{
		droppedMessages ~= msg;
	}

	Message[] consumeMessagesFor( string destination ) {
		return null;
	}

	bool handleMessagesFor( string destination, MessageHandler msgHandler ) {
		return false;
	}
	/*
	private {
		Message[][string] messages;
	}

	bool hasMessages( string destination ) {
		return cast(bool)messages[destination].length;
	}

	Message[] getMessagesFor( string destination ) {
		return messages[destination];
	}

	void sendMessageTo( string destination, Message message ) {
		messages[destination] ~= message;
	}

	void deleteMessagesFor( string destination ) {
		messages[destination].length = 0;
	}

	void doForEachMessageCommand( string destination, string command, void delegate() dg ) {
		auto msgs = getMessagesFor(destination);
		void execute() {
			if( msgs[0].getCommand() == command ) {
				dg();
			}
		}
		while( msgs.length > 1 ) {
			execute();
			msgs = msgs[1 .. $];
		}
		execute();
		msgs.length = 0;
	}

	void doMessageCommandOnce( string destination, string command, void delegate() dg ) {
		bool found = false;
		foreach( msgs; getMessagesFor(destination) ) {
			if( msgs.getCommand() == command ) {
				found = true;
				break;
			}
		}
		if( found ) dg();
	}
	*/

}

alias Singleton!(AsyncMessageHub) asyncMessageHub;
