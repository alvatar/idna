module cyma.controller.Ui;

package import core.JobHub;

package {
	import cyma.engine.Driver;
	import cyma.controller.EnvironmentProbe;
	import cyma.controller.OutProbe;
	import cyma.view.DrawActor;
}

abstract class Ui {

	protected {
		/++ The driver that this Ui will use +/
		Driver _driver;

		/++ Environment probe, for retrieving environment data +/
		EnvironmentProbe _environmentProbe;

		/++ OutProbe, for graphical, text, or any kind of output +/
		OutProbe _outProbe;
	}

	/++
	 + Gives access to the environment where this Ui is
	 +/
	ref EnvironmentProbe environment() {
		return _environmentProbe;
	}

	/++
	 + Allows for output through the ui
	 +/
	ref OutProbe output() {
		return _outProbe;
	}

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
	void doUi( DrawActor[] drawActor );

	/++
	 + Get the process that executes the user interface
	 +/
	 IJob getMainProcess();
	 
}
