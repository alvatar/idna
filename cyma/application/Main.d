module cyma.application.Main;

import std.stdio;

import core.JobHub;
import core.AsyncMessageHub;
import cyma.controller.UiManager;
import cyma.view.Drawer;
import cyma.model.Model;
import cyma.engine.Driver;

int main( string[] args ) {

	auto drawer = Drawer.create();
	auto driver = Driver.create();
	auto model = Model.create();
	auto ui = UiManager.create( "GlUi" );

	driver.init( model );
	ui.init( driver );

	drawer.plug( ui.output() );

	jobHub.addPostFrameJob( {

		if( model.updates > 0 ) {
			ui.doUi( drawer.update(model) );
		}
		
		ui.doUi( drawer.draw() );

		driver.process();
	} );

	jobHub.exec( ui.getMainProcess );

    return 0;
}
