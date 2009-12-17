module io.input.InputHub;

private {
	import pattern.singleton;
	//import core.JobHub;
	import io.input.input;
}

class InputHub {

	this() {
		timeChannel = new InputChannel;
		mainChannel = new InputChannel;
		//jobHub.addRepeatableJob(&update, 100);
	}
	
	void dispatchAll() {
		timeChannel.dispatchAll();
		mainChannel.dispatchAll();
	}
	
	/+void update() {
		channel.dispatchAll();
		channel.update();
	}+/
	
	InputChannel timeChannel;
	InputChannel mainChannel;
}


alias Singleton!(InputHub) inputHub;
