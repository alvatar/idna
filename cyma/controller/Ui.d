module cyma.controller.Ui;

package import core.JobHub;

package {
	import cyma.engine.Driver;
	import cyma.application.EnvironmentProbe;
	import cyma.controller.OutputActor;
}

interface Ui {

	/++
	 + Gives access to the environment where this Ui is
	 +/
	@property EnvironmentProbe environment();

	/++
	 + Allows for output through the ui
	 + Note: work-around to avoid need of calling output's dynamic functions
	 + with an extra parenthesis pair
	 +/
	@property OutputActor output();

	/++
	 + Init function, common to all user interfaces. Must be overriden,
	 + even if no initialization is necessary
	 +/
	void init();

	/++ Links all the necessary elements to give the Ui control over the
	 + application +/
	Ui plug( Driver idriver, EnvironmentProbe ienvironment, OutputActor ioutput );

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

abstract class BaseUi : Ui {

	protected {
		Driver _driver;
		EnvironmentProbe _environment;
		OutputActor _output;
	}

	/++ The environment is controlled by the main user interface and passed to
	 + all commands +/
	@property
	EnvironmentProbe environment() {
		debug if(_output is null)
			throw new Exception("EnvironmentProbe is null");
		return _environment;
	}

	/++
	 + The OutputActor previously plugged
	 + OutputActor for the specific Ui implementation +/
	@property
	OutputActor output() {
		debug if(_output is null)
			throw new Exception("OutputActor is null");
		return _output;
	}

	/++ Impl. +/
	Ui plug( Driver idriver, EnvironmentProbe ienvironment, OutputActor ioutput ) {
		_driver = idriver;
		_environment = ienvironment;
		_output = ioutput;
		init();
		return this;
	}
}
