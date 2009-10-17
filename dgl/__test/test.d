module dgl.test;

import dgl.Dgl,
	dgl.ext.WGL_EXT_swap_control,
	dgl.ext.WGL_EXT_extensions_string,
	dgl.ext.ARB_shader_objects,
	dgl.ext.ARB_multitexture;

version( D_Version2 ) {
	import std.string;
	import std.stdio : stdout = writeln;
} else {
	import tango.io.Stdout		: Stdout;
	import tango.stdc.stringz	: fromStringz;
}



void draw(GL gl) {
	gl.Clear(GL_COLOR_BUFFER_BIT);
	
	gl.withState(GL_BLEND).withoutState(GL_LIGHTING) in {
		gl.BlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

		gl.Rotatef(.5f, 0, 0, 1);

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


void main() {
	auto context = GLWindow();
	context
		.title(`Dog Demo`)
		.showCursor(true)
		.fullscreen(false)
		.width(800)
		.height(600)
	.create();
	

	// setup gl data
	use(context) in (GL gl) {
		version (Windows) {
			gl.ext(WGL_EXT_swap_control, WGL_EXT_extensions_string, ARB_multitexture) in {
				stdout(`refresh = {}`, gl.wglGetSwapInterval());
				char* extp = gl.wglGetExtensionsString();
				if (extp !is null) {
					stdout(fromStringz(extp));
				}

				extp = gl.GetString(GL_EXTENSIONS);
				if (extp !is null) {
					stdout(fromStringz(extp));
				}
				
				stdout(fromStringz(gl.GetString(GL_VERSION)));
			};
		}

		gl.MatrixMode(GL_PROJECTION);
		gl.LoadIdentity();
		gl.gluPerspective(90.f, 1.333f, 0.1f, 100.f);
		gl.MatrixMode(GL_MODELVIEW);
		gl.LoadIdentity();
		
		if (gl.ext(ARB_shader_objects).supported) {
			stdout("ARB_shader_objects supported");
		} else {
			stdout("ARB_shader_objects NOT supported");
		}
	};


	// draw some stuff
	while (context.created) {
		use(context) in (GL gl) {
			draw(gl);

			if (!(gl.ext(ARB_multitexture) in {
				gl.ActiveTexture(GL_TEXTURE0_ARB);
			})) {
				stdout(`ARB_multitexture not supported`);
			}
		};

		context.update().show();
	}
}
