module cyma.application.Main;

import std.stdio;

import core.JobHub;
import core.AsyncMessageHub;
import cyma.controller.UiManager;
import cyma.view.Drawer;
import cyma.model.Model;
import cyma.engine.Driver;

int main( string[] args ) {

	drawer.init();
	driver.init();
	auto ui = UiManager.create( "GlUi" );
	ui.init(driver);

	auto model = Model.create();

	jobHub.addPostFrameJob( {

		if( model.updates > 0 ) {
			ui.doUi( drawer.update(model) );
		}
		
		ui.doUi( drawer.draw() );

		driver.process( model );
	} );

	jobHub.exec( ui.getMainProcess );

    return 0;
}
