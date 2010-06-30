/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Copyright (c) 2010 by Álvaro Castro-Castilla, All Rights Reserved.
 + Licensed under the MIT/X11 license, see LICENSE file for full description
 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/

module cyma.controller.OutputActor;

protected {
	import cyma.controller.graphical.ICanvas;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Define the interface of a DrawActor, allowing to move draw contexts
 + around avoiding cyclic dependencies
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
class OutputActor {

	alias void delegate() DrawFunction;

	protected {
		string _name;

		bool _active = true;

		ICanvas _canvas = null;

		void[] _context = null;

		DrawFunction _preprocess = null;

		DrawFunction _show = null;
	}

	@property {
		string name() {
			return _name;
		}

		string name(string name) {
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

		void[] context() {
			return _context;
		}

		void[] context( void[] context ) {
			return _context = context;
		}
	}

	void preprocess() {
		if(_preprocess !is null
			&& _active )
			_preprocess();
	}

	DrawFunction preprocess( DrawFunction preprocess ) {
		return _preprocess = preprocess;
	}

	void show() {
		if(_show !is null
			&& _active )
			_show();
	}

	DrawFunction show( DrawFunction show ) {
		return _show = show;
	}

	void start( void[] context ) {
		this._context = context;
		_canvas.updateContext();
		_canvas.init();
	}
}
