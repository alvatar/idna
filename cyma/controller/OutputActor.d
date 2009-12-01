module cyma.controller.OutputActor;

private {
	import util.dynamicdispatch;
	import cyma.controller.ICanvas;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Define the interface of a DrawActor, allowing to move draw environments
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

	void start( void[] env);

	mixin MakeDynamicDispatch!(typeof(this));

	protected {
		ICanvas _canvas = null;

		void[] _environment = null;
	}

	string name() {
		return _name;
	}

	int testf(int a) {
		return 0;
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

	void[] environment() {
		return _environment;
	}

	void[] environment( void[] environment ) {
		return _environment = environment;
	}
}
