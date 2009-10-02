module idna.cyma.controller.DummyUi;

private {
	import idna.cyma.controller.Ui;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Class for issuing commands artificially and testing
 + drawer/canvas/model combinations
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
class DummyUi : Ui {
	
	void init () {
		//currentCommands
	}

	void doUi( Driver driver
			, DrawActor[] drawActors ) {
	}
	
	IJob getMainProcess() {
		return null;
	}
}
