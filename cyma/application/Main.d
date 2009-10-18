module cyma.application.Main;

debug = stacktrace;
//debug(stacktrace) import tango.core.stacktrace.TraceExceptions;

import core.JobHub;

import io.Stdout;
import core.AsyncMessageHub;
import cyma.controller.UiManager;
import cyma.view.Drawer;
import cyma.model.Model;
import cyma.engine.Driver;

int main( string[] args ) {

	drawer.init();
	driver.init();
	Ui ui = UiManager.create( "GlUi" );
	Model model = Model.create();

	jobHub.addPostFrameJob( {
		ui.doUi( driver, drawer.yield( model ) );
	} );
	jobHub.addPostFrameJob( {
		driver.process( model );
	} );

	jobHub.exec( ui.getMainProcess );

    return 0;
}
