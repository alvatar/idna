module dog.glsltest;

import xf.dog.Dog;
import xf.dog.ext.ARB_multitexture;
import xf.dog.ext.VERSION_2_0;
import xf.dog.Glsl;

import tango.io.Stdout		: Stdout;
import tango.stdc.stringz	: fromStringz;
import tango.io.device.File;


void draw(GL gl) {
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


void main()
{
	auto context = GLWindow();
	context
		.title(`opengl`)
		.showCursor(true)
		.fullscreen(false)
		.width(800)
		.height(600)
	.create();
	

	// setup gl data
	use(context) in (GL gl)
	{
		gl.MatrixMode(GL_PROJECTION);
		gl.LoadIdentity();
		gl.gluPerspective(90.f, 1.333f, 0.1f, 100.f);
		gl.MatrixMode(GL_MODELVIEW);
		gl.LoadIdentity();
		
		if ( !(gl.ext(VERSION_2_0) in
		{
			GLuint p = gl.CreateProgram();

			gl.dogCompileShaderFile("minimal.vert", GL_VERTEX_SHADER, p);

			const char[] fragmentShader = "
			void main()
			{
				        gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
			}
			";
			gl.dogCompileShaderSource(fragmentShader, GL_FRAGMENT_SHADER, p);

			gl.LinkProgram(p);
			gl.dogPrintProgramInfoLog(p);
			gl.UseProgram(p);

			/+!
			 + Equivalent code with direct Opengl calls:
			 +
				gl.ext(ARB_shader_objects) in
				{
					GLuint v;
					GLuint f;
					GLuint p;

					v = gl.CreateShader(GL_VERTEX_SHADER);
					f = gl.CreateShader(GL_FRAGMENT_SHADER);

					auto vertFile = File.get("minimal.vert");
					//Stdout.format(cast(char[])vertFile).newline;
					auto fragFile = File.get("minimal.frag");
					//Stdout.format(cast(char[])fragFile).newline;

					char* vertFilePtr = cast(char*)vertFile.ptr;
					char* fragFilePtr = cast(char*)fragFile.ptr;

					gl.ShaderSource(v, 1, &vertFilePtr,null);
					gl.ShaderSource(f, 1, &fragFilePtr,null);

					gl.CompileShader(v);
					gl.CompileShader(f);

					gl.printShaderInfoLog(v);
					gl.printShaderInfoLog(f);

					p = gl.CreateProgram();
					gl.AttachShader(p, v);
					gl.AttachShader(p, f);

					gl.LinkProgram(p);

					gl.dogPrintProgramInfoLog(p);

					gl.UseProgram(p);
				}; +/
		})) {
			Stdout.formatln(`OpenGL Version 2.0 not supported`);
		}

	};


	// draw some stuff
	while (context.created) {
		use(context) in (GL gl) {
			draw(gl);
		};

		context.update().show();
	}
}
