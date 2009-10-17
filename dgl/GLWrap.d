module dgl.GLWrap;

private {
	import dgl.Common;
	import dgl.GLFunctions;
	import dgl.OpenGL;
	
	//import xf.omg.core.LinearAlgebra;
}


private struct StateUseProxy {
	void opIn(void delegate() dg) {
		foreach (st; states) {
			if (st.en) gl.Enable(st.st);
			else gl.Disable(st.st);
		}

		scope (exit) foreach (st; states) {
			if (st.en) gl.Disable(st.st);
			else gl.Enable(st.st);
		}

		dg();
	}
	
	
	StateUseProxy withState(GLenum[] states ...) {
		_setStates(states, true);
		version( D_Version2 ) {
			return this;
		} else {
			return *this;
		}
	}
	

	StateUseProxy withoutState(GLenum[] states ...) {
		_setStates(states, false);
		version( D_Version2 ) {
			return this;
		} else {
			return *this;
		}
	}


	private {
		struct Item {
			GLenum	st;
			bool			en;
		}
		
		Item[16]	buffer;
		GL			gl;
		ubyte		num;

		Item[] states() {
			return buffer[0..num];
		}


		void _setStates(GLenum[] set, bool endis) {
			assert (num + set.length <= buffer.length);

			foreach (i, ref st; buffer[num..num+set.length]) {
				st.st = set[i];
				st.en = endis;
			}
			
			num += set.length;
		}
	}
}


/**
	Configures OpenGL matrices to position the virtual camera at 'eye', looking at 'target' with the up vector being 'up'
	
	Params:
		fovy = the vertical field of view as per gluPerspective
		aspect = render target width / height
		near = near clipping plane distance
		far = far clipping plane distance
		
	Return value: the modelview matrix
*/
/*
mat4 lookAt(GL gl, vec3 eye, vec3 target, vec3 up = vec3.unitY, float fovy = 90, float aspect = 1.333333, float near = .1, float far = 1000) {
	gl.MatrixMode(GL_PROJECTION);
	gl.LoadIdentity();
	gl.gluPerspective(fovy, aspect, near, far);
	gl.MatrixMode(GL_MODELVIEW);
	
	vec3 bck	= (eye - target).normalized;
	vec3 right	= cross(up, bck).normalized;
	mat4 mat	= mat4.identity;
	
	auto rot = mat3.fromVectors(right, cross(bck, right), bck).transposed;
	mat.setRotation(rot);
	mat.setTranslation(-eye * rot);
	
	gl.LoadMatrixf(mat.ptr);
	return mat;
}
*/


StateUseProxy withState(GL gl, GLenum[] states ...) {
	StateUseProxy proxy = void;
	proxy.gl = gl;
	proxy.num = 0;
	return proxy.withState(states);
}


StateUseProxy withoutState(GL gl, GLenum[] states ...) {
	StateUseProxy proxy = void;
	proxy.gl = gl;
	proxy.num = 0;
	return proxy.withoutState(states);
}


// ----


struct MatrixUseProxy {
	void opIn(void delegate() dg) {
		gl.PushMatrix();
		scope (exit) gl.PopMatrix();
		dg();
	}
	
	
	private {
		GL gl;
	}
}


MatrixUseProxy localMatrix(GL gl) {
	return MatrixUseProxy(gl);
}


// ----


void immediate(GL gl, GLenum prims, void delegate() dg) {
	gl.Begin(prims);
	scope (exit) gl.End();
	dg();
}
