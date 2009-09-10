module idna.cyma.controller.UiManager;

public import idna.cyma.controller.Ui;

private {
	import idna.tools.Compat;

	import idna.cyma.controller.DummyUi;
	import idna.cyma.controller.HybridGui;
}

class UiManager {
	static IUi create( string type ) {
		switch( type ) {
			case "Dummy":
				return new DummyUi();
			case "HybridGui":
				return new HybridGui();
		}
	}
}
