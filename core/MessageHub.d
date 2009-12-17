module core.MessageHub;

private {
	import pattern.singleton;
	import core.Message;
	import core.MessageHandler;
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
