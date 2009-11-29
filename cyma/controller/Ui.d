module cyma.controller.Ui;

package import core.JobHub;

package {
	import cyma.engine.Driver;
	import cyma.controller.EnvironmentProbe;
	import cyma.controller.OutputActor;
}

abstract class Ui {

	protected {
		/++ The driver that this Ui will use +/
		Driver _driver;

		/++ Environment probe, for retrieving environment data +/
		EnvironmentProbe _environmentProbe;

		/++ Immediate output is done through an OutputActor +/
		OutputActor _output;
	}

	/++
	 + Gives access to the environment where this Ui is
	 +/
	EnvironmentProbe environment() {
		return _environmentProbe;
	}

	/++
	 + Allows for output through the ui
	 + Note: work-around to avoid need of calling output's dynamic functions
	 + with an extra parenthesis pair
	 +/
	 /*
	template output(T...) {
		void output(T t) {
			return _output(t);
		}
	}
	template output() {
		OutputActor output() {
			return _output;
		}
	}
	*/
	OutputActor output() {
		return _output;
	}

	/++
	 + Plugs an OutProbe to the Ui for allowing visual output to the Ui
	 +/
	void outplug( OutputActor actor );

	/++
	 + Init function, common to all user interfaces. Must be overriden,
	 + even if no initialization is necessary
	 +/
	Ui init( Driver driver );

	/++
	 + Defines all actions to be taken in order to collect and process the
	 + input from the system. This is also in charge of changing any state
	 + inside the Ui itself. Defines the process of building commands
	 + through a IDriver
	 +/
	void doUi( OutputActor[] outpuActors );

	/++
	 + Get the process that executes the user interface
	 +/
	 IJob main();
	 
}
