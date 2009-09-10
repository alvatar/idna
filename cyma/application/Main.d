module idna.cyma.application.Main;

import tango.io.Stdout;

import idna.tools.Compat;

import idna.cyma.controller.UiManager;
import idna.cyma.view.Drawer;
import idna.cyma.model.Model;
import idna.cyma.engine.Driver;

int main( string[] args )
{
	scope IUi ui = UiManager.create( "Dummy" );
	scope IDrawer drawer = new Drawer();
	scope IModel model = new Model();
	scope IDriver driver = new Driver();

	ui.processInput();
	ui.makeCommands( driver );
	driver.process( model );
	drawer.draw( model );

    Stdout.formatln ("{}... {}", "Cyma is", "alive");

    return 0;
}

