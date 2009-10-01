module idna.cyma.view.DrawActor;

private {
	import idna.tools.Compat;
	import idna.cyma.view.ICanvas;
	import idna.cyma.view.IDrawActor;
}


class DrawActor : IDrawActor {

	private {
		string _name = "";

		ICanvas _canvas = null;

		bool _active = true;

		bool _update = true;

		void delegate() _execute = null;

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

	void delegate() execute() {
		return _execute;
	}

	void delegate() execute( void delegate() execute ) {
		return _execute = execute;
	}

	void[] environment() {
		return _environment;
	}

	void[] environment( void[] environment ) {
		return _environment = environment;
	}
}
