/**
	Why bother driving the timer through the input subsystem ? The concept is that time should be an input.
	Generally everything that can vary between subsequent engine executions has to be an input.
	Why ?
	That gives a possibility to perfectly reproduce any execution process / create replays / etc
*/

module core.MainProcess;


private {
	import io.Stdout;
	import io.input.Input;
	import io.input.InputHub;
	import core.Message;
	import core.MessageHandler;
	import core.MessageHub;
	import core.JobHub;
	import sys.HardwareTimer;
	//import utils.Profiler : profile;
}

private class TimeReader : InputReader {
	void tick(TimeInput* i) {
		jobHub.update(cast(double)i.micros * 0.000001);
	}
	
	
	this() {
		registerReader!(TimeInput)(&this.tick);
	}
}


class MainProcess : Process {

	void exec() {
		HardwareTimer timer;

		void delegate() tick; {
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
				//stdout("TICK");
			inputHub.dispatchAll();
				//stdout("DISPATCHED");
			/*
			profile!(`jobHub`)({
				tick();
				inputHub.dispatchAll();
			});
			*/
		}
		
	}
	
	
	void handleQuitMsg(QuitMessage msg)	{
		stop();
	}
}
