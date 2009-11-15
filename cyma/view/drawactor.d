module cyma.view.drawactor;

private {
	import cyma.view.icanvas;
	import cyma.view.idrawactor;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Basic implementation of the DrawActor interface
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
class DrawActor : IDrawActor {

	alias void delegate() DrawFunction;

	private {
		string _name = "";

		ICanvas _canvas = null;

		bool _active = true;

		bool _update = true;

		DrawFunction _execute = null;

		void[] _environment = null;
	}

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

	DrawFunction execute() {
		return _execute;
	}

	DrawFunction execute( DrawFunction execute ) {
		return _execute = execute;
	}

	void[] environment() {
		return _environment;
	}

	void[] environment( void[] environment ) {
		return _environment = environment;
	}

	/++
	 + Initialize actor and linked canvas.
	 +/
	 void start( void[] env) {
		 this._environment = env;
		 _canvas.updateEnvironment();
		 _canvas.init();
	 }
}
