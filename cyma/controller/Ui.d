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
	 + Plugs an OutProbe to the Ui for allowing visual output to the Ui
	 +/
	//void outplug( OutputActor outputActor );

	/++
	 + Init function, common to all user interfaces. Must be overriden,
	 + even if no initialization is necessary
	 +/
	void init();
	Ui plug( Driver driver, EnvironmentProbe probe, OutputActor output );

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
		/++ The driver that this Ui will use +/
		Driver _driver;

		/++ Environment probe, for retrieving environment data +/
		EnvironmentProbe _environment;

		/++ Immediate output is done through an OutputActor +/
		OutputActor _output;
	}

	@property EnvironmentProbe environment() {
		return _environment;
	}

	@property OutputActor output() {
		return _output;
	}
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

	Ui plug( Driver driver, EnvironmentProbe environment, OutputActor output ) {
		/*
		if( _output is null ) {
			_output = output;
		} else {
			_output.__setDynamicMethods( output.__getDynamicMethods );
		}
		*/
		_driver = driver;
		_environment = environment;
		_output = output;
		init();
		return this;
	}
	/*
	void outplug( OutputActor outputActor ) {
		if( _output is null ) {
			_output = outputActor;
		} else {
			_output.__setDynamicMethods( outputActor.__getDynamicMethods );
		}
	}
	*/
}
