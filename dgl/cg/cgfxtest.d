// Ported from a demo by Mark J. Kilgard

module cgfxtest;

import xf.dog.Dog;
import xf.dog.Cg;
import xf.dog.ext.VERSION_1_3;

import xf.omg.core.Misc;
import xf.utils.HardwareTimer;

import tango.stdc.stdio;
import tango.stdc.stdlib;



char *programName = "cgfx_bumpdemo2"; /* Program name for messages. */

/* Cg global variables */
CGcontext   myCgContext;
CGeffect    myCgEffect;
CGtechnique myCgTechnique;
CGparameter myCgNormalMapParam,
            myCgNormalizeCubeParam,
            myCgEyePositionParam,
            myCgLightPositionParam,
            myCgModelViewProjParam;

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
		gl.ext(VERSION_1_3) in {
			gl.ClearColor(1, 1, 1, 1);

			initCg(gl);
			initOpenGL(gl);
		};
	};
	
	auto timer = new HardwareTimer;
	const float microsPerSecond = 1_000_000;
	const float radiansPerSecond = 2.5f;

	while (context.created) {
		use(context) in (GL gl) {
			gl.ext(VERSION_1_3) in {
				draw(gl);
			};
		};
		
		float deltaSeconds = timer.timeDeltaMicros / microsPerSecond;
		myEyeAngle += deltaSeconds * radiansPerSecond;
		if (myEyeAngle > 2*3.14159)
		myEyeAngle -= 2*3.14159f;

		context.update().show();
	}
}

void initCg(GL gl) {
  myCgContext = cgCreateContext();
  cgGLSetDebugMode( CG_FALSE );
  cgSetParameterSettingMode(myCgContext, CG_DEFERRED_PARAMETER_SETTING);
  cgGLRegisterStates(myCgContext);
  cgGLSetManageTextureParameters(myCgContext, CG_TRUE);

  myCgEffect = cgCreateEffectFromFile(myCgContext, "bumpdemo2.cgfx", null);
  if (!myCgEffect) {
      printf("%s\n", cgGetLastListing(myCgContext));
  }

  myCgTechnique = cgGetFirstTechnique(myCgEffect);
  while (myCgTechnique && cgValidateTechnique(myCgTechnique) == CG_FALSE) {
    fprintf(stderr, "%s: Technique %s did not validate.  Skipping.\n",
      programName, cgGetTechniqueName(myCgTechnique));
    myCgTechnique = cgGetNextTechnique(myCgTechnique);
  }

  if (myCgTechnique) {
    fprintf(stderr, "%s: Use technique %s.\n",
      programName, cgGetTechniqueName(myCgTechnique));
  } else {
    fprintf(stderr, "%s: No valid technique\n",
      programName);
    exit(1);
  }

  myCgModelViewProjParam =
    cgGetEffectParameterBySemantic(myCgEffect, "ModelViewProjection");
  if (!myCgModelViewProjParam) {
    fprintf(stderr,
      "%s: must find parameter with ModelViewProjection semantic\n",
      programName);
    exit(1);
  }
  myCgEyePositionParam =
    cgGetNamedEffectParameter(myCgEffect, "EyePosition");
  if (!myCgEyePositionParam) {
    fprintf(stderr, "%s: must find parameter named EyePosition\n",
      programName);
    exit(1);
  }
  myCgLightPositionParam =
    cgGetNamedEffectParameter(myCgEffect, "LightPosition");
  if (!myCgLightPositionParam) {
    fprintf(stderr, "%s: must find parameter named LightPosition\n",
      programName);
    exit(1);
  }
}

CGtechnique validTechnique[20];
const int MAX_TECHNIQUES = validTechnique.length;

void selectTechnique(int item)
{
  CGtechnique newTechnique = validTechnique[item];

  if (cgValidateTechnique(newTechnique)) {
    myCgTechnique = newTechnique;
  } else {
    fprintf(stderr, "%s: Technique %s did not validate.  Skipping.\n",
      programName, cgGetTechniqueName(newTechnique));
  } 
}


enum {
  TO_NORMALIZE_VECTOR_CUBE_MAP = 1,
  TO_NORMAL_MAP = 2,
};

static const GLubyte
myBrickNormalMapImage[3*(128*128+64*64+32*32+16*16+8*8+4*4+2*2+1*1)] =
/* RGB8 image data for a mipmapped 128x128 normal map for a brick pattern */
	mixin(import("brick_image.h"));

static const GLubyte
myNormalizeVectorCubeMapImage[6*3*32*32] =
/* RGB8 image data for a normalization vector cube map with 32x32 faces */
	mixin(import("normcm_image.h"));

CGparameter useSamplerParameter(CGeffect effect, char *paramName, GLuint texobj)
{
  CGparameter param;

  param = cgGetNamedEffectParameter(effect, paramName);
  if (!param) {
    fprintf(stderr, "%s: expected effect parameter named %s\n",
      programName, paramName);
    exit(1);
  }
  cgGLSetTextureParameter(param, texobj);
  cgSetSamplerState(param);
  return param;
}

void initOpenGL(GL gl)
{
	reshape(gl, 800, 600);

  uint size, level, face;
  GLubyte *image;

  gl.ClearColor(0.1, 0.3, 0.6, 0.0);  /* Blue background */
  gl.Enable(GL_DEPTH_TEST);
  gl.PixelStorei(GL_UNPACK_ALIGNMENT, 1); /* Tightly packed texture data. */

  gl.BindTexture(GL_TEXTURE_2D, TO_NORMAL_MAP);
  /* Load each mipmap level of range-compressed 128x128 brick normal
     map texture. */
  for (size = 128, level = 0, image = myBrickNormalMapImage.ptr;
       size > 0;
       image += 3*size*size, size /= 2, level++) {
    gl.TexImage2D(GL_TEXTURE_2D, level,
      GL_RGB8, size, size, 0, GL_RGB, GL_UNSIGNED_BYTE, image);
  }


  myCgNormalMapParam = useSamplerParameter(myCgEffect, "normalMap",
                                           TO_NORMAL_MAP);

  gl.BindTexture(GL_TEXTURE_CUBE_MAP, TO_NORMALIZE_VECTOR_CUBE_MAP);
  /* Load each 32x32 face (without mipmaps) of range-compressed "normalize
     vector" cube map. */
  for (face = 0, image = myNormalizeVectorCubeMapImage.ptr;
       face < 6;
       face++, image += 3*32*32) {
    gl.TexImage2D(GL_TEXTURE_CUBE_MAP_POSITIVE_X + face, 0,
      GL_RGB8, 32, 32, 0, GL_RGB, GL_UNSIGNED_BYTE, image);
  }

  myCgNormalizeCubeParam = useSamplerParameter(myCgEffect, "normalizeCube",
                                               TO_NORMALIZE_VECTOR_CUBE_MAP);
}

void reshape(GL gl, int width, int height)
{
  float aspectRatio = cast(float) width / cast(float)height;

  gl.MatrixMode(GL_PROJECTION);
  gl.LoadIdentity();
  gl.gluPerspective(
    60.0,        /* Field of view in degree */
    aspectRatio, /* Aspect ratio */ 
    0.1,         /* Z near */
    100.0);      /* Z far */
  gl.MatrixMode(GL_MODELVIEW);

  gl.Viewport(0, 0, width, height);
}

/* Draw a flat 2D patch that can be "rolled & bent" into a 3D torus by
   a vertex program. */
void drawFlatPatch(GL gl, float rows, float columns)
{
  float m = 1.0f/columns,
        n = 1.0f/rows;
  int i, j;

  for (i=0; i<columns; i++) {
    gl.Begin(GL_QUAD_STRIP);
    for (j=0; j<=rows; j++) {
      gl.Vertex2f(i*m, j*n);
      gl.Vertex2f((i+1)*m, j*n);
    }
    gl.Vertex2f(i*m, 0);
    gl.Vertex2f((i+1)*m, 0);
    gl.End();
  }
}

/* Initial scene state */
static float myEyeAngle = 0;
static const float myLightPosition[3] = [ -8, 0, 15 ];

void draw(GL gl)
{
  const int sides = 20, rings = 40;
  const float eyeRadius = 18.0,
              eyeElevationRange = 8.0;
  float eyePosition[3];
  CGpass pass;

  gl.Clear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

  eyePosition[0] = eyeRadius * sin(myEyeAngle);
  eyePosition[1] = eyeElevationRange * sin(myEyeAngle);
  eyePosition[2] = eyeRadius * cos(myEyeAngle);

  gl.LoadIdentity();
  gl.gluLookAt(
    eyePosition[0], eyePosition[1], eyePosition[2], 
    0.0 ,0.0,  0.0,   /* XYZ view center */
    0.0, 1.0,  0.0);  /* Up is in positive Y direction */

  /* Set Cg parameters for the technique's effect. */
  cgGLSetStateMatrixParameter(myCgModelViewProjParam,
    CG_GL_MODELVIEW_PROJECTION_MATRIX,
    CG_GL_MATRIX_IDENTITY);
  cgSetParameter3fv(myCgEyePositionParam, eyePosition.ptr);
  cgSetParameter3fv(myCgLightPositionParam, myLightPosition.ptr);

  /* Iterate through rendering passes for technique (even
     though bumpdemo.cgfx has just one pass). */
  pass = cgGetFirstPass(myCgTechnique);
  while (pass) {
    cgSetPassState(pass);
    drawFlatPatch(gl, sides, rings);
    cgResetPassState(pass);
    pass = cgGetNextPass(pass);
  }
}
