module dgl.Utils;

private {
	import std.stdio;

	import dgl.Dgl;
	import dgl.GLConsts;
	import dgl.ext.VERSION_1_5;
	import dgl.ext.VERSION_2_0;
}

void createVBO(
		GL gl
		, ref GLuint id
		, void* data
		, int dataSize
		, GLenum target
		, GLenum usage
		) {
	// generate a new VBO for vertices and get the associated ID
	gl.GenBuffers(1, &id);
	// bind vertices VBO in order to use
	gl.BindBuffer(target, id);
	// upload data to vertices VBO
	gl.BufferData(target, dataSize, data, usage);

	GLint bufferSize = 0;
	gl.GetBufferParameteriv(target, GL_BUFFER_SIZE, &bufferSize);
	if(dataSize != bufferSize) {
		gl.DeleteBuffers(1, &id);
		id = 0;
		writefln( "File: %s | Line: %s | Error: %s "
				, __FILE__
				, __LINE__
				,"Data size is mismatch with input array\n" );
	}
}
