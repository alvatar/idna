module idna.cyma.controller.Ui;

package import xf.core.JobHub;

package {
	import idna.tools.Compat;
	import idna.cyma.view.Drawer;
	import idna.cyma.engine.Driver;
}

interface Ui {
	/++
	 + Init function, common to all user interfaces. Must be overriden,
	 + even if no initialization is necessary
	 +/
	void init();

	/++
	 + Defines all actions to be taken in order to collect and process the
	 + input from the system. This is also in charge of changing any state
	 + inside the Ui itself. Defines the process of building commands
	 + through a IDriver
	 +/
	void doUi( Driver driver
			, DrawFunctionInfo[] drawFunctions );

	/++
	 + Get the process that executes the user interface
	 +/
	 IJob getMainProcess();
	 
}

