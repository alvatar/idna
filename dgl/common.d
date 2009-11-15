module dgl.common;

private {
	version( D_Version2 ) {
		import std.traits : ReturnTypeOf = ReturnType;
		import std.string : Format = format;
		import std.conv;
	} else {
		import tango.core.Traits : ReturnTypeOf;
		//import tango.text.convert.Sprint;
		import tango.text.convert.Format : Format;
		import tango.stdc.stringz : fromStringz;
		import tango.stdc.stdio : printf;

		alias char[] string;
	}

	import dgl.exceptions;
}

public {
	import dgl.glconsts;
}


typedef void[] GL;


version (DogNoExtSupportAsserts) {
} else {
	version = DogExtSupportAsserts;
}


class GLHandle {
	bool			insideGlBegin = false;
	void*[][]	extFuncs;
	
	version (DogExtSupportAsserts) {
		int[]		extEnabled;
	}
}


private union HandleUnion {
	GL			gl;
	GLHandle	handle;
}



void _setGL(ref GL gl, GLHandle obj) {
	assert (obj !is null);
	HandleUnion hu;
	hu.handle = obj;
	gl = hu.gl;
}

GLHandle _getGL(GL gl) {
	HandleUnion hu;
	hu.gl = gl;
	return hu.handle;
}



extern (System) {
	GLenum function()					fp_glGetError;
	GLubyte* function(GLenum)	fp_gluErrorString;
}


public ReturnTypeOf!(Func) checkedCall(Func, Params ...)(GL gl, string fname, Func fp, Params p) {
	version (DogNoErrorChecking) {
		return fp(p);
	}
	else {
		assert (fp !is null, "the function pointer is null");
		
		alias ReturnTypeOf!(Func) RetT;
		static if (is(RetT == void)) {
			fp(p);
		} else {
			RetT res = fp(p);
		}
		
		assert (fp_glGetError !is null, "fp_glGetError is null");
		
		auto glhandle = _getGL(gl);
		bool insideGlBegin = glhandle !is null && glhandle.insideGlBegin;
		
		GLenum error;
		if (!insideGlBegin && GL_NO_ERROR != (error = fp_glGetError())) {
			//scope sprint = new Sprint!(char);

			string paramsStr = `(`; {
				foreach (i, x; p) {
					if (i != 0) paramsStr ~= `, `;
					
					try {
						paramsStr ~= Format(`{}`, x);
					} catch {
						paramsStr ~= `(error)`;
					}
				}
				paramsStr ~= `)`;
			}
			
			assert (fp_gluErrorString !is null, "fp_gluErrorString is null");
			char* gluerr = cast(char*)fp_gluErrorString(error);

			version( D_Version2 ) {
				handleOpenGLError(fname, gluerr is null ? Format(`code 0x{0:x}`, cast(int)error) : to!(string)(gluerr), paramsStr);
			} else {
				handleOpenGLError(fname, gluerr is null ? Format(`code 0x{0:x}`, cast(int)error) : fromStringz(gluerr), paramsStr);
			}

		}
		
		static if (!(is(RetT == void))) {
			return res;
		}
	}
}


void handleOpenGLError(string fname, string errorStr, string paramsStr) {
	string fcall = fname ~ paramsStr;
	throw new Exception(`OpenGL error "` ~ errorStr ~ `" in ` ~ fcall);
}
