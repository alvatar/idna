module dgl.ext.PGI_vertex_hints;
import dgl.OpenGL;
import dgl.GLExt;

version( D_Version2 ) {
	import std.string : containsPattern = count;
	import std.conv;
} else {
	import tango.text.Util : containsPattern;
	import tango.stdc.stringz : fromStringz;
	alias char[] string;
}



private ushort extensionId__ = 12;
alias extensionId__ PGI_vertex_hints;

	version (DogNoExtSupportAsserts) {
	} else {
		version = DogExtSupportAsserts;
	}
	
	static this() {
		if (__extSupportCheckingFuncs.length <= extensionId__) {
			__extSupportCheckingFuncs.length = extensionId__ + 1;
		}
		__extSupportCheckingFuncs[extensionId__] = &__supported;
	}

version (all) {
	public {
			const GLenum GL_VERTEX23_BIT_PGI = 0x00000004;
			const GLenum GL_VERTEX4_BIT_PGI = 0x00000008;
			const GLenum GL_COLOR3_BIT_PGI = 0x00010000;
			const GLenum GL_COLOR4_BIT_PGI = 0x00020000;
			const GLenum GL_EDGEFLAG_BIT_PGI = 0x00040000;
			const GLenum GL_INDEX_BIT_PGI = 0x00080000;
			const GLenum GL_MAT_AMBIENT_BIT_PGI = 0x00100000;
			const GLenum GL_VERTEX_DATA_HINT_PGI = 107050;
			const GLenum GL_VERTEX_CONSISTENT_HINT_PGI = 107051;
			const GLenum GL_MATERIAL_SIDE_HINT_PGI = 107052;
			const GLenum GL_MAX_VERTEX_HINT_PGI = 107053;
			const GLenum GL_MAT_AMBIENT_AND_DIFFUSE_BIT_PGI = 0x00200000;
			const GLenum GL_MAT_DIFFUSE_BIT_PGI = 0x00400000;
			const GLenum GL_MAT_EMISSION_BIT_PGI = 0x00800000;
			const GLenum GL_MAT_COLOR_INDEXES_BIT_PGI = 0x01000000;
			const GLenum GL_MAT_SHININESS_BIT_PGI = 0x02000000;
			const GLenum GL_MAT_SPECULAR_BIT_PGI = 0x04000000;
			const GLenum GL_NORMAL_BIT_PGI = 0x08000000;
			const GLenum GL_TEXCOORD1_BIT_PGI = 0x10000000;
			const GLenum GL_TEXCOORD2_BIT_PGI = 0x20000000;
			const GLenum GL_TEXCOORD3_BIT_PGI = 0x40000000;
			const GLenum GL_TEXCOORD4_BIT_PGI = 0x80000000;
	}
	private {
		extern (System) {
		}
	}
	public {
	}
	private final bool __supported(GL gl_) {
		auto gl = _getGL(gl_);
	
		if (extensionId__ < cast(int)gl.extFuncs.length && gl.extFuncs[extensionId__] !is null) {
			return gl.extFuncs[extensionId__][0] !is null;
		}
		
		synchronized (gl) {
			if (extensionId__ < cast(int)gl.extFuncs.length && gl.extFuncs[extensionId__] !is null) {
				return gl.extFuncs[extensionId__][0] !is null;
			}

			if (gl.extFuncs.length <= extensionId__) {
				gl.extFuncs.length = extensionId__ + 1;
				
				version (DogExtSupportAsserts) {
					gl.extEnabled.length = extensionId__ + 1;
				}
			}
			gl.extFuncs[extensionId__] = loadFunctions__(gl_);
			
			return gl.extFuncs[extensionId__][0] !is null;
		}
	}
	private void*[] loadFunctions__(GL gl) {
		void*[] funcAddr = new void*[1];
		{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {
				string extStr = extP is null ? null : to!(string)(extP);
			} else {
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("GL_PGI_vertex_hints")) { funcAddr[0] = null; return funcAddr; }
		}
		funcAddr[0] = cast(void*)&gl;
		return funcAddr;
	}
}


	else {
		private final bool __supported(GL gl_) {
			return false;
		}
	}
