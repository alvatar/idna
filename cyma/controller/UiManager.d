module cyma.controller.UiManager;

public import cyma.controller.Ui;

private {
	import core.JobHub;
	import cyma.controller.GlUi;
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
