module idna.cyma.controller.DummyUi;

private {
	import idna.cyma.controller.Ui;
	import idna.cyma.engine.Driver;
}

/+
 + Class for issuing commands artificially
 +/
class DummyUi : IUi {
	
	this() {
		//currentCommands
	}

	void processInput() {
	}

	void makeCommands( IDriver driver ) {
	}
}
