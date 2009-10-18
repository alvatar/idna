module cyma.controller.UiManager;

public import cyma.controller.Ui;

private {
	version( D_Version2 ) {
	} else {
		import tango.core.Exception;
	}

	import core.JobHub;
	import io.Stdout;
	import cyma.controller.DummyUi;
	import cyma.controller.HybridGui;
	import cyma.controller.GlUi;
}

class UiManager {
	static Ui create( string type ) {
		Ui ui;
		switch( type ) {
			case "Dummy":
				ui = new DummyUi();
			break;
			case "GlUi":
				ui = new GlUi();
			break;
			case "HybridGui":
				ui = new HybridGui();
			break;
			default:
				throw new Exception( "Ui type not defined" );
			break;
		}
		ui.init();
		return ui;
	}
}
