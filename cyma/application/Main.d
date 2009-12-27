module cyma.application.Main;

import std.stdio;

import core.JobHub;
import cyma.application.EnvironmentProbe;
import cyma.controller.GlUi;
import cyma.controller.Ui;
import cyma.view.Viewer;
import cyma.model.Model;
import cyma.engine.Driver;
import pattern.depinjection.default_builder;

int main( string[] args ) {

	builder.register!(Model);
	builder.register!(Driver);
	builder.bind!(Ui,GlUi);
	builder.register!(EnvironmentProbe);
	builder.register!(Viewer);

	auto model = builder.get!Model;
	auto driver = builder.get!Driver;
	auto ui = builder.get!Ui;
	auto environment = builder.get!EnvironmentProbe;
	auto viewer = builder.get!Viewer;

	driver.plug( model );
	ui.plug( driver, environment, viewer.output );

	jobHub.addPostFrameJob( {

		if( model.updates > 0 ) {
			ui.doUi( viewer.update(model) );
		}
		
		ui.doUi( viewer.draw );

		driver.process();
	} );

	jobHub.exec( ui.main );

    return 0;
}
