module cyma.application.main;

import std.stdio;

import core.jobhub;
import core.asyncmessagehub;
import cyma.controller.uimanager;
import cyma.view.drawer;
import cyma.model.model;
import cyma.engine.driver;

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
