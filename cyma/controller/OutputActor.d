module cyma.controller.OutputActor;

private {
	import cyma.controller.ICanvas;
	import util.dynamic_class;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Define the interface of a DrawActor, allowing to move draw contexts
 + around avoiding cyclic dependencies
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
abstract class OutputActor {

	alias void delegate() DrawFunction;

	private {
		string _name = "";

		bool _active = true;

		bool _update = true;

		DrawFunction _preprocess = null;

		DrawFunction _show = null;
	}

	void start( void[] env );

	mixin MakeClassDynamic;

	protected {
		ICanvas _canvas = null;

		void[] _context = null;
	}

	@property {
		string name() {
			return _name;
		}

		string name( string name) {
			return _name = name;
		}

		ICanvas canvas() {
			return _canvas;
		}

		ICanvas canvas( ICanvas canvas ) {
			return _canvas = canvas;
		}

		bool active() {
			return _active;
		}

		bool active( bool active ) {
			return _active = active;
		}

		bool update() {
			return _update;
		}

		bool update( bool update ) {
			return _update = update;
		}

		void[] context() {
			return _context;
		}

		void[] context( void[] context ) {
			return _context = context;
		}
	}

	DrawFunction preprocess() {
		return _preprocess;
	}

	DrawFunction preprocess( DrawFunction preprocess ) {
		return _preprocess = preprocess;
	}

	DrawFunction show() {
		return _show;
	}

	DrawFunction show( DrawFunction show ) {
		return _show = show;
	}
}
