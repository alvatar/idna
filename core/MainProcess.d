/**
	Why bother driving the timer through the input subsystem ? The concept is that time should be an input.
	Generally everything that can vary between subsequent engine executions has to be an input.
	Why ?
	That gives a possibility to perfectly reproduce any execution process / create replays / etc
*/

module core.MainProcess;

private {
	debug import std.stdio;

	import io.input.input;
	import io.input.InputHub;
	import core.MessageHandler;
	import core.MessageHub;
	import core.JobHub;
	import sys.HardwareTimer;

	import cyma.application.messages;
	//import utils.Profiler : profile;
}

private class TimeReader : InputReader {

	this() {
		registerReader!(TimeInput)(&this.tick);
	}

	void tick(TimeInput* i) {
		jobHub.update(cast(double)i.micros * 0.000001);
	}
}


class MainProcess : Process {

	void exec() {
		HardwareTimer timer;

		void delegate() tick;
		{
			timer = new HardwareTimer;
			
			tick = () {
				TimeInput ti;
				ti.micros = timer.timeDeltaMicros();
				inputHub.timeChannel << ti;
			};
			
			// init the timer
			timer.timeDeltaMicros();
		}
		
		{
			MessageHandler handler = new MessageHandler;
			handler.register!(QuitMessage)(&this.handleQuitMsg);
			messageHub.registerMessageHandler(handler);
		}
		
		//timeHub();		// init the time hub.
		inputHub.timeChannel.addReader(new TimeReader);
		
		while (!stopped) {
			tick();
			inputHub.dispatchAll();
			/*
			profile!(`jobHub`)({
				tick();
				inputHub.dispatchAll();
			});
			*/
		}
		
	}
	
	void handleQuitMsg(QuitMessage msg)	{
		debug writeln( typeof(this).stringof ~ " -> Message received: Quit" );
		stop();
	}
}
