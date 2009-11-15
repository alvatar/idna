module core.asyncmessagehub;

private {
	import util.container.linkedlist;
	import util.singleton;
}

public {
	import core.message;
	import core.messagehub;
	import core.messagehandler;
}

class TaggedMessage : Message {

	private {
		string _tag;
	}

	string tag() {
		return _tag;
	}

	string tag( string tag ) {
		return _tag = tag;
	}
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
class StringMessage : TaggedMessage {

	private {
		string _command;
		string[] _arguments;
	}

	string[] getMessageString() {
		debug checkValid();
		return _command ~ _arguments;
	}

	string command() {
		debug checkValid();
		return _command;
	}
	
	string[] arguments() {
		return _arguments;
	}

	void checkValid() {
		if( _command.length == 0 ) {
			throw new Exception("Requesting empty message", __FILE__, __LINE__);
		}
	}
}

/++
 + Class encapsulating message passing and management
 +/
class AsyncMessageHub : MessageHub {

	private {
		LinkedList!(Message) pendingMessages;
	}

	/+
	 + Leave a message but do not consume it immediately
	 +/
	void leaveMessage( Message msg ) {
		pendingMessages.append( msg );
	}

	/+
	 + Consume all maessages, using their handlers
	 +/
	void consumeAllMessages() {
		foreach( msg; pendingMessages ) {
			foreach( mh; messageHandlers ) {
				mh.handle( msg );
			}
		}
		deleteAllMessages();
	}

	/+
	 + Consume the messages passed as an array
	 +/
	void consumeMessages( Message[] messages ) {
		foreach( msg; messages ) {
			foreach( mh; messageHandlers ) {
				mh.handle( msg );
			}
			pendingMessages.remove( msg );
		}
	}

	/+
	 + Get all messages casted to a specific type, using different
	 + methods
	 +/
	template getAs(T) {
		/+
		 + Get messages with a tag 
		 +/
		T[] tagged( string tag ) {
			T[] result;
			TaggedMessage tmsg;
			foreach( msg; pendingMessages ) {
				if( (tmsg = cast(TaggedMessage)msg) !is null ) {
					if( tmsg.tag() == tag ) {
						debug if( cast(T)msg !is null ) {
							throw new Exception(
								"Error casting TaggedMessage to" ~ T.stringof
								, __FILE__, __LINE__
								);
						}
						result ~= cast(T)msg;
					}
				}
			}
			return result;
		}

		/+
		 + Get messages with a type, casted accordingly
		 +/
		 T[] fromType( string type ) {
			T[] result;
			TaggedMessage tmsg;
			foreach( msg; pendingMessages ) {
				if( (cast(Object)msg).classinfo.name == type ) {
					debug if( cast(T)msg !is null ) {
						throw new Exception(
							"Error casting TaggedMessage to" ~ T.stringof
							, __FILE__, __LINE__
							);
					}
					result ~= cast(T)msg;
				}
			}
			return result;
		 }

		/+
		 + Get messages with a type, casted accordingly
		 +/
		 T[] fromType(U)( void delegate(T msg) dg ) {
			T[] result;
			TaggedMessage tmsg;
			foreach( msg; pendingMessages ) {
				if( cast(U)msg ) {
					debug if( cast(T)msg !is null ) {
						throw new Exception(
							"Error casting TaggedMessage to" ~ T.stringof
							, __FILE__, __LINE__
							);
					}
					result ~= cast(T)msg;
				}
			}
			return result;
		 }

	}

	/+
	 + Execute a delegate with the selected messages casted to a type
	 +/
	template doWith(T) {
		/+
		 + Get messages with a tag 
		 +/
		void tagged( string tag, void delegate(T msg) dg ) {
			TaggedMessage tmsg;
			foreach( msg; pendingMessages ) {
				if( (tmsg = cast(TaggedMessage)msg) !is null ) {
					if( tmsg.tag() == tag ) {
						debug if( cast(T)tmsg !is null ) {
							throw new Exception(
								"Error casting TaggedMessage to" ~ T.stringof
								, __FILE__, __LINE__
								);
						}
						dg( cast(T)msg );
					}
				}
			}
		}

		/+
		 + Get messages with a type, casted accordingly
		 +/
		 T[] fromType(U)( void delegate(T msg) dg ) {
			T[] result;
			TaggedMessage tmsg;
			foreach( msg; pendingMessages ) {
				if( cast(U)msg ) {
					debug if( cast(T)msg !is null ) {
						throw new Exception(
							"Error casting TaggedMessage to" ~ T.stringof
							, __FILE__, __LINE__
							);
					}
					dg( cast(T)msg );
				}
			}
			return result;
		 }

		/+
		 + Get messages with a type, casted accordingly
		 +/
		 T[] fromType( string type ) {
			T[] result;
			TaggedMessage tmsg;
			foreach( msg; pendingMessages ) {
				if( (cast(Object)msg).classinfo.name == type ) {
					debug if( cast(T)msg !is null ) {
						throw new Exception(
							"Error casting TaggedMessage to" ~ T.stringof
							, __FILE__, __LINE__
							);
					}
					dg( cast(T)msg );
				}
			}
			return result;
		 }

	}

	/+
	 + Delete all messages
	 +/
	void deleteAllMessages() {
		pendingMessages.clear();
	}

	/+
	 + Delete the messages passed as an array
	 +/
	void deleteMessages( Message[] messages ) {
		foreach( msg; messages ) {
			pendingMessages.remove( msg );
		}
	}
}

alias Singleton!(AsyncMessageHub) asyncMessageHub;
