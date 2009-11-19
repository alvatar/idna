module cyma.controller.Ui;

package import core.JobHub;

package {
	import cyma.engine.Driver;
	import cyma.view.DrawActor;
}

interface Ui {

	enum Modes {
		Interactive
		, Console
	}

	/++
	 + Init function, common to all user interfaces. Must be overriden,
	 + even if no initialization is necessary
	 +/
	Ui init( Driver driver );
	//void initActors( DrawActor[] drawActors );

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

