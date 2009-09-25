module idna.cyma.controller.UiManager;

public import idna.cyma.controller.Ui;

private {
	import xf.core.JobHub;

	import idna.tools.Compat;

	import tango.core.Exception;

	import idna.cyma.controller.DummyUi;
	import idna.cyma.controller.HybridGui;
	import idna.cyma.controller.GlUi;
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
