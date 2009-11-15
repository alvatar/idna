module cyma.controller.uimanager;

public import cyma.controller.ui;

private {
	version( D_Version2 ) {
	} else {
		import tango.core.Exception;
	}

	import core.jobhub;
	import cyma.controller.glui;
	import cyma.engine.driver;
}

class UiManager {
	static Ui create( string type ) {
		Ui ui;
		switch( type ) {
			case "GlUi":
				ui = new GlUi();
			break;
			default:
				throw new Exception( "Ui type not defined" );
			break;
		}
		return ui;
	}
}
