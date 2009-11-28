module cyma.application.Main;

import std.stdio;

import core.JobHub;
import core.AsyncMessageHub;
import cyma.controller.UiManager;
import cyma.view.ViewManager;
import cyma.model.Model;
import cyma.engine.Driver;

int main( string[] args ) {

	auto model = Model.create();
	auto driver = Driver.create();
	auto ui = UiManager.create( "GlUi" );
	auto viewers = ViewManager.create();

	driver.init( model );
	ui.init( driver );

	ui.outplug( viewers.immediate );

	jobHub.addPostFrameJob( {

		if( model.updates > 0 ) {
			ui.doUi( viewers.update(model) );
		}
		
		ui.doUi( viewers.draw );

		driver.process();
	} );

	jobHub.exec( ui.main );

    return 0;
}
