module idna.cyma.application.Main;

debug = trace;
debug(trace) import tango.core.stacktrace.TraceExceptions;

import xf.core.JobHub;

import idna.tools.Compat;
import idna.tools.AsyncMessageHub;
import idna.cyma.controller.UiManager;
import idna.cyma.view.Drawer;
import idna.cyma.model.Model;
import idna.cyma.engine.Driver;
import idna.cyma.engine.commands.All;

int main( string[] args ) {

	drawer.init();
	driver.init();
	scope Ui ui = UiManager.create( "GlUi" );
	scope Model model = Model.create();

	jobHub.addPostFrameJob( {
		ui.doUi( driver, drawer.yield( model ) );
	} );
	jobHub.addPostFrameJob( {
		driver.process( model );
	} );

	Command com1 = new AddLine();
	debug injectCommands( model,
			[ com1.context( new CommandContext("12, 200") )
			, com1
			, com1 ] );

	jobHub.exec( ui.getMainProcess );

    return 0;
}
