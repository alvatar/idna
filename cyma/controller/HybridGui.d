module cyma.controller.HybridGui;

private {
	import cyma.controller.Ui;
}

class HybridGui : Ui {

	Ui init( Driver driver ) {
		return this;
	}

	void doUi( DrawActor[] drawActors ) {
	}

	IJob getMainProcess() {
		return null;
	}
}
