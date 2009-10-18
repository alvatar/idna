module input.InputHub;


private {
	import io.Stdout;
	import util.Singleton;
	import core.JobHub;
	import input.Input;
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
