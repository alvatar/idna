module core.messagehandler;

private {
	import core.message;
}


abstract class MessageTrap {
	abstract void trap(Message msg);
}


class MessageTrapT(T) : MessageTrap {
	final void trap(Message msg) {
		T m = cast(T)msg;
		assert (m !is null);
		m_handler(m);
	}


	this (void delegate(T) handler) {
		assert (handler !is null);
		m_handler = handler;
	}
	
	
	private {
		void delegate(T)	m_handler;
	}
}



class MessageHandler {
	void register(T)(void delegate(T) handler) {
		m_traps[T.classinfo.name] = new MessageTrapT!(T)(handler);
	}


	void handle(Message msg) {
		for (ClassInfo ci = msg.classinfo; ci !is null; ci = ci.base) {
			MessageTrap* t = ci.name in m_traps;
			if (t !is null) {
				(*t).trap(msg);
			}
		}
	}
	
	
	private {
		// NOTE: it could possibly be indexed by ClassInfo's
		MessageTrap[char[]]	m_traps;
	}
}
