module dgl.Primitives;

private {
	import dgl.OpenGL;
	//import xf.omg.core.LinearAlgebra;
}


void drawCube(GL gl, vec3 center, quat orientation, vec3 halfSize) {
	gl.PushMatrix();
		mat4 mat = mat4.translation(center);
		mat.setRotation(orientation.toMatrix());
		gl.MultMatrixf(mat.ptr);
		gl.Scalef(halfSize.x, halfSize.y, halfSize.z);
		
		gl.EnableClientState(GL_VERTEX_ARRAY);
		gl.EnableClientState(GL_NORMAL_ARRAY);
		gl.EnableClientState(GL_TEXTURE_COORD_ARRAY);
			gl.VertexPointer(3, GL_FLOAT, 0, cubePositions.ptr);
			gl.NormalPointer(GL_FLOAT, 0, cubeNormals.ptr);
			gl.TexCoordPointer(3, GL_FLOAT, 0, cubeTexCoords.ptr);
			gl.DrawElements(GL_TRIANGLES, 36, GL_UNSIGNED_INT, cubeIndices.ptr);
		gl.DisableClientState(GL_TEXTURE_COORD_ARRAY);
		gl.DisableClientState(GL_NORMAL_ARRAY);
		gl.DisableClientState(GL_VERTEX_ARRAY);
	gl.PopMatrix();
}


// ---- generation ----


static this() {
	genCubeData;
}


vec3[24] cubePositions;
vec3[24] cubeNormals;
vec2[24] cubeTexCoords;
uint[36] cubeIndices;


private void genCubeData() {
	static vec3[3] ijk = [vec3.unitX, vec3.unitY, vec3.unitZ];
	int vert;
	int ind;
	
	void genFace(vec3 orig, int[] axes) {
		vec3 normal = cross(-orig.cell[axes[0]] * ijk[axes[0]], -orig.cell[axes[1]] * ijk[axes[1]]);
		void addVert(vec3 p, vec2 tc) {
			cubeNormals[vert] = normal;
			cubeTexCoords[vert] = tc;
			cubePositions[vert++] = p;
		}

		static int[] indOff = [0, 1, 2, 0, 2, 3];
		foreach (off; indOff) {
			cubeIndices[ind++] = vert+off;
		}

		vec2i tc = vec2i.zero;
		for (int i = 0; i < 4; ++i) {
			addVert(orig, vec2.from(tc));
			tc.cell[i&1] ^= 1;
			orig.cell[axes[i&1]] *= -1;
		}
	}
	
	genFace(vec3(-1, -1, 1),		[0, 1]);		// front
	genFace(vec3(1, -1, 1),		[2, 1]);		// right
	genFace(vec3(1, -1, -1),		[0, 1]);		// back
	genFace(vec3(-1, -1, -1),	[2, 1]);		// left
	genFace(vec3(-1, -1, -1),	[0, 2]);		// bottom
	genFace(vec3(-1, 1, 1),		[0, 2]);		// top
	
	assert (vert == cubePositions.length);
	assert (ind == cubeIndices.length);
}
