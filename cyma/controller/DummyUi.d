module cyma.controller.DummyUi;

private {
	import cyma.controller.Ui;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Class for issuing commands artificially and testing
 + drawer/canvas/model combinations
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
class DummyUi : Ui {

	Ui init( Driver driver ) {
		return this;
	}

	void doUi( DrawActor[] drawActors ) {
	}
	
	IJob getMainProcess() {
		return null;
	}
}
