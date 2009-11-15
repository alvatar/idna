module cyma.controller.glui;

private {
	import std.stdio;

	import core.jobhub;
	import core.messagehub;
	import core.message;
	import core.mainprocess;
	import core.asyncmessagehub;
	import cyma.controller.ui;
	import cyma.engine.commands.all;
	import cyma.view.drawactor;
	import dgl.dgl;
	import io.input.input;
	import io.input.writer;
	import io.input.inputhub;
	import io.utils;
	import math.vector;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Basic user interface based on Dog (opengl)
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
class GlUi : Ui {

	private {
		/++ The driver that this Ui will use +/
		Driver _driver;

		/++ The main opengl context +/
		GLWindow _context;

		/++ The keyboard reader +/
		QueueKeyboardReader _keyboard;

		/++ Current mode of this Ui +/
		Modes _currentMode;
	}

	/++
	 + Initialize with a driver
	 +/
	Ui init(Driver driver) {
		_driver = driver;
		return this;
	}

	/++ Flag: initialize actors? +/
	bool callInitActors = true;

	/++
	 + Initialize Actors
	 +/
	void initActors( DrawActor[] drawActors ) {
		// Create OpenGl input and context
		_keyboard = new QueueKeyboardReader( inputHub.mainChannel );
		_context = GLWindow();

		// Configure OpenGl
		_context
			.title("opengl")
			.showCursor(true)
			.fullscreen(false)
			.width(1024)
			.height(768)
			.create();
		if( _context.created ) {
			use(_context) in (GL gl) {
				foreach( actor; drawActors ) {
					// Update actors environment with the GlUi's environment
					actor.start(gl);
				}
			};
		} else assert( false, "Something happened when creating OpenGL Context" );

		/++
		 + Handle the keyboard input, through the driver
		 +/
		void handleKeyboard() {
			if( _context is null
				|| _keyboard is null ) return;

			if( _keyboard.keyDown(KeySym.q) ) { // Quit TODO: convert into command
				messageHub.sendMessage(new QuitMessage);
			} else if( _keyboard.keyDown(KeySym.Escape) ) { // Mode change
				if( _currentMode == Modes.Interactive ) {
					_currentMode = Modes.Console;
				} else if( _currentMode == Modes.Console ) {
					_currentMode = Modes.Interactive;
				}
			} else if( _keyboard.queueLength ) {
				auto unicodeArray = getStringFromKeySym( _keyboard.getInputQueue );

				switch(_currentMode) {
					case Modes.Interactive:
					_driver.evaluateNow( unicodeArray );
					break;

					case Modes.Console:
					if( _keyboard.keyDown(KeySym.Return) ) {
						_driver.evaluateCode();
					} else {
						_driver.pushCode( unicodeArray );
					}
					break;
				}
			}

			//_context.update();
			_keyboard.consume;
		}

		jobHub.addRepeatableJob( &handleKeyboard, 200 );

		// Set up input
		_context.msgFilter = &(new OSInputWriter(inputHub.mainChannel)).filter;
		inputHub.mainChannel.addReader( new class InputReader {
			void onInput(MouseInput* i) {
				/*
				if( i.buttons == MouseInput.Button.Left
					&& i.type == MouseInput.Type.ButtonDown )
				*/
			}

			this() {
				registerReader(&this.onInput);
			}
		} );

		// Set up OpenGl
		use(_context) in (GL gl) {
			version (Windows) {
				gl.ext(WGL_EXT_swap_control, WGL_EXT_extensions_string, ARB_multitexture) in {
					Stdout.formatln(`refresh = {}`, gl.wglGetSwapInterval());
					char* extp = gl.wglGetExtensionsString();
					if (extp !is null) {
						Stdout.formatln(fromStringz(extp));
					}

					extp = gl.GetString(GL_EXTENSIONS);
					if (extp !is null) {
						Stdout.formatln(fromStringz(extp));
					}

					Stdout.formatln(fromStringz(gl.GetString(GL_VERSION)));
				};
			}

			gl.MatrixMode(GL_PROJECTION);
			gl.LoadIdentity();
			gl.gluPerspective(90.f, 1.333f, 0.1f, 100.f);
			gl.MatrixMode(GL_MODELVIEW);
			gl.LoadIdentity();
		};
	}

	/++
	 + User interface loop
	 +/
	//debug import std.random;
	void doUi(DrawActor[] drawActors) {
		/*
		debug {
			auto rnd = Random(unpredictableSeed);
			auto com = new AddLine!(vec2f, vec2f);
			driver.injectCommands( 
				[ com._context(
					MakeContext( 
						vec2f( uniform(0,1.0,rnd), uniform(0,1.0,rnd) )
						, vec2f( uniform(0,1.0,rnd),uniform(0,1.0,rnd) )
						)
					)
 				]
				);
		}
		*/


		/*
		void drawUi(GL gl) {
			gl.Clear(GL_COLOR_BUFFER_BIT);
			gl.withState(GL_BLEND).withoutState(GL_LIGHTING) in {
				gl.BlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
				gl.Rotatef(.005f, 0, 0, 1);
				gl.immediate(GL_TRIANGLES, {
						gl.Color4f (1,    0,    0, 0.5f);
						gl.Vertex3f(-1,  -1,   -2);

						gl.Color4f (0,    1,    0, 0.5f);
						gl.Vertex3f(1,   -1,   -2);

						gl.Color4f (0,    0,    1, 0.5f);
						gl.Vertex3f(0,    1,   -2);
						});
			};
		}
		*/

		if(callInitActors) {
			initActors(drawActors);
			callInitActors = false;
		}

		if( _context.created ) {
			use(_context) in (GL gl) {
				gl.Clear(GL_COLOR_BUFFER_BIT);
				foreach( actor; drawActors ) {
					// Update actors environment with the GlUi's environment
					actor.environment = gl;
					// Execute actor
					actor.execute()();
				}
				//drawUi(gl);
			};
			_context.update().show();
		}

	}

	/++
	 + User interface main process
	 +/
	IJob getMainProcess() {
		return new MainProcess;
	}
}
