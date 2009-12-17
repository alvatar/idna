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
	 void start( void[] context ) {
		 this._context = context;
		 _canvas.updateContext();
		 _canvas.init();
	 }
}
