module cgtest;

import xf.dog.Dog;
import xf.dog.Cg;



CGcontext		myCgContext;
CGprofile		myCgVertexProfile,
					myCgFragmentProfile;
CGprogram	myCgVertexProgram,
					myCgFragmentProgram;

const char*	myProgramName = "04_varying_parameter",
					myVertexProgramFileName = "C3E2v_varying.cg",
					myVertexProgramName = "C3E2v_varying",
					myFragmentProgramFileName = "C2E2f_passthru.cg",
					myFragmentProgramName = "C2E2f_passthru";


void main() {
	auto context = GLWindow();
	context
		.title(`Dog Demo`)
		.showCursor(false)
		.fullscreen(false)
		.width(800)
		.height(600)
	.create();
	
	initDogCg();
	
	use(context) in (GL gl) {
		gl.ClearColor(1, 1, 1, 1);
	};

	myCgContext = cgCreateContext();
	cgGLSetDebugMode(CG_FALSE);
	cgSetParameterSettingMode(myCgContext, CG_DEFERRED_PARAMETER_SETTING);

	myCgVertexProfile = cgGLGetLatestProfile(CG_GL_VERTEX);
	cgGLSetOptimalOptions(myCgVertexProfile);

	myCgVertexProgram =
		cgCreateProgramFromFile(
			myCgContext,              /* Cg runtime context */
			CG_SOURCE,                /* Program in human-readable form */
			myVertexProgramFileName,  /* Name of file containing program */
			myCgVertexProfile,        /* Profile: OpenGL ARB vertex program */
			myVertexProgramName,      /* Entry function name */
			null);                    /* No extra compiler options */
			
	cgGLLoadProgram(myCgVertexProgram);

	/* No uniform vertex program parameters expected. */

	myCgFragmentProfile = cgGLGetLatestProfile(CG_GL_FRAGMENT);
	cgGLSetOptimalOptions(myCgFragmentProfile);

	myCgFragmentProgram =
		cgCreateProgramFromFile(
			myCgContext,                /* Cg runtime context */
			CG_SOURCE,                  /* Program in human-readable form */
			myFragmentProgramFileName,  /* Name of file containing program */
			myCgFragmentProfile,        /* Profile: OpenGL ARB vertex program */
			myFragmentProgramName,      /* Entry function name */
			null);                      /* No extra compiler options */
			
	cgGLLoadProgram(myCgFragmentProgram);

	/* No uniform fragment program parameters expected. */

	while (context.created) {
		use(context) in (GL gl) {
			draw(gl);
		};

		context.update().show();
	}
}

void draw(GL gl) {
	gl.Clear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

	cgGLBindProgram(myCgVertexProgram);
	cgGLEnableProfile(myCgVertexProfile);
	cgGLBindProgram(myCgFragmentProgram);
	cgGLEnableProfile(myCgFragmentProfile);

	gl.Begin(GL_TRIANGLES);
		gl.Color3f(1, 0, 0);  /* Red */
		gl.Vertex2f(-0.8, 0.8);

		gl.Color3f(0, 1, 0);  /* Green */
		gl.Vertex2f(0.8, 0.8);

		gl.Color3f(0, 0, 1);  /* Blue */
		gl.Vertex2f(0.0, -0.8);
	gl.End();


	cgGLDisableProfile(myCgVertexProfile);
	cgGLDisableProfile(myCgFragmentProfile);
}
