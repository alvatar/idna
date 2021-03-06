/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Copyright (c) 2010 by Álvaro Castro-Castilla, All Rights Reserved.
 + Licensed under the MIT/X11 license, see LICENSE file for full description
 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/

module cyma.controller.graphical.GlUi;

public import cyma.controller.Ui;
private {
	import std.stdio;

	import core.MessageHandler;
	import core.MessageHub;
	import core.MainProcess;
	import dgl.dgl;
	import io.input.input;
	import io.input.Writer;
	import io.input.InputHub;
	import io.utils;
	import math.Vector;

	import cyma.application.messages;
	import cyma.controller.commands.All;
	import cyma.controller.graphical.GlWidget;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Basic user interface based on Dgl (OpenGl)
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
class GlUi : BaseUi {

	enum Modes {
		Interactive
		, CommandRunning
		, Console
	}

	private {
		/++ The main opengl context +/
		GLWindow _context;

		/++ The keyboard reader +/
		QueueKeyboardReader _keyboard;

		/++ Current mode of this Ui +/
		Modes _currentMode;

		/++ OpenGl Widgets: CLI and all the visual elements besied DrawActors +/
		GlWidget _widgets[];

		/++ Flag: initialize actors? +/
		bool _callInitActors = true;
	}

	/++ Initialize with a driver +/
	template CommandCaller(C) {
		Command CommandCaller() {
			return new C( _environment, output );
		}
	}
	void init() {
		// Populate command codes
		_driver.registerCommand( "a", &CommandCaller!CreateLine );
		_driver.registerCommand( "q", &CommandCaller!Quit );
		_driver.registerCommand( "x", &CommandCaller!EnginePlugin );

		// -- Externally induced mode changes
		MessageHandler handler = new MessageHandler;
		handler.register!(CommandFinishedMessage)(
				delegate void(CommandFinishedMessage msg){
					_currentMode = Modes.Interactive;
				}
			);
		handler.register!(CommandStartedMessage)(
				delegate void(CommandStartedMessage msg){
					_currentMode = Modes.CommandRunning;
				}
			);
		messageHub.registerMessageHandler(handler);
		// --
	}

	/++ Initialize Actors +/
	void initActors( OutputActor[] outputActors ) {
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
				foreach( actor; outputActors ) {
					actor.start(gl);
				}
			};
		} else assert( false, "Error creating OpenGL Context" );

		// Handle the keyboard input, through the driver
		void handleKeyboard() {
			if( _context is null || _keyboard is null )
				return;

			if( _keyboard.keyDown(KeySym.Escape) ) {
				// -- Internally induced mode changes
				if( _currentMode == Modes.Interactive )
					_currentMode = Modes.Console;
				else if( _currentMode == Modes.Console )
					_currentMode = Modes.Interactive;
				else if( _currentMode == Modes.CommandRunning )
					_driver.abortCurrent();
				// --
			} else if( _keyboard.queueLength ) { // Rest of keys

				auto unicodeArray = getUnicodeFromInput( _keyboard.getInputQueue );
				switch(_currentMode) {
					case Modes.Interactive:
					_driver.evaluateNow( unicodeArray );
					break;

					case Modes.CommandRunning:
					auto input = _keyboard.getInputQueue;
					_driver.pipeToCurrentCommand( Variant(&input) );
					break;

					case Modes.Console:
					if( _keyboard.keyDown(KeySym.Return) )
						_driver.evaluateCode();
					else
						_driver.pushCode( unicodeArray );
					break;
					default: break;
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
				switch(_currentMode) {
					case Modes.Interactive:
					break;

					case Modes.CommandRunning:
					_driver.pipeToCurrentCommand( Variant(i) );
					break;

					case Modes.Console:
					break;

					default: break;
				}
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

	/++ User interface loop +/
	void doUi( OutputActor[] outputActors ) {
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

		if(_callInitActors) {
			initActors(outputActors);
			_callInitActors = false;
		}
		if( _context.created ) {
			use(_context) in (GL gl) {
				foreach( ref a; outputActors ) {
					// Update actors context with the GlUi's context
					a.context = gl;
					a.preprocess();
				}
				gl.Clear(GL_COLOR_BUFFER_BIT);
				foreach( w; _widgets ) {
					w.doWidget(gl);
				}
				foreach( ref a; outputActors ) {
					a.show();
				}
			};
			_context.update().show();
		}

	}

	/++ User interface main process +/
	IJob main() {
		return new MainProcess;
	}
}
