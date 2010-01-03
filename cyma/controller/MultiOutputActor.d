module cyma.controller.MultiOutputActor;

private {
	import cyma.controller.OutputActor;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + This type of OutputActor holds other instances of OutputActors and makes
 + them act synchronically upon some output request from a Command
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
class MultiOutputActor : OutputActor {

	private OutputActor[] _actors;

	/++
	 + Add actor to the multiple actor mediator
	 +/
	void addActor(OutputActor actor) {
		_actors ~= actor;
	}

	/++
	 + Overridden functions for propagating among children
	 +/
	override {
		// Common will be the context, although the canvas doesn't have to
		@property
		void[] context( void[] context ) {
			foreach(ref a;_actors)
				a.context = context;
			return _context = context;
		}

		// Preprocess, show and start functions are not used normally, as the
		// corresponding code is managed by Ui that take raw arrays of
		// OutputActors
		void preprocess() {
			foreach(ref a;_actors)
				a.preprocess();
		}

		DrawFunction preprocess( DrawFunction preprocess ) {
			assert(0
				,"Assigning a single DrawFunction to a MultiOutputActor is disallowed");
		}

		void show() {
			foreach(ref a;_actors)
				a.show();
		}

		DrawFunction show( DrawFunction show ) {
			assert(0
				,"Assigning a single DrawFunction to a MultiOutputActor is disallowed");
		}

		void start( void[] context ) {
			foreach(ref a;_actors) {
				a.context = context;
				a.canvas.updateContext();
				a.canvas.init();
			}
			this._context = context;
			_canvas.updateContext();
			_canvas.init();
		}
	}
}
