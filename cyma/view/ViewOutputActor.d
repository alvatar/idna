module cyma.view.ViewOutputActor;

private {
	import cyma.controller.ICanvas;
}

package {
	import cyma.controller.OutputActor;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Basic implementation of the DrawActor interface
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
class ViewOutputActor : OutputActor {

	/++
	 + Initialize actor and linked canvas.
	 +/
	 void start( void[] env) {
		 this._environment = env;
		 _canvas.updateEnvironment();
		 _canvas.init();
	 }
}
