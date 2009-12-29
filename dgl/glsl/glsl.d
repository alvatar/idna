module dgl.glsl;

private import tango.io.Stdout;
private import tango.stdc.stringz;
private import tango.io.device.File;

private import xf.dgl.OpenGL;
public import xf.dgl.ext.VERSION_2_0;

void dglPrintShaderInfoLog(GL gl, GLuint obj) {
    int infologLength = 0;
    int charsWritten  = 0;
    char *infoLog;

	gl.GetShaderiv(obj, GL_INFO_LOG_LENGTH, &infologLength);

    if (infologLength > 1) {
		char[] infoLogArray = new char[infologLength];
		infoLog = infoLogArray.ptr;
        gl.GetShaderInfoLog(obj, infologLength, &charsWritten, infoLog);
		Stdout.formatln( fromStringz(infoLog) );
    } else {
		Stdout.formatln("Shader source OK");
	}
}


void dglPrintProgramInfoLog(GL gl, GLuint obj) {
	int infologLength = 0;
	int charsWritten  = 0;
	char *infoLog;

	gl.GetProgramiv(obj, GL_INFO_LOG_LENGTH, &infologLength);

	if (infologLength > 1) {
		char[] infoLogArray = new char[infologLength];
		infoLog = infoLogArray.ptr;
		gl.GetProgramInfoLog(obj, infologLength, &charsWritten, infoLog);
		Stdout.formatln( fromStringz(infoLog) );
	} else {
		Stdout.formatln("Shader program OK");
	}
}

void dglCompileShaderFile(GL gl, char[] file, GLuint type, GLuint program) {
	GLuint v;
	v = gl.CreateShader(type);
	auto shaderFile = File.get(file);
	char* shaderFilePtr = toStringz( cast(char[])(shaderFile) );
	//char* shaderFilePtr = cast(char*)shaderFile.ptr;
	gl.ShaderSource(v, 1, &shaderFilePtr, null);
	gl.CompileShader(v);
	gl.dglPrintShaderInfoLog(v);
	gl.AttachShader(program, v);
}

void dglCompileShaderSource(GL gl, char[] source, GLuint type, GLuint program) {
	GLuint v;
	v = gl.CreateShader(type);
	char* shaderSourcePtr = toStringz( source );
	gl.ShaderSource(v, 1, &shaderSourcePtr, null);
	gl.CompileShader(v);
	gl.dglPrintShaderInfoLog(v);
	gl.AttachShader(program, v);
}

