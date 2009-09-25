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

	import idna.tools.Compat;
	import idna.tools.Curry;

	import idna.cyma.application.MessageBox;
	import idna.cyma.controller.Ui;
	import idna.cyma.engine.Driver;
	import idna.cyma.view.Drawer;
}

/+
 + Basic user interface based on Dog (opengl)
 +/
class GlUi : Ui
{
	private {
		/// The main opengl context
		GLWindow context;

		/// The keyboard reader
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
	void init()
	{
		keyboard = new SimpleKeyboardReader( inputHub.mainChannel );
		context = GLWindow();

		context
			.title(`opengl`)
			.showCursor(true)
			.fullscreen(false)
			.width(1024)
			.height(768)
		.create();

		jobHub.addRepeatableJob( &handleKeyboard, 200 );

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
	void doUi( Driver driver
			, DrawFunctionInfo[] drawFunctionInfos )
	{
		// Wrap each draw function, in case it needs some preparation
		//
		// Store functions specific for each type of canvas that this UI
		// is able to handle
		// TODO: some cache mechanism. THIS IS CRAP
		scope void delegate( void delegate() )[string] glDrawSurfaces;
		foreach( funcInfo; drawFunctionInfos ) {
			// Simple wrapper for the draw function. Allows to create UI
			// context to allow execution of the draw function
			// TODO: some system for creating different wrapper depending
			// on the function type
			glDrawSurfaces[funcInfo.name] = ( void delegate()f ){ f(); };
		}

		void drawUi(GL gl) {
			/*
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
			*/
		}

		if( context.created ) {
			use(context) in (GL gl) {
				// Now inside the GL context we can draw the wrapped functions
				// that we built upon the raw ones coming from Drawer. Those are
				// passed to the wrapper function in-place:
				foreach( funcInfo; drawFunctionInfos ) {
					glDrawSurfaces[funcInfo.name]( funcInfo.func );
				}
				gl.drawUi();
			};
			context.update().show();
		}
	}

	/++
	 + User interface main process
	 +/
	IJob getMainProcess()
	{
		return new MainProcess;
	}
}
