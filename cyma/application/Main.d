module idna.cyma.application.Main;

debug = stacktrace;
debug(stacktrace) import tango.core.stacktrace.TraceExceptions;

import xf.core.JobHub;

import idna.tools.Compat;
import idna.tools.AsyncMessageHub;
import idna.cyma.controller.UiManager;
import idna.cyma.view.Drawer;
import idna.cyma.model.Model;
import idna.cyma.engine.Driver;

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

	jobHub.exec( ui.getMainProcess );

    return 0;
}
