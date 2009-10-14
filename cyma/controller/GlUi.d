module idna.cyma.controller.GlUi;

private {
	import xf.input.Input;
	import xf.input.KeySym;
	import xf.core.InputHub;
	import xf.core.JobHub;
	import xf.core.MessageHub;
	import xf.core.Message;
	import xf.dog.Dog;
	import xf.game.MainProcess;
	version (NewDogInput) {
	} else {
		import xf.input.Writer;
	}

	import idna.tools.Curry;
	import idna.tools.AsyncMessageHub;

	import idna.cyma.controller.Ui;
	import idna.cyma.engine.commands.All;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Basic user interface based on Dog (opengl)
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
class GlUi : Ui {

	private {
		/++ The main opengl context +/
		GLWindow context;

		/++ The keyboard reader +/
		SimpleKeyboardReader keyboard;

		void handleKeyboard()
		{
			if( context is null
				|| keyboard is null ) return;

			if( keyboard.keyDown(KeySym.Escape) ) {
				messageHub.sendMessage(new QuitMessage);
			}
			context.update();
		}
	}

	/++
	 + Init function
	 +/
	void init() {
		// Create OpenGl input and context
		keyboard = new SimpleKeyboardReader( inputHub.mainChannel );
		context = GLWindow();

		// Configure OpenGl
		context
			.title(`opengl`)
			.showCursor(true)
			.fullscreen(false)
			.width(1024)
			.height(768)
		.create();

		jobHub.addRepeatableJob( &handleKeyboard, 200 );

		// Set up input
		version (NewDogInput) {
			context.inputChannel = inputHub.mainChannel;
		} else {
			context.msgFilter = &(new OSInputWriter(inputHub.mainChannel)).filter;
		}
		inputHub.mainChannel.addReader( new class InputReader {
			void onInput(MouseInput* i) {
				//if( i.buttons == MouseInput.Button.Left  && i.type == MouseInput.Type.ButtonDown )
			}

			this() {
			registerReader(&this.onInput);
			}
		} );

		// Set up OpenGl
		use(context) in (GL gl) {
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
	debug import xf.omg.core.LinearAlgebra;
	debug import tango.math.random.Random;
	void doUi( Driver driver, DrawActor[] drawActors ) {
		debug {
			auto r = new Random;
			auto com = new AddLine!(vec2, vec2);
			driver.injectCommands( 
				[ com.context( MakeContext( vec2(r.uniformR(1.0),r.uniformR(1.0)), vec2(r.uniformR(1.0),r.uniformR(1.0))) )
 				]
				);
		}

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

		if( context.created ) {
			use(context) in (GL gl) {
				gl.Clear(GL_COLOR_BUFFER_BIT);
				foreach( actor; drawActors ) {
					// Update actors environment with the GlUi's environment
					actor.environment = gl;
					// Execute actor
					actor.execute()();
				}
				//gl.drawUi();
			};
			context.update().show();
		}
	}

	/++
	 + User interface main process
	 +/
	IJob getMainProcess() {
		return new MainProcess;
	}
}
