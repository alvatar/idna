module core.messagehub;

private {
	import util.singleton;
	import core.message;
	import core.messagehandler;
}


class MessageHub {
	void registerMessageHandler(MessageHandler mh) {
		messageHandlers ~= mh;
	}
	
	
	void sendMessage(Message msg) {
		foreach (MessageHandler mh; messageHandlers) {
			mh.handle(msg);
		}
	}
	
	
	protected {
		MessageHandler[]	messageHandlers;
	}
}


alias Singleton!(MessageHub) messageHub;
