module dgl.glfunctions;

private {
	version( Tango ) {
		import tango.core.Traits : isIntegerType, isFloatingPointType, ParameterTupleOf;
		import tango.core.Tuple : Tuple;
	} else {
		import std.traits : ParameterTypeTuple;
		template ParameterTupleOf(alias dg) {
			alias ParameterTypeTuple!(dg) ParameterTupleOf;
		}
	}

	import dgl.common;
}

package {
	import dgl.glfunctionptrs;
}

public {
	// Genericized versions
	void LoadMatrix(T : T[])(GL gl, T[16] matrix) {
		return checkedCall(gl, "LoadMatrix", mixin("fp_glLoadMatrix" ~ T.stringof[0]), matrix.ptr);
	}

	void MultMatrix(T : T[])(GL gl, T[16] matrix) {
		return checkedCall(gl, "MultMatrix", mixin("fp_glMultMatrix" ~ T.stringof[0]), matrix.ptr);
	}

	void Rotate(T, V)(GL gl, T angle, V vec) {
		static if(is(typeof(V.x)) && is(typeof(V.y)) && is(typeof(V.z))) {
			static if(!isFloatingPointType!(V.x)) {
				return checkedCall(gl, "Rotate", fp_glRotated, cast(double)cast(real) angle, cast(double)cast(real)vec.x, cast(double)cast(real)vec.y, cast(double)cast(real)vec.z);
			} else {
				return checkedCall(gl, "Rotate", mixin("fp_glRotate" ~ typeof(V.x).stringof[0]), cast(typeof(V.x))angle, vec.x, vec.y, vec.z);
			}
		} else {
			static assert(false, "Rotation vectors must have three coordinates (x, y, and z).");
		}
	}
	void Rotate(T)(GL gl, T angle, T x, T y, T z) {
		static if(!isFloatingPointType!(T)) {
			return checkedCall(gl, "Rotate", fp_glRotated, cast(double)cast(real) angle, cast(double)cast(real)x, cast(double)cast(real)y, cast(double)cast(real)z);
		} else {
			return checkedCall(gl, "Rotate", mixin("fp_glRotate" ~ T.stringof[0]), x, y, z);
		}
	}

	void Scale(V)(GL gl, V vec) {
		static if(is(typeof(V.x)) && is(typeof(V.y)) && is(typeof(V.z))) {
			static if(!isFloatingPointType!(V.x)) {
				return checkedCall(gl, "Scale", fp_glScaled, cast(double)cast(real)vec.x, cast(double)cast(real)vec.y, cast(double)cast(real)vec.z);
			} else {
				return checkedCall(gl, "Scale", mixin("fp_glScale" ~ typeof(V.x).stringof[0]), vec.x, vec.y, vec.z);
			}
		} else {
			static assert(false, "Scale vectors must have three coordinates (x, y, and z).");
		}
	}
	void Scale(T)(GL gl, T x, T y, T z) {
		static if(!isFloatingPointType!(T)) {
			return checkedCall(gl, "Scale", fp_glScaled, cast(double)cast(real)x, cast(double)cast(real)y, cast(double)cast(real)z);
		} else {
			return checkedCall(gl, "Scale", mixin("fp_glScale" ~ T.stringof[0]), x, y, z);
		}
	}

	void Translate(V)(GL gl, V vec) {
		static if(is(typeof(V.x)) && is(typeof(V.y)) && is(typeof(V.z))) {
			static if(!isFloatingPointType!(V.x)) {
				return checkedCall(gl, "Translate", fp_glTranslated, cast(double)cast(real)vec.x, cast(double)cast(real)vec.y, cast(double)cast(real)vec.z);
			} else {
				return checkedCall(gl, "Translate", mixin("fp_glTranslate" ~ typeof(V.x).stringof[0]), vec.x, vec.y, vec.z);
			}
		} else {
			static assert(false, "Translates must have three coordinates (x, y, and z).");
		}
	}
	void Translate(T)(GL gl, T x, T y, T z) {
		static if(!isFloatingPointType!(T)) {
			return checkedCall(gl, "Translate", fp_glTranslated, cast(double)cast(real)x, cast(double)cast(real)y, cast(double)cast(real)z);
		} else {
			return checkedCall(gl, "Translate", mixin("fp_glTranslate" ~ T.stringof[0]), x, y, z);
		}
		}

	void Vertex(V)(GL gl, V vec) {
		static if(is(typeof(V.x))) {
			static if(is(typeof(V.y))) {
				static if(is(typeof(V.z))) {
					static if(is(typeof(V.w))) {
						return checkedCall(gl, "Vertex", mixin("fp_glVertex4" ~ typeof(V.x).stringof[0]), vec.x, vec.y, vec.z, vec.w);
					} else {
						return checkedCall(gl, "Vertex", mixin("fp_glVertex3" ~ typeof(V.x).stringof[0]), vec.x, vec.y, vec.z);
					}
				} else {
					return checkedCall(gl, "Vertex", mixin("fp_glVertex2" ~ typeof(V.x).stringof[0]), vec.x, vec.y);
				}
			} else {
				static assert(false, "Vertexes must have at least two coordinates (x and y).");
			}
		} else {
			static assert(false, "Vertexes must have at least two coordinates (x and y).");
		}
	}
	void Vertex(A...)(GL gl, A a) {
		static assert(a.length > 1 && a.length < 5, "Vertexes have at least 2 and at most 4 coordinates.");
		return checkedCall(gl, "Vertex", mixin("fp_glVertex" ~ fmtLong(A.length) ~ A[0].stringof[0]), toTStuple!(A[0], A)(a).tupleof);
	}

	void Normal(V)(GL gl, V vec) {
		pragma(msg, "foo");
		static if(is(typeof(V.x)) && is(typeof(V.y)) && is(typeof(V.z))) {
			return checkedCall(gl, "Normal", mixin("fp_glNormal3" ~ typeof(V.x).stringof[0]), vec.x, vec.y, vec.z);
		} else {
			static assert(false, "Normals must have three coordinates (x, y, and z).");
		}
	}
	void Normal(T)(GL gl, T x, T y, T z) {
		return checkedCall(gl, "Normal", mixin("fp_glNormal3" ~ T.stringof[0]), x, y, z);
	}

	void Index(T)(GL gl, T arg) {
		static char[] type = T.stringof[0] == 'u' ? T.stringof[0..2] : T.stringof[0..1];
		return checkedCall(gl, "Index", mixin("fp_glIndex" ~ type), arg);
	}

	void Color(V)(GL gl, V vec) {
		static if(is(typeof(V.r)) && is(typeof(V.g)) && is(typeof(V.b))) {
			const char[] type = typeof(V.r).stringof[0] == 'u' ? typeof(V.r).stringof[0..2] : typeof(V.r).stringof[0..1];
			static if(is(typeof(V.a))) {
				return checkedCall(gl, "Color", mixin("fp_glColor4" ~ type), vec.r, vec.g, vec.b, vec.a);
			} else {
				return checkedCall(gl, "Color", mixin("fp_glColor3" ~ type), vec.r, vec.g, vec.b);
			}
		} else {
			static assert(false, "Colors must have at least three coordinates (r and g).");
		}
	}
	void Color(A...)(GL gl, A a) {
		static assert(a.length > 2 && a.length < 5, "Colors have at least 3 and at most 4 coordinates.");
		static if(!isFloatingPointType!(A[0])) {
			return checkedCall(gl, "Color", mixin("fp_glColor" ~ fmtLong(A.length) ~ "d"), toTStuple!(double, Repeat!(real, A.length))(toTStuple!(real, A)(a).tupleof).tupleof);
		} else {
			return checkedCall(gl, "Color", mixin("fp_glColor" ~ fmtLong(A.length) ~ A[0].stringof[0]), toTStuple!(float, A)(a).tupleof);
		}
	}

	void TexCoord(V)(GL gl, V vec) {
		static if(isIntegerType!(V) || isFloatingPointType!(V)) {
			return checkedCall(gl, "TexCoord", mixin("fp_glTexCoord1" ~ V.stringof[0]), vec);
		} else static if(is(typeof(V.x))) {
			static if(is(typeof(V.y))) {
				static if(is(typeof(V.z))) {
					static if(is(typeof(V.w))) {
						return checkedCall(gl, "TexCoord", mixin("fp_glTexCoord4" ~ typeof(V.x).stringof[0]), vec.x, vec.y, vec.z, vec.w);
					} else
						return checkedCall(gl, "TexCoord", mixin("fp_glTexCoord3" ~ typeof(V.x).stringof[0]), vec.x, vec.y, vec.z);
				} else
					return checkedCall(gl, "TexCoord", mixin("fp_glTexCoord2" ~ typeof(V.x).stringof[0]), vec.x, vec.y);
			} else
				return checkedCall(gl, "TexCoord", mixin("fp_glTexCoord1" ~ typeof(V.x).stringof[0]), vec.x);
		} else
			static assert(false, "TexCoords must have at least one coordinate (x).");
	}
	void TexCoord(A...)(GL gl, A a) {
		static assert(a.length < 5, "TexCoords have at least 1 and at most 4 coordinates.");
		return checkedCall(gl, "TexCoord", mixin("fp_glTexCoord" ~ fmtLong(A.length) ~ A[0].stringof[0]), toTStuple!(A[0], A)(a).tupleof);
	}

	void RasterPos(V)(GL gl, V vec) {
		static if(is(typeof(V.x))) {
			static if(is(typeof(V.y))) {
				static if(is(typeof(V.z))) {
					static if(is(typeof(V.w))) {
						return checkedCall(gl, "RasterPos", mixin("fp_glRasterPos4" ~ typeof(V.x).stringof[0]), vec.x, vec.y, vec.z, vec.w);
					} else
						return checkedCall(gl, "RasterPos", mixin("fp_glRasterPos3" ~ typeof(V.x).stringof[0]), vec.x, vec.y, vec.z);
				} else
					return checkedCall(gl, "RasterPos", mixin("fp_glRasterPos2" ~ typeof(V.x).stringof[0]), vec.x, vec.y);
			} else
				return checkedCall(gl, "RasterPos", mixin("fp_glRasterPos1" ~ typeof(V.x).stringof[0]), vec.x);
		} else
			static assert(false, "RasterPoss must have at least one coordinate (x).");
	}
	void RasterPos(A...)(GL gl, A a) {
		static assert(a.length > 1 && a.length < 5, "RasterPoss have at least 1 and at most 4 coordinates.");
		return checkedCall(gl, "RasterPos", mixin("fp_glRasterPos" ~ fmtLong(A.length) ~ A[0].stringof[0]), toTStuple!(A[0], A)(a).tupleof);
	}

	void Light(T)(GL gl, GLenum light, GLenum pname, T param) {
		static if(isArray!(T))
			return checkedCall(gl, "Light", mixin("fp_glLight" ~ T.stringof[0] ~ "v"), light, pname, param.ptr);
		else
			return checkedCall(gl, "Light", mixin("fp_glLight" ~ T.stringof[0]), light, pname, param);
	}

	void LightModel(T)(GL gl, GLenum pname, T param) {
		static if(isArray!(T))
			return checkedCall(gl, "LightModel", mixin("fp_glLightModel" ~ T.stringof[0] ~ "v"), pname, param.ptr);
		else
			return checkedCall(gl, "LightModel", mixin("fp_glLightModel" ~ T.stringof[0]), pname, param);
	}

	void Material(T)(GL gl, GLenum face, GLenum pname, T param) {
		static if(isArray!(T))
			return checkedCall(gl, "Material", mixin("fp_glMaterial" ~ T.stringof[0] ~ "v"), face, pname, param.ptr);
		else
			return checkedCall(gl, "Material", mixin("fp_glMaterial" ~ T.stringof[0]), face, pname, param);
	}

	void PixelStore(T)(GL gl, GLenum pname, T param) {
		return checkedCall(gl, "PixelStore", mixin("fp_glPixelStore" ~ T.stringof[0]), pname, param);
	}

	void PixelTransfer(T)(GL gl, GLenum pname, T param) {
		return checkedCall(gl, "PixelTransfer", mixin("fp_glPixelTransfer" ~ T.stringof[0]), pname, param);
	}

	void PixelMap(T : T[])(GL gl, GLenum map, T[] values) {
		static char[] type = T.stringof[0] == 'u' ? T.stringof[0..2] : T.stringof[0..1];
		return checkedCall(gl, "PixelMap", mixin("fp_glPixelMap" ~ type ~ "v"), map, values.length, values.ptr);
	}

	void TexGen(T)(GL gl, GLenum coord, GLenum pname, T param) {
		static if(isArray!(T))
			return checkedCall(gl, "TexGen", mixin("fp_glTexGen" ~ T.stringof[0] ~ "v"), coord, pname, param.ptr);
		else
			return checkedCall(gl, "TexGen", mixin("fp_glTexGen" ~ T.stringof[0]), coord, pname, param);
	}

	void TexEnv(T)(GL gl, GLenum target, GLenum pname, T param) {
		static if(isArray!(T))
			return checkedCall(gl, "TexEnv", mixin("fp_glTexEnv" ~ T.stringof[0] ~ "v"), target, pname, param.ptr);
		else
			return checkedCall(gl, "TexEnv", mixin("fp_glTexEnv" ~ T.stringof[0]), target, pname, param);
	}

	void TexParameter(T)(GL gl, GLenum target, GLenum pname, T param) {
		static if(isArray!(T))
			return checkedCall(gl, "TexParameter", mixin("fp_glTexParameter" ~ T.stringof[0] ~ "v"), target, pname, param.ptr);
		else
			return checkedCall(gl, "TexParameter", mixin("fp_glTexParameter" ~ T.stringof[0]), target, pname, param);
	}

	// Mapping stuff skipped for now
	
	void Fog(T)(GL gl, GLenum pname, T param) {
		static if(isArray!(T))
			return checkedCall(gl, "Fog", mixin("fp_glFog" ~ T.stringof[0] ~ "v"), pname, param.ptr);
		else
			return checkedCall(gl, "Fog", mixin("fp_glFog" ~ T.stringof[0]), pname, param);
	}
	
		
	// Specific
	void ClearIndex(GL gl, ParameterTupleOf!(fp_glClearIndex) params__) {
		return checkedCall(gl, "ClearIndex", fp_glClearIndex, params__);
	}
	void ClearColor(GL gl, ParameterTupleOf!(fp_glClearColor) params__) {
		return checkedCall(gl, "ClearColor", fp_glClearColor, params__);
	}
	void Clear(GL gl, ParameterTupleOf!(fp_glClear) params__) {
		return checkedCall(gl, "Clear", fp_glClear, params__);
	}
	void IndexMask(GL gl, ParameterTupleOf!(fp_glIndexMask) params__) {
		return checkedCall(gl, "IndexMask", fp_glIndexMask, params__);
	}
	void ColorMask(GL gl, ParameterTupleOf!(fp_glColorMask) params__) {
		return checkedCall(gl, "ColorMask", fp_glColorMask, params__);
	}
	void AlphaFunc(GL gl, ParameterTupleOf!(fp_glAlphaFunc) params__) {
		return checkedCall(gl, "AlphaFunc", fp_glAlphaFunc, params__);
	}
	void BlendFunc(GL gl, ParameterTupleOf!(fp_glBlendFunc) params__) {
		return checkedCall(gl, "BlendFunc", fp_glBlendFunc, params__);
	}
	void LogicOp(GL gl, ParameterTupleOf!(fp_glLogicOp) params__) {
		return checkedCall(gl, "LogicOp", fp_glLogicOp, params__);
	}
	void CullFace(GL gl, ParameterTupleOf!(fp_glCullFace) params__) {
		return checkedCall(gl, "CullFace", fp_glCullFace, params__);
	}
	void FrontFace(GL gl, ParameterTupleOf!(fp_glFrontFace) params__) {
		return checkedCall(gl, "FrontFace", fp_glFrontFace, params__);
	}
	void PointSize(GL gl, ParameterTupleOf!(fp_glPointSize) params__) {
		return checkedCall(gl, "PointSize", fp_glPointSize, params__);
	}
	void LineWidth(GL gl, ParameterTupleOf!(fp_glLineWidth) params__) {
		return checkedCall(gl, "LineWidth", fp_glLineWidth, params__);
	}
	void LineStipple(GL gl, ParameterTupleOf!(fp_glLineStipple) params__) {
		return checkedCall(gl, "LineStipple", fp_glLineStipple, params__);
	}
	void PolygonMode(GL gl, ParameterTupleOf!(fp_glPolygonMode) params__) {
		return checkedCall(gl, "PolygonMode", fp_glPolygonMode, params__);
	}
	void PolygonOffset(GL gl, ParameterTupleOf!(fp_glPolygonOffset) params__) {
		return checkedCall(gl, "PolygonOffset", fp_glPolygonOffset, params__);
	}
	void PolygonStipple(GL gl, ParameterTupleOf!(fp_glPolygonStipple) params__) {
		return checkedCall(gl, "PolygonStipple", fp_glPolygonStipple, params__);
	}
	void GetPolygonStipple(GL gl, ParameterTupleOf!(fp_glGetPolygonStipple) params__) {
		return checkedCall(gl, "GetPolygonStipple", fp_glGetPolygonStipple, params__);
	}
	void EdgeFlag(GL gl, ParameterTupleOf!(fp_glEdgeFlag) params__) {
		return checkedCall(gl, "EdgeFlag", fp_glEdgeFlag, params__);
	}
	void EdgeFlagv(GL gl, ParameterTupleOf!(fp_glEdgeFlagv) params__) {
		return checkedCall(gl, "EdgeFlagv", fp_glEdgeFlagv, params__);
	}
	void Scissor(GL gl, ParameterTupleOf!(fp_glScissor) params__) {
		return checkedCall(gl, "Scissor", fp_glScissor, params__);
	}
	void ClipPlane(GL gl, ParameterTupleOf!(fp_glClipPlane) params__) {
		return checkedCall(gl, "ClipPlane", fp_glClipPlane, params__);
	}
	void GetClipPlane(GL gl, ParameterTupleOf!(fp_glGetClipPlane) params__) {
		return checkedCall(gl, "GetClipPlane", fp_glGetClipPlane, params__);
	}
	void DrawBuffer(GL gl, ParameterTupleOf!(fp_glDrawBuffer) params__) {
		return checkedCall(gl, "DrawBuffer", fp_glDrawBuffer, params__);
	}
	void ReadBuffer(GL gl, ParameterTupleOf!(fp_glReadBuffer) params__) {
		return checkedCall(gl, "ReadBuffer", fp_glReadBuffer, params__);
	}
	void Enable(GL gl, ParameterTupleOf!(fp_glEnable) params__) {
		return checkedCall(gl, "Enable", fp_glEnable, params__);
	}
	void Disable(GL gl, ParameterTupleOf!(fp_glDisable) params__) {
		return checkedCall(gl, "Disable", fp_glDisable, params__);
	}
	GLboolean IsEnabled(GL gl, ParameterTupleOf!(fp_glIsEnabled) params__) {
		return checkedCall(gl, "IsEnabled", fp_glIsEnabled, params__);
	}
	void EnableClientState(GL gl, ParameterTupleOf!(fp_glEnableClientState) params__) {
		return checkedCall(gl, "EnableClientState", fp_glEnableClientState, params__);
	}
	void DisableClientState(GL gl, ParameterTupleOf!(fp_glDisableClientState) params__) {
		return checkedCall(gl, "DisableClientState", fp_glDisableClientState, params__);
	}
	void GetBooleanv(GL gl, ParameterTupleOf!(fp_glGetBooleanv) params__) {
		return checkedCall(gl, "GetBooleanv", fp_glGetBooleanv, params__);
	}
	void GetDoublev(GL gl, ParameterTupleOf!(fp_glGetDoublev) params__) {
		return checkedCall(gl, "GetDoublev", fp_glGetDoublev, params__);
	}
	void GetFloatv(GL gl, ParameterTupleOf!(fp_glGetFloatv) params__) {
		return checkedCall(gl, "GetFloatv", fp_glGetFloatv, params__);
	}
	void GetIntegerv(GL gl, ParameterTupleOf!(fp_glGetIntegerv) params__) {
		return checkedCall(gl, "GetIntegerv", fp_glGetIntegerv, params__);
	}
	void PushAttrib(GL gl, ParameterTupleOf!(fp_glPushAttrib) params__) {
		return checkedCall(gl, "PushAttrib", fp_glPushAttrib, params__);
	}
	void PopAttrib(GL gl, ParameterTupleOf!(fp_glPopAttrib) params__) {
		return checkedCall(gl, "PopAttrib", fp_glPopAttrib, params__);
	}
	void PushClientAttrib(GL gl, ParameterTupleOf!(fp_glPushClientAttrib) params__) {
		return checkedCall(gl, "PushClientAttrib", fp_glPushClientAttrib, params__);
	}
	void PopClientAttrib(GL gl, ParameterTupleOf!(fp_glPopClientAttrib) params__) {
		return checkedCall(gl, "PopClientAttrib", fp_glPopClientAttrib, params__);
	}
	GLint RenderMode(GL gl, ParameterTupleOf!(fp_glRenderMode) params__) {
		return checkedCall(gl, "RenderMode", fp_glRenderMode, params__);
	}
	GLchar* GetString(GL gl, ParameterTupleOf!(fp_glGetString) params__) {
		return checkedCall(gl, "GetString", fp_glGetString, params__);
	}
	void Finish(GL gl, ParameterTupleOf!(fp_glFinish) params__) {
		return checkedCall(gl, "Finish", fp_glFinish, params__);
	}
	void Flush(GL gl, ParameterTupleOf!(fp_glFlush) params__) {
		return checkedCall(gl, "Flush", fp_glFlush, params__);
	}
	void Hint(GL gl, ParameterTupleOf!(fp_glHint) params__) {
		return checkedCall(gl, "Hint", fp_glHint, params__);
	}


	void ClearDepth(GL gl, ParameterTupleOf!(fp_glClearDepth) params__) {
		return checkedCall(gl, "ClearDepth", fp_glClearDepth, params__);
	}
	void DepthFunc(GL gl, ParameterTupleOf!(fp_glDepthFunc) params__) {
		return checkedCall(gl, "DepthFunc", fp_glDepthFunc, params__);
	}
	void DepthMask(GL gl, ParameterTupleOf!(fp_glDepthMask) params__) {
		return checkedCall(gl, "DepthMask", fp_glDepthMask, params__);
	}
	void DepthRange(GL gl, ParameterTupleOf!(fp_glDepthRange) params__) {
		return checkedCall(gl, "DepthRange", fp_glDepthRange, params__);
	}

	void ClearAccum(GL gl, ParameterTupleOf!(fp_glClearAccum) params__) {
		return checkedCall(gl, "ClearAccum", fp_glClearAccum, params__);
	}
	void Accum(GL gl, ParameterTupleOf!(fp_glAccum) params__) {
		return checkedCall(gl, "Accum", fp_glAccum, params__);
	}

	void MatrixMode(GL gl, ParameterTupleOf!(fp_glMatrixMode) params__) {
		return checkedCall(gl, "MatrixMode", fp_glMatrixMode, params__);
	}
	void Ortho(GL gl, ParameterTupleOf!(fp_glOrtho) params__) {
		return checkedCall(gl, "Ortho", fp_glOrtho, params__);
	}
	void Frustum(GL gl, ParameterTupleOf!(fp_glFrustum) params__) {
		return checkedCall(gl, "Frustum", fp_glFrustum, params__);
	}
	void Viewport(GL gl, ParameterTupleOf!(fp_glViewport) params__) {
		return checkedCall(gl, "Viewport", fp_glViewport, params__);
	}
	void PushMatrix(GL gl, ParameterTupleOf!(fp_glPushMatrix) params__) {
		return checkedCall(gl, "PushMatrix", fp_glPushMatrix, params__);
	}
	void PopMatrix(GL gl, ParameterTupleOf!(fp_glPopMatrix) params__) {
		return checkedCall(gl, "PopMatrix", fp_glPopMatrix, params__);
	}
	void LoadIdentity(GL gl, ParameterTupleOf!(fp_glLoadIdentity) params__) {
		return checkedCall(gl, "LoadIdentity", fp_glLoadIdentity, params__);
	}
	void LoadMatrixd(GL gl, ParameterTupleOf!(fp_glLoadMatrixd) params__) {
		return checkedCall(gl, "LoadMatrixd", fp_glLoadMatrixd, params__);
	}
	void LoadMatrixf(GL gl, ParameterTupleOf!(fp_glLoadMatrixf) params__) {
		return checkedCall(gl, "LoadMatrixf", fp_glLoadMatrixf, params__);
	}
	void MultMatrixd(GL gl, ParameterTupleOf!(fp_glMultMatrixd) params__) {
		return checkedCall(gl, "MultMatrixd", fp_glMultMatrixd, params__);
	}
	void MultMatrixf(GL gl, ParameterTupleOf!(fp_glMultMatrixf) params__) {
		return checkedCall(gl, "MultMatrixf", fp_glMultMatrixf, params__);
	}
	void Rotated(GL gl, ParameterTupleOf!(fp_glRotated) params__) {
		return checkedCall(gl, "Rotated", fp_glRotated, params__);
	}
	void Rotatef(GL gl, ParameterTupleOf!(fp_glRotatef) params__) {
		return checkedCall(gl, "Rotatef", fp_glRotatef, params__);
	}
	void Scaled(GL gl, ParameterTupleOf!(fp_glScaled) params__) {
		return checkedCall(gl, "Scaled", fp_glScaled, params__);
	}
	void Scalef(GL gl, ParameterTupleOf!(fp_glScalef) params__) {
		return checkedCall(gl, "Scalef", fp_glScalef, params__);
	}
	void Translated(GL gl, ParameterTupleOf!(fp_glTranslated) params__) {
		return checkedCall(gl, "Translated", fp_glTranslated, params__);
	}
	void Translatef(GL gl, ParameterTupleOf!(fp_glTranslatef) params__) {
		return checkedCall(gl, "Translatef", fp_glTranslatef, params__);
	}

	GLboolean IsList(GL gl, ParameterTupleOf!(fp_glIsList) params__) {
		return checkedCall(gl, "IsList", fp_glIsList, params__);
	}
	void DeleteLists(GL gl, ParameterTupleOf!(fp_glDeleteLists) params__) {
		return checkedCall(gl, "DeleteLists", fp_glDeleteLists, params__);
	}
	GLuint GenLists(GL gl, ParameterTupleOf!(fp_glGenLists) params__) {
		return checkedCall(gl, "GenLists", fp_glGenLists, params__);
	}
	void NewList(GL gl, ParameterTupleOf!(fp_glNewList) params__) {
		return checkedCall(gl, "NewList", fp_glNewList, params__);
	}
	void EndList(GL gl, ParameterTupleOf!(fp_glEndList) params__) {
		return checkedCall(gl, "EndList", fp_glEndList, params__);
	}
	void CallList(GL gl, ParameterTupleOf!(fp_glCallList) params__) {
		return checkedCall(gl, "CallList", fp_glCallList, params__);
	}
	void CallLists(GL gl, ParameterTupleOf!(fp_glCallLists) params__) {
		return checkedCall(gl, "CallLists", fp_glCallLists, params__);
	}
	void ListBase(GL gl, ParameterTupleOf!(fp_glListBase) params__) {
		return checkedCall(gl, "ListBase", fp_glListBase, params__);
	}

	void Begin(GL gl, ParameterTupleOf!(fp_glBegin) params__) {
		_getGL(gl).insideGlBegin = true;
		return checkedCall(gl, "Begin", fp_glBegin, params__);
	}
	void End(GL gl, ParameterTupleOf!(fp_glEnd) params__) {
		_getGL(gl).insideGlBegin = false;
		return checkedCall(gl, "End", fp_glEnd, params__);
	}
	void Vertex2d(GL gl, ParameterTupleOf!(fp_glVertex2d) params__) {
		return checkedCall(gl, "Vertex2d", fp_glVertex2d, params__);
	}
	void Vertex2f(GL gl, ParameterTupleOf!(fp_glVertex2f) params__) {
		return checkedCall(gl, "Vertex2f", fp_glVertex2f, params__);
	}
	void Vertex2i(GL gl, ParameterTupleOf!(fp_glVertex2i) params__) {
		return checkedCall(gl, "Vertex2i", fp_glVertex2i, params__);
	}
	void Vertex2s(GL gl, ParameterTupleOf!(fp_glVertex2s) params__) {
		return checkedCall(gl, "Vertex2s", fp_glVertex2s, params__);
	}
	void Vertex3d(GL gl, ParameterTupleOf!(fp_glVertex3d) params__) {
		return checkedCall(gl, "Vertex3d", fp_glVertex3d, params__);
	}
	void Vertex3f(GL gl, ParameterTupleOf!(fp_glVertex3f) params__) {
		return checkedCall(gl, "Vertex3f", fp_glVertex3f, params__);
	}
	void Vertex3i(GL gl, ParameterTupleOf!(fp_glVertex3i) params__) {
		return checkedCall(gl, "Vertex3i", fp_glVertex3i, params__);
	}
	void Vertex3s(GL gl, ParameterTupleOf!(fp_glVertex3s) params__) {
		return checkedCall(gl, "Vertex3s", fp_glVertex3s, params__);
	}
	void Vertex4d(GL gl, ParameterTupleOf!(fp_glVertex4d) params__) {
		return checkedCall(gl, "Vertex4d", fp_glVertex4d, params__);
	}
	void Vertex4f(GL gl, ParameterTupleOf!(fp_glVertex4f) params__) {
		return checkedCall(gl, "Vertex4f", fp_glVertex4f, params__);
	}
	void Vertex4i(GL gl, ParameterTupleOf!(fp_glVertex4i) params__) {
		return checkedCall(gl, "Vertex4i", fp_glVertex4i, params__);
	}
	void Vertex4s(GL gl, ParameterTupleOf!(fp_glVertex4s) params__) {
		return checkedCall(gl, "Vertex4s", fp_glVertex4s, params__);
	}
	void Vertex2dv(GL gl, ParameterTupleOf!(fp_glVertex2dv) params__) {
		return checkedCall(gl, "Vertex2dv", fp_glVertex2dv, params__);
	}
	void Vertex2fv(GL gl, ParameterTupleOf!(fp_glVertex2fv) params__) {
		return checkedCall(gl, "Vertex2fv", fp_glVertex2fv, params__);
	}
	void Vertex2iv(GL gl, ParameterTupleOf!(fp_glVertex2iv) params__) {
		return checkedCall(gl, "Vertex2iv", fp_glVertex2iv, params__);
	}
	void Vertex2sv(GL gl, ParameterTupleOf!(fp_glVertex2sv) params__) {
		return checkedCall(gl, "Vertex2sv", fp_glVertex2sv, params__);
	}
	void Vertex3dv(GL gl, ParameterTupleOf!(fp_glVertex3dv) params__) {
		return checkedCall(gl, "Vertex3dv", fp_glVertex3dv, params__);
	}
	void Vertex3fv(GL gl, ParameterTupleOf!(fp_glVertex3fv) params__) {
		return checkedCall(gl, "Vertex3fv", fp_glVertex3fv, params__);
	}
	void Vertex3iv(GL gl, ParameterTupleOf!(fp_glVertex3iv) params__) {
		return checkedCall(gl, "Vertex3iv", fp_glVertex3iv, params__);
	}
	void Vertex3sv(GL gl, ParameterTupleOf!(fp_glVertex3sv) params__) {
		return checkedCall(gl, "Vertex3sv", fp_glVertex3sv, params__);
	}
	void Vertex4dv(GL gl, ParameterTupleOf!(fp_glVertex4dv) params__) {
		return checkedCall(gl, "Vertex4dv", fp_glVertex4dv, params__);
	}
	void Vertex4fv(GL gl, ParameterTupleOf!(fp_glVertex4fv) params__) {
		return checkedCall(gl, "Vertex4fv", fp_glVertex4fv, params__);
	}
	void Vertex4iv(GL gl, ParameterTupleOf!(fp_glVertex4iv) params__) {
		return checkedCall(gl, "Vertex4iv", fp_glVertex4iv, params__);
	}
	void Vertex4sv(GL gl, ParameterTupleOf!(fp_glVertex4sv) params__) {
		return checkedCall(gl, "Vertex4sv", fp_glVertex4sv, params__);
	}
	void Normal3b(GL gl, ParameterTupleOf!(fp_glNormal3b) params__) {
		return checkedCall(gl, "Normal3b", fp_glNormal3b, params__);
	}
	void Normal3d(GL gl, ParameterTupleOf!(fp_glNormal3d) params__) {
		return checkedCall(gl, "Normal3d", fp_glNormal3d, params__);
	}
	void Normal3f(GL gl, ParameterTupleOf!(fp_glNormal3f) params__) {
		return checkedCall(gl, "Normal3f", fp_glNormal3f, params__);
	}
	void Normal3i(GL gl, ParameterTupleOf!(fp_glNormal3i) params__) {
		return checkedCall(gl, "Normal3i", fp_glNormal3i, params__);
	}
	void Normal3s(GL gl, ParameterTupleOf!(fp_glNormal3s) params__) {
		return checkedCall(gl, "Normal3s", fp_glNormal3s, params__);
	}
	void Normal3bv(GL gl, ParameterTupleOf!(fp_glNormal3bv) params__) {
		return checkedCall(gl, "Normal3bv", fp_glNormal3bv, params__);
	}
	void Normal3dv(GL gl, ParameterTupleOf!(fp_glNormal3dv) params__) {
		return checkedCall(gl, "Normal3dv", fp_glNormal3dv, params__);
	}
	void Normal3fv(GL gl, ParameterTupleOf!(fp_glNormal3fv) params__) {
		return checkedCall(gl, "Normal3fv", fp_glNormal3fv, params__);
	}
	void Normal3iv(GL gl, ParameterTupleOf!(fp_glNormal3iv) params__) {
		return checkedCall(gl, "Normal3iv", fp_glNormal3iv, params__);
	}
	void Normal3sv(GL gl, ParameterTupleOf!(fp_glNormal3sv) params__) {
		return checkedCall(gl, "Normal3sv", fp_glNormal3sv, params__);
	}
	void Indexd(GL gl, ParameterTupleOf!(fp_glIndexd) params__) {
		return checkedCall(gl, "Indexd", fp_glIndexd, params__);
	}
	void Indexf(GL gl, ParameterTupleOf!(fp_glIndexf) params__) {
		return checkedCall(gl, "Indexf", fp_glIndexf, params__);
	}
	void Indexi(GL gl, ParameterTupleOf!(fp_glIndexi) params__) {
		return checkedCall(gl, "Indexi", fp_glIndexi, params__);
	}
	void Indexs(GL gl, ParameterTupleOf!(fp_glIndexs) params__) {
		return checkedCall(gl, "Indexs", fp_glIndexs, params__);
	}
	void Indexub(GL gl, ParameterTupleOf!(fp_glIndexub) params__) {
		return checkedCall(gl, "Indexub", fp_glIndexub, params__);
	}
	void Indexdv(GL gl, ParameterTupleOf!(fp_glIndexdv) params__) {
		return checkedCall(gl, "Indexdv", fp_glIndexdv, params__);
	}
	void Indexfv(GL gl, ParameterTupleOf!(fp_glIndexfv) params__) {
		return checkedCall(gl, "Indexfv", fp_glIndexfv, params__);
	}
	void Indexiv(GL gl, ParameterTupleOf!(fp_glIndexiv) params__) {
		return checkedCall(gl, "Indexiv", fp_glIndexiv, params__);
	}
	void Indexsv(GL gl, ParameterTupleOf!(fp_glIndexsv) params__) {
		return checkedCall(gl, "Indexsv", fp_glIndexsv, params__);
	}
	void Indexubv(GL gl, ParameterTupleOf!(fp_glIndexubv) params__) {
		return checkedCall(gl, "Indexubv", fp_glIndexubv, params__);
	}
	void Color3b(GL gl, ParameterTupleOf!(fp_glColor3b) params__) {
		return checkedCall(gl, "Color3b", fp_glColor3b, params__);
	}
	void Color3d(GL gl, ParameterTupleOf!(fp_glColor3d) params__) {
		return checkedCall(gl, "Color3d", fp_glColor3d, params__);
	}
	void Color3f(GL gl, ParameterTupleOf!(fp_glColor3f) params__) {
		return checkedCall(gl, "Color3f", fp_glColor3f, params__);
	}
	void Color3i(GL gl, ParameterTupleOf!(fp_glColor3i) params__) {
		return checkedCall(gl, "Color3i", fp_glColor3i, params__);
	}
	void Color3s(GL gl, ParameterTupleOf!(fp_glColor3s) params__) {
		return checkedCall(gl, "Color3s", fp_glColor3s, params__);
	}
	void Color3ub(GL gl, ParameterTupleOf!(fp_glColor3ub) params__) {
		return checkedCall(gl, "Color3ub", fp_glColor3ub, params__);
	}
	void Color3ui(GL gl, ParameterTupleOf!(fp_glColor3ui) params__) {
		return checkedCall(gl, "Color3ui", fp_glColor3ui, params__);
	}
	void Color3us(GL gl, ParameterTupleOf!(fp_glColor3us) params__) {
		return checkedCall(gl, "Color3us", fp_glColor3us, params__);
	}
	void Color4b(GL gl, ParameterTupleOf!(fp_glColor4b) params__) {
		return checkedCall(gl, "Color4b", fp_glColor4b, params__);
	}
	void Color4d(GL gl, ParameterTupleOf!(fp_glColor4d) params__) {
		return checkedCall(gl, "Color4d", fp_glColor4d, params__);
	}
	void Color4f(GL gl, ParameterTupleOf!(fp_glColor4f) params__) {
		return checkedCall(gl, "Color4f", fp_glColor4f, params__);
	}
	void Color4i(GL gl, ParameterTupleOf!(fp_glColor4i) params__) {
		return checkedCall(gl, "Color4i", fp_glColor4i, params__);
	}
	void Color4s(GL gl, ParameterTupleOf!(fp_glColor4s) params__) {
		return checkedCall(gl, "Color4s", fp_glColor4s, params__);
	}
	void Color4ub(GL gl, ParameterTupleOf!(fp_glColor4ub) params__) {
		return checkedCall(gl, "Color4ub", fp_glColor4ub, params__);
	}
	void Color4ui(GL gl, ParameterTupleOf!(fp_glColor4ui) params__) {
		return checkedCall(gl, "Color4ui", fp_glColor4ui, params__);
	}
	void Color4us(GL gl, ParameterTupleOf!(fp_glColor4us) params__) {
		return checkedCall(gl, "Color4us", fp_glColor4us, params__);
	}
	void Color3bv(GL gl, ParameterTupleOf!(fp_glColor3bv) params__) {
		return checkedCall(gl, "Color3bv", fp_glColor3bv, params__);
	}
	void Color3dv(GL gl, ParameterTupleOf!(fp_glColor3dv) params__) {
		return checkedCall(gl, "Color3dv", fp_glColor3dv, params__);
	}
	void Color3fv(GL gl, ParameterTupleOf!(fp_glColor3fv) params__) {
		return checkedCall(gl, "Color3fv", fp_glColor3fv, params__);
	}
	void Color3iv(GL gl, ParameterTupleOf!(fp_glColor3iv) params__) {
		return checkedCall(gl, "Color3iv", fp_glColor3iv, params__);
	}
	void Color3sv(GL gl, ParameterTupleOf!(fp_glColor3sv) params__) {
		return checkedCall(gl, "Color3sv", fp_glColor3sv, params__);
	}
	void Color3ubv(GL gl, ParameterTupleOf!(fp_glColor3ubv) params__) {
		return checkedCall(gl, "Color3ubv", fp_glColor3ubv, params__);
	}
	void Color3uiv(GL gl, ParameterTupleOf!(fp_glColor3uiv) params__) {
		return checkedCall(gl, "Color3uiv", fp_glColor3uiv, params__);
	}
	void Color3usv(GL gl, ParameterTupleOf!(fp_glColor3usv) params__) {
		return checkedCall(gl, "Color3usv", fp_glColor3usv, params__);
	}
	void Color4bv(GL gl, ParameterTupleOf!(fp_glColor4bv) params__) {
		return checkedCall(gl, "Color4bv", fp_glColor4bv, params__);
	}
	void Color4dv(GL gl, ParameterTupleOf!(fp_glColor4dv) params__) {
		return checkedCall(gl, "Color4dv", fp_glColor4dv, params__);
	}
	void Color4fv(GL gl, ParameterTupleOf!(fp_glColor4fv) params__) {
		return checkedCall(gl, "Color4fv", fp_glColor4fv, params__);
	}
	void Color4iv(GL gl, ParameterTupleOf!(fp_glColor4iv) params__) {
		return checkedCall(gl, "Color4iv", fp_glColor4iv, params__);
	}
	void Color4sv(GL gl, ParameterTupleOf!(fp_glColor4sv) params__) {
		return checkedCall(gl, "Color4sv", fp_glColor4sv, params__);
	}
	void Color4ubv(GL gl, ParameterTupleOf!(fp_glColor4ubv) params__) {
		return checkedCall(gl, "Color4ubv", fp_glColor4ubv, params__);
	}
	void Color4uiv(GL gl, ParameterTupleOf!(fp_glColor4uiv) params__) {
		return checkedCall(gl, "Color4uiv", fp_glColor4uiv, params__);
	}
	void Color4usv(GL gl, ParameterTupleOf!(fp_glColor4usv) params__) {
		return checkedCall(gl, "Color4usv", fp_glColor4usv, params__);
	}
	void TexCoord1d(GL gl, ParameterTupleOf!(fp_glTexCoord1d) params__) {
		return checkedCall(gl, "TexCoord1d", fp_glTexCoord1d, params__);
	}
	void TexCoord1f(GL gl, ParameterTupleOf!(fp_glTexCoord1f) params__) {
		return checkedCall(gl, "TexCoord1f", fp_glTexCoord1f, params__);
	}
	void TexCoord1i(GL gl, ParameterTupleOf!(fp_glTexCoord1i) params__) {
		return checkedCall(gl, "TexCoord1i", fp_glTexCoord1i, params__);
	}
	void TexCoord1s(GL gl, ParameterTupleOf!(fp_glTexCoord1s) params__) {
		return checkedCall(gl, "TexCoord1s", fp_glTexCoord1s, params__);
	}
	void TexCoord2d(GL gl, ParameterTupleOf!(fp_glTexCoord2d) params__) {
		return checkedCall(gl, "TexCoord2d", fp_glTexCoord2d, params__);
	}
	void TexCoord2f(GL gl, ParameterTupleOf!(fp_glTexCoord2f) params__) {
		return checkedCall(gl, "TexCoord2f", fp_glTexCoord2f, params__);
	}
	void TexCoord2i(GL gl, ParameterTupleOf!(fp_glTexCoord2i) params__) {
		return checkedCall(gl, "TexCoord2i", fp_glTexCoord2i, params__);
	}
	void TexCoord2s(GL gl, ParameterTupleOf!(fp_glTexCoord2s) params__) {
		return checkedCall(gl, "TexCoord2s", fp_glTexCoord2s, params__);
	}
	void TexCoord3d(GL gl, ParameterTupleOf!(fp_glTexCoord3d) params__) {
		return checkedCall(gl, "TexCoord3d", fp_glTexCoord3d, params__);
	}
	void TexCoord3f(GL gl, ParameterTupleOf!(fp_glTexCoord3f) params__) {
		return checkedCall(gl, "TexCoord3f", fp_glTexCoord3f, params__);
	}
	void TexCoord3i(GL gl, ParameterTupleOf!(fp_glTexCoord3i) params__) {
		return checkedCall(gl, "TexCoord3i", fp_glTexCoord3i, params__);
	}
	void TexCoord3s(GL gl, ParameterTupleOf!(fp_glTexCoord3s) params__) {
		return checkedCall(gl, "TexCoord3s", fp_glTexCoord3s, params__);
	}
	void TexCoord4d(GL gl, ParameterTupleOf!(fp_glTexCoord4d) params__) {
		return checkedCall(gl, "TexCoord4d", fp_glTexCoord4d, params__);
	}
	void TexCoord4f(GL gl, ParameterTupleOf!(fp_glTexCoord4f) params__) {
		return checkedCall(gl, "TexCoord4f", fp_glTexCoord4f, params__);
	}
	void TexCoord4i(GL gl, ParameterTupleOf!(fp_glTexCoord4i) params__) {
		return checkedCall(gl, "TexCoord4i", fp_glTexCoord4i, params__);
	}
	void TexCoord4s(GL gl, ParameterTupleOf!(fp_glTexCoord4s) params__) {
		return checkedCall(gl, "TexCoord4s", fp_glTexCoord4s, params__);
	}
	void TexCoord1dv(GL gl, ParameterTupleOf!(fp_glTexCoord1dv) params__) {
		return checkedCall(gl, "TexCoord1dv", fp_glTexCoord1dv, params__);
	}
	void TexCoord1fv(GL gl, ParameterTupleOf!(fp_glTexCoord1fv) params__) {
		return checkedCall(gl, "TexCoord1fv", fp_glTexCoord1fv, params__);
	}
	void TexCoord1iv(GL gl, ParameterTupleOf!(fp_glTexCoord1iv) params__) {
		return checkedCall(gl, "TexCoord1iv", fp_glTexCoord1iv, params__);
	}
	void TexCoord1sv(GL gl, ParameterTupleOf!(fp_glTexCoord1sv) params__) {
		return checkedCall(gl, "TexCoord1sv", fp_glTexCoord1sv, params__);
	}
	void TexCoord2dv(GL gl, ParameterTupleOf!(fp_glTexCoord2dv) params__) {
		return checkedCall(gl, "TexCoord2dv", fp_glTexCoord2dv, params__);
	}
	void TexCoord2fv(GL gl, ParameterTupleOf!(fp_glTexCoord2fv) params__) {
		return checkedCall(gl, "TexCoord2fv", fp_glTexCoord2fv, params__);
	}
	void TexCoord2iv(GL gl, ParameterTupleOf!(fp_glTexCoord2iv) params__) {
		return checkedCall(gl, "TexCoord2iv", fp_glTexCoord2iv, params__);
	}
	void TexCoord2sv(GL gl, ParameterTupleOf!(fp_glTexCoord2sv) params__) {
		return checkedCall(gl, "TexCoord2sv", fp_glTexCoord2sv, params__);
	}
	void TexCoord3dv(GL gl, ParameterTupleOf!(fp_glTexCoord3dv) params__) {
		return checkedCall(gl, "TexCoord3dv", fp_glTexCoord3dv, params__);
	}
	void TexCoord3fv(GL gl, ParameterTupleOf!(fp_glTexCoord3fv) params__) {
		return checkedCall(gl, "TexCoord3fv", fp_glTexCoord3fv, params__);
	}
	void TexCoord3iv(GL gl, ParameterTupleOf!(fp_glTexCoord3iv) params__) {
		return checkedCall(gl, "TexCoord3iv", fp_glTexCoord3iv, params__);
	}
	void TexCoord3sv(GL gl, ParameterTupleOf!(fp_glTexCoord3sv) params__) {
		return checkedCall(gl, "TexCoord3sv", fp_glTexCoord3sv, params__);
	}
	void TexCoord4dv(GL gl, ParameterTupleOf!(fp_glTexCoord4dv) params__) {
		return checkedCall(gl, "TexCoord4dv", fp_glTexCoord4dv, params__);
	}
	void TexCoord4fv(GL gl, ParameterTupleOf!(fp_glTexCoord4fv) params__) {
		return checkedCall(gl, "TexCoord4fv", fp_glTexCoord4fv, params__);
	}
	void TexCoord4iv(GL gl, ParameterTupleOf!(fp_glTexCoord4iv) params__) {
		return checkedCall(gl, "TexCoord4iv", fp_glTexCoord4iv, params__);
	}
	void TexCoord4sv(GL gl, ParameterTupleOf!(fp_glTexCoord4sv) params__) {
		return checkedCall(gl, "TexCoord4sv", fp_glTexCoord4sv, params__);
	}
	void RasterPos2d(GL gl, ParameterTupleOf!(fp_glRasterPos2d) params__) {
		return checkedCall(gl, "RasterPos2d", fp_glRasterPos2d, params__);
	}
	void RasterPos2f(GL gl, ParameterTupleOf!(fp_glRasterPos2f) params__) {
		return checkedCall(gl, "RasterPos2f", fp_glRasterPos2f, params__);
	}
	void RasterPos2i(GL gl, ParameterTupleOf!(fp_glRasterPos2i) params__) {
		return checkedCall(gl, "RasterPos2i", fp_glRasterPos2i, params__);
	}
	void RasterPos2s(GL gl, ParameterTupleOf!(fp_glRasterPos2s) params__) {
		return checkedCall(gl, "RasterPos2s", fp_glRasterPos2s, params__);
	}
	void RasterPos3d(GL gl, ParameterTupleOf!(fp_glRasterPos3d) params__) {
		return checkedCall(gl, "RasterPos3d", fp_glRasterPos3d, params__);
	}
	void RasterPos3f(GL gl, ParameterTupleOf!(fp_glRasterPos3f) params__) {
		return checkedCall(gl, "RasterPos3f", fp_glRasterPos3f, params__);
	}
	void RasterPos3i(GL gl, ParameterTupleOf!(fp_glRasterPos3i) params__) {
		return checkedCall(gl, "RasterPos3i", fp_glRasterPos3i, params__);
	}
	void RasterPos3s(GL gl, ParameterTupleOf!(fp_glRasterPos3s) params__) {
		return checkedCall(gl, "RasterPos3s", fp_glRasterPos3s, params__);
	}
	void RasterPos4d(GL gl, ParameterTupleOf!(fp_glRasterPos4d) params__) {
		return checkedCall(gl, "RasterPos4d", fp_glRasterPos4d, params__);
	}
	void RasterPos4f(GL gl, ParameterTupleOf!(fp_glRasterPos4f) params__) {
		return checkedCall(gl, "RasterPos4f", fp_glRasterPos4f, params__);
	}
	void RasterPos4i(GL gl, ParameterTupleOf!(fp_glRasterPos4i) params__) {
		return checkedCall(gl, "RasterPos4i", fp_glRasterPos4i, params__);
	}
	void RasterPos4s(GL gl, ParameterTupleOf!(fp_glRasterPos4s) params__) {
		return checkedCall(gl, "RasterPos4s", fp_glRasterPos4s, params__);
	}
	void RasterPos2dv(GL gl, ParameterTupleOf!(fp_glRasterPos2dv) params__) {
		return checkedCall(gl, "RasterPos2dv", fp_glRasterPos2dv, params__);
	}
	void RasterPos2fv(GL gl, ParameterTupleOf!(fp_glRasterPos2fv) params__) {
		return checkedCall(gl, "RasterPos2fv", fp_glRasterPos2fv, params__);
	}
	void RasterPos2iv(GL gl, ParameterTupleOf!(fp_glRasterPos2iv) params__) {
		return checkedCall(gl, "RasterPos2iv", fp_glRasterPos2iv, params__);
	}
	void RasterPos2sv(GL gl, ParameterTupleOf!(fp_glRasterPos2sv) params__) {
		return checkedCall(gl, "RasterPos2sv", fp_glRasterPos2sv, params__);
	}
	void RasterPos3dv(GL gl, ParameterTupleOf!(fp_glRasterPos3dv) params__) {
		return checkedCall(gl, "RasterPos3dv", fp_glRasterPos3dv, params__);
	}
	void RasterPos3fv(GL gl, ParameterTupleOf!(fp_glRasterPos3fv) params__) {
		return checkedCall(gl, "RasterPos3fv", fp_glRasterPos3fv, params__);
	}
	void RasterPos3iv(GL gl, ParameterTupleOf!(fp_glRasterPos3iv) params__) {
		return checkedCall(gl, "RasterPos3iv", fp_glRasterPos3iv, params__);
	}
	void RasterPos3sv(GL gl, ParameterTupleOf!(fp_glRasterPos3sv) params__) {
		return checkedCall(gl, "RasterPos3sv", fp_glRasterPos3sv, params__);
	}
	void RasterPos4dv(GL gl, ParameterTupleOf!(fp_glRasterPos4dv) params__) {
		return checkedCall(gl, "RasterPos4dv", fp_glRasterPos4dv, params__);
	}
	void RasterPos4fv(GL gl, ParameterTupleOf!(fp_glRasterPos4fv) params__) {
		return checkedCall(gl, "RasterPos4fv", fp_glRasterPos4fv, params__);
	}
	void RasterPos4iv(GL gl, ParameterTupleOf!(fp_glRasterPos4iv) params__) {
		return checkedCall(gl, "RasterPos4iv", fp_glRasterPos4iv, params__);
	}
	void RasterPos4sv(GL gl, ParameterTupleOf!(fp_glRasterPos4sv) params__) {
		return checkedCall(gl, "RasterPos4sv", fp_glRasterPos4sv, params__);
	}
	void Rectd(GL gl, ParameterTupleOf!(fp_glRectd) params__) {
		return checkedCall(gl, "Rectd", fp_glRectd, params__);
	}
	void Rectf(GL gl, ParameterTupleOf!(fp_glRectf) params__) {
		return checkedCall(gl, "Rectf", fp_glRectf, params__);
	}
	void Recti(GL gl, ParameterTupleOf!(fp_glRecti) params__) {
		return checkedCall(gl, "Recti", fp_glRecti, params__);
	}
	void Rects(GL gl, ParameterTupleOf!(fp_glRects) params__) {
		return checkedCall(gl, "Rects", fp_glRects, params__);
	}
	void Rectdv(GL gl, ParameterTupleOf!(fp_glRectdv) params__) {
		return checkedCall(gl, "Rectdv", fp_glRectdv, params__);
	}
	void Rectfv(GL gl, ParameterTupleOf!(fp_glRectfv) params__) {
		return checkedCall(gl, "Rectfv", fp_glRectfv, params__);
	}
	void Rectiv(GL gl, ParameterTupleOf!(fp_glRectiv) params__) {
		return checkedCall(gl, "Rectiv", fp_glRectiv, params__);
	}
	void Rectsv(GL gl, ParameterTupleOf!(fp_glRectsv) params__) {
		return checkedCall(gl, "Rectsv", fp_glRectsv, params__);
	}

	void ShadeModel(GL gl, ParameterTupleOf!(fp_glShadeModel) params__) {
		return checkedCall(gl, "ShadeModel", fp_glShadeModel, params__);
	}
	void Lightf(GL gl, ParameterTupleOf!(fp_glLightf) params__) {
		return checkedCall(gl, "Lightf", fp_glLightf, params__);
	}
	void Lighti(GL gl, ParameterTupleOf!(fp_glLighti) params__) {
		return checkedCall(gl, "Lighti", fp_glLighti, params__);
	}
	void Lightfv(GL gl, ParameterTupleOf!(fp_glLightfv) params__) {
		return checkedCall(gl, "Lightfv", fp_glLightfv, params__);
	}
	void Lightiv(GL gl, ParameterTupleOf!(fp_glLightiv) params__) {
		return checkedCall(gl, "Lightiv", fp_glLightiv, params__);
	}
	void GetLightfv(GL gl, ParameterTupleOf!(fp_glGetLightfv) params__) {
		return checkedCall(gl, "GetLightfv", fp_glGetLightfv, params__);
	}
	void GetLightiv(GL gl, ParameterTupleOf!(fp_glGetLightiv) params__) {
		return checkedCall(gl, "GetLightiv", fp_glGetLightiv, params__);
	}
	void LightModelf(GL gl, ParameterTupleOf!(fp_glLightModelf) params__) {
		return checkedCall(gl, "LightModelf", fp_glLightModelf, params__);
	}
	void LightModeli(GL gl, ParameterTupleOf!(fp_glLightModeli) params__) {
		return checkedCall(gl, "LightModeli", fp_glLightModeli, params__);
	}
	void LightModelfv(GL gl, ParameterTupleOf!(fp_glLightModelfv) params__) {
		return checkedCall(gl, "LightModelfv", fp_glLightModelfv, params__);
	}
	void LightModeliv(GL gl, ParameterTupleOf!(fp_glLightModeliv) params__) {
		return checkedCall(gl, "LightModeliv", fp_glLightModeliv, params__);
	}
	void Materialf(GL gl, ParameterTupleOf!(fp_glMaterialf) params__) {
		return checkedCall(gl, "Materialf", fp_glMaterialf, params__);
	}
	void Materiali(GL gl, ParameterTupleOf!(fp_glMateriali) params__) {
		return checkedCall(gl, "Materiali", fp_glMateriali, params__);
	}
	void Materialfv(GL gl, ParameterTupleOf!(fp_glMaterialfv) params__) {
		return checkedCall(gl, "Materialfv", fp_glMaterialfv, params__);
	}
	void Materialiv(GL gl, ParameterTupleOf!(fp_glMaterialiv) params__) {
		return checkedCall(gl, "Materialiv", fp_glMaterialiv, params__);
	}
	void GetMaterialfv(GL gl, ParameterTupleOf!(fp_glGetMaterialfv) params__) {
		return checkedCall(gl, "GetMaterialfv", fp_glGetMaterialfv, params__);
	}
	void GetMaterialiv(GL gl, ParameterTupleOf!(fp_glGetMaterialiv) params__) {
		return checkedCall(gl, "GetMaterialiv", fp_glGetMaterialiv, params__);
	}
	void ColorMaterial(GL gl, ParameterTupleOf!(fp_glColorMaterial) params__) {
		return checkedCall(gl, "ColorMaterial", fp_glColorMaterial, params__);
	}

	void PixelZoom(GL gl, ParameterTupleOf!(fp_glPixelZoom) params__) {
		return checkedCall(gl, "PixelZoom", fp_glPixelZoom, params__);
	}
	void PixelStoref(GL gl, ParameterTupleOf!(fp_glPixelStoref) params__) {
		return checkedCall(gl, "PixelStoref", fp_glPixelStoref, params__);
	}
	void PixelStorei(GL gl, ParameterTupleOf!(fp_glPixelStorei) params__) {
		return checkedCall(gl, "PixelStorei", fp_glPixelStorei, params__);
	}
	void PixelTransferf(GL gl, ParameterTupleOf!(fp_glPixelTransferf) params__) {
		return checkedCall(gl, "PixelTransferf", fp_glPixelTransferf, params__);
	}
	void PixelTransferi(GL gl, ParameterTupleOf!(fp_glPixelTransferi) params__) {
		return checkedCall(gl, "PixelTransferi", fp_glPixelTransferi, params__);
	}
	void PixelMapfv(GL gl, ParameterTupleOf!(fp_glPixelMapfv) params__) {
		return checkedCall(gl, "PixelMapfv", fp_glPixelMapfv, params__);
	}
	void PixelMapuiv(GL gl, ParameterTupleOf!(fp_glPixelMapuiv) params__) {
		return checkedCall(gl, "PixelMapuiv", fp_glPixelMapuiv, params__);
	}
	void PixelMapusv(GL gl, ParameterTupleOf!(fp_glPixelMapusv) params__) {
		return checkedCall(gl, "PixelMapusv", fp_glPixelMapusv, params__);
	}
	void GetPixelMapfv(GL gl, ParameterTupleOf!(fp_glGetPixelMapfv) params__) {
		return checkedCall(gl, "GetPixelMapfv", fp_glGetPixelMapfv, params__);
	}
	void GetPixelMapuiv(GL gl, ParameterTupleOf!(fp_glGetPixelMapuiv) params__) {
		return checkedCall(gl, "GetPixelMapuiv", fp_glGetPixelMapuiv, params__);
	}
	void GetPixelMapusv(GL gl, ParameterTupleOf!(fp_glGetPixelMapusv) params__) {
		return checkedCall(gl, "GetPixelMapusv", fp_glGetPixelMapusv, params__);
	}
	void Bitmap(GL gl, ParameterTupleOf!(fp_glBitmap) params__) {
		return checkedCall(gl, "Bitmap", fp_glBitmap, params__);
	}
	void ReadPixels(GL gl, ParameterTupleOf!(fp_glReadPixels) params__) {
		return checkedCall(gl, "ReadPixels", fp_glReadPixels, params__);
	}
	void DrawPixels(GL gl, ParameterTupleOf!(fp_glDrawPixels) params__) {
		return checkedCall(gl, "DrawPixels", fp_glDrawPixels, params__);
	}
	void CopyPixels(GL gl, ParameterTupleOf!(fp_glCopyPixels) params__) {
		return checkedCall(gl, "CopyPixels", fp_glCopyPixels, params__);
	}

	void StencilFunc(GL gl, ParameterTupleOf!(fp_glStencilFunc) params__) {
		return checkedCall(gl, "StencilFunc", fp_glStencilFunc, params__);
	}
	void StencilMask(GL gl, ParameterTupleOf!(fp_glStencilMask) params__) {
		return checkedCall(gl, "StencilMask", fp_glStencilMask, params__);
	}
	void StencilOp(GL gl, ParameterTupleOf!(fp_glStencilOp) params__) {
		return checkedCall(gl, "StencilOp", fp_glStencilOp, params__);
	}
	void ClearStencil(GL gl, ParameterTupleOf!(fp_glClearStencil) params__) {
		return checkedCall(gl, "ClearStencil", fp_glClearStencil, params__);
	}

	void TexGend(GL gl, ParameterTupleOf!(fp_glTexGend) params__) {
		return checkedCall(gl, "TexGend", fp_glTexGend, params__);
	}
	void TexGenf(GL gl, ParameterTupleOf!(fp_glTexGenf) params__) {
		return checkedCall(gl, "TexGenf", fp_glTexGenf, params__);
	}
	void TexGeni(GL gl, ParameterTupleOf!(fp_glTexGeni) params__) {
		return checkedCall(gl, "TexGeni", fp_glTexGeni, params__);
	}
	void TexGendv(GL gl, ParameterTupleOf!(fp_glTexGendv) params__) {
		return checkedCall(gl, "TexGendv", fp_glTexGendv, params__);
	}
	void TexGenfv(GL gl, ParameterTupleOf!(fp_glTexGenfv) params__) {
		return checkedCall(gl, "TexGenfv", fp_glTexGenfv, params__);
	}
	void TexGeniv(GL gl, ParameterTupleOf!(fp_glTexGeniv) params__) {
		return checkedCall(gl, "TexGeniv", fp_glTexGeniv, params__);
	}
	void GetTexGendv(GL gl, ParameterTupleOf!(fp_glGetTexGendv) params__) {
		return checkedCall(gl, "GetTexGendv", fp_glGetTexGendv, params__);
	}
	void GetTexGenfv(GL gl, ParameterTupleOf!(fp_glGetTexGenfv) params__) {
		return checkedCall(gl, "GetTexGenfv", fp_glGetTexGenfv, params__);
	}
	void GetTexGeniv(GL gl, ParameterTupleOf!(fp_glGetTexGeniv) params__) {
		return checkedCall(gl, "GetTexGeniv", fp_glGetTexGeniv, params__);
	}
	void TexEnvf(GL gl, ParameterTupleOf!(fp_glTexEnvf) params__) {
		return checkedCall(gl, "TexEnvf", fp_glTexEnvf, params__);
	}
	void TexEnvi(GL gl, ParameterTupleOf!(fp_glTexEnvi) params__) {
		return checkedCall(gl, "TexEnvi", fp_glTexEnvi, params__);
	}
	void TexEnvfv(GL gl, ParameterTupleOf!(fp_glTexEnvfv) params__) {
		return checkedCall(gl, "TexEnvfv", fp_glTexEnvfv, params__);
	}
	void TexEnviv(GL gl, ParameterTupleOf!(fp_glTexEnviv) params__) {
		return checkedCall(gl, "TexEnviv", fp_glTexEnviv, params__);
	}
	void GetTexEnvfv(GL gl, ParameterTupleOf!(fp_glGetTexEnvfv) params__) {
		return checkedCall(gl, "GetTexEnvfv", fp_glGetTexEnvfv, params__);
	}
	void GetTexEnviv(GL gl, ParameterTupleOf!(fp_glGetTexEnviv) params__) {
		return checkedCall(gl, "GetTexEnviv", fp_glGetTexEnviv, params__);
	}
	void TexParameterf(GL gl, ParameterTupleOf!(fp_glTexParameterf) params__) {
		return checkedCall(gl, "TexParameterf", fp_glTexParameterf, params__);
	}
	void TexParameteri(GL gl, ParameterTupleOf!(fp_glTexParameteri) params__) {
		return checkedCall(gl, "TexParameteri", fp_glTexParameteri, params__);
	}
	void TexParameterfv(GL gl, ParameterTupleOf!(fp_glTexParameterfv) params__) {
		return checkedCall(gl, "TexParameterfv", fp_glTexParameterfv, params__);
	}
	void TexParameteriv(GL gl, ParameterTupleOf!(fp_glTexParameteriv) params__) {
		return checkedCall(gl, "TexParameteriv", fp_glTexParameteriv, params__);
	}
	void GetTexParameterfv(GL gl, ParameterTupleOf!(fp_glGetTexParameterfv) params__) {
		return checkedCall(gl, "GetTexParameterfv", fp_glGetTexParameterfv, params__);
	}
	void GetTexParameteriv(GL gl, ParameterTupleOf!(fp_glGetTexParameteriv) params__) {
		return checkedCall(gl, "GetTexParameteriv", fp_glGetTexParameteriv, params__);
	}
	void GetTexLevelParameterfv(GL gl, ParameterTupleOf!(fp_glGetTexLevelParameterfv) params__) {
		return checkedCall(gl, "GetTexLevelParameterfv", fp_glGetTexLevelParameterfv, params__);
	}
	void GetTexLevelParameteriv(GL gl, ParameterTupleOf!(fp_glGetTexLevelParameteriv) params__) {
		return checkedCall(gl, "GetTexLevelParameteriv", fp_glGetTexLevelParameteriv, params__);
	}
	void TexImage1D(GL gl, ParameterTupleOf!(fp_glTexImage1D) params__) {
		return checkedCall(gl, "TexImage1D", fp_glTexImage1D, params__);
	}
	void TexImage2D(GL gl, ParameterTupleOf!(fp_glTexImage2D) params__) {
		return checkedCall(gl, "TexImage2D", fp_glTexImage2D, params__);
	}
	void GetTexImage(GL gl, ParameterTupleOf!(fp_glGetTexImage) params__) {
		return checkedCall(gl, "GetTexImage", fp_glGetTexImage, params__);
	}

	void Map1d(GL gl, ParameterTupleOf!(fp_glMap1d) params__) {
		return checkedCall(gl, "Map1d", fp_glMap1d, params__);
	}
	void Map1f(GL gl, ParameterTupleOf!(fp_glMap1f) params__) {
		return checkedCall(gl, "Map1f", fp_glMap1f, params__);
	}
	void Map2d(GL gl, ParameterTupleOf!(fp_glMap2d) params__) {
		return checkedCall(gl, "Map2d", fp_glMap2d, params__);
	}
	void Map2f(GL gl, ParameterTupleOf!(fp_glMap2f) params__) {
		return checkedCall(gl, "Map2f", fp_glMap2f, params__);
	}
	void GetMapdv(GL gl, ParameterTupleOf!(fp_glGetMapdv) params__) {
		return checkedCall(gl, "GetMapdv", fp_glGetMapdv, params__);
	}
	void GetMapfv(GL gl, ParameterTupleOf!(fp_glGetMapfv) params__) {
		return checkedCall(gl, "GetMapfv", fp_glGetMapfv, params__);
	}
	void GetMapiv(GL gl, ParameterTupleOf!(fp_glGetMapiv) params__) {
		return checkedCall(gl, "GetMapiv", fp_glGetMapiv, params__);
	}
	void EvalCoord1d(GL gl, ParameterTupleOf!(fp_glEvalCoord1d) params__) {
		return checkedCall(gl, "EvalCoord1d", fp_glEvalCoord1d, params__);
	}
	void EvalCoord1f(GL gl, ParameterTupleOf!(fp_glEvalCoord1f) params__) {
		return checkedCall(gl, "EvalCoord1f", fp_glEvalCoord1f, params__);
	}
	void EvalCoord1dv(GL gl, ParameterTupleOf!(fp_glEvalCoord1dv) params__) {
		return checkedCall(gl, "EvalCoord1dv", fp_glEvalCoord1dv, params__);
	}
	void EvalCoord1fv(GL gl, ParameterTupleOf!(fp_glEvalCoord1fv) params__) {
		return checkedCall(gl, "EvalCoord1fv", fp_glEvalCoord1fv, params__);
	}
	void EvalCoord2d(GL gl, ParameterTupleOf!(fp_glEvalCoord2d) params__) {
		return checkedCall(gl, "EvalCoord2d", fp_glEvalCoord2d, params__);
	}
	void EvalCoord2f(GL gl, ParameterTupleOf!(fp_glEvalCoord2f) params__) {
		return checkedCall(gl, "EvalCoord2f", fp_glEvalCoord2f, params__);
	}
	void EvalCoord2dv(GL gl, ParameterTupleOf!(fp_glEvalCoord2dv) params__) {
		return checkedCall(gl, "EvalCoord2dv", fp_glEvalCoord2dv, params__);
	}
	void EvalCoord2fv(GL gl, ParameterTupleOf!(fp_glEvalCoord2fv) params__) {
		return checkedCall(gl, "EvalCoord2fv", fp_glEvalCoord2fv, params__);
	}
	void MapGrid1d(GL gl, ParameterTupleOf!(fp_glMapGrid1d) params__) {
		return checkedCall(gl, "MapGrid1d", fp_glMapGrid1d, params__);
	}
	void MapGrid1f(GL gl, ParameterTupleOf!(fp_glMapGrid1f) params__) {
		return checkedCall(gl, "MapGrid1f", fp_glMapGrid1f, params__);
	}
	void MapGrid2d(GL gl, ParameterTupleOf!(fp_glMapGrid2d) params__) {
		return checkedCall(gl, "MapGrid2d", fp_glMapGrid2d, params__);
	}
	void MapGrid2f(GL gl, ParameterTupleOf!(fp_glMapGrid2f) params__) {
		return checkedCall(gl, "MapGrid2f", fp_glMapGrid2f, params__);
	}
	void EvalPoint1(GL gl, ParameterTupleOf!(fp_glEvalPoint1) params__) {
		return checkedCall(gl, "EvalPoint1", fp_glEvalPoint1, params__);
	}
	void EvalPoint2(GL gl, ParameterTupleOf!(fp_glEvalPoint2) params__) {
		return checkedCall(gl, "EvalPoint2", fp_glEvalPoint2, params__);
	}
	void EvalMesh1(GL gl, ParameterTupleOf!(fp_glEvalMesh1) params__) {
		return checkedCall(gl, "EvalMesh1", fp_glEvalMesh1, params__);
	}
	void EvalMesh2(GL gl, ParameterTupleOf!(fp_glEvalMesh2) params__) {
		return checkedCall(gl, "EvalMesh2", fp_glEvalMesh2, params__);
	}

	void Fogf(GL gl, ParameterTupleOf!(fp_glFogf) params__) {
		return checkedCall(gl, "Fogf", fp_glFogf, params__);
	}
	void Fogi(GL gl, ParameterTupleOf!(fp_glFogi) params__) {
		return checkedCall(gl, "Fogi", fp_glFogi, params__);
	}
	void Fogfv(GL gl, ParameterTupleOf!(fp_glFogfv) params__) {
		return checkedCall(gl, "Fogfv", fp_glFogfv, params__);
	}
	void Fogiv(GL gl, ParameterTupleOf!(fp_glFogiv) params__) {
		return checkedCall(gl, "Fogiv", fp_glFogiv, params__);
	}

	void FeedbackBuffer(GL gl, ParameterTupleOf!(fp_glFeedbackBuffer) params__) {
		return checkedCall(gl, "FeedbackBuffer", fp_glFeedbackBuffer, params__);
	}
	void PassThrough(GL gl, ParameterTupleOf!(fp_glPassThrough) params__) {
		return checkedCall(gl, "PassThrough", fp_glPassThrough, params__);
	}
	void SelectBuffer(GL gl, ParameterTupleOf!(fp_glSelectBuffer) params__) {
		return checkedCall(gl, "SelectBuffer", fp_glSelectBuffer, params__);
	}
	void InitNames(GL gl, ParameterTupleOf!(fp_glInitNames) params__) {
		return checkedCall(gl, "InitNames", fp_glInitNames, params__);
	}
	void LoadName(GL gl, ParameterTupleOf!(fp_glLoadName) params__) {
		return checkedCall(gl, "LoadName", fp_glLoadName, params__);
	}
	void PushName(GL gl, ParameterTupleOf!(fp_glPushName) params__) {
		return checkedCall(gl, "PushName", fp_glPushName, params__);
	}
	void PopName(GL gl, ParameterTupleOf!(fp_glPopName) params__) {
		return checkedCall(gl, "PopName", fp_glPopName, params__);
	}

	void GenTextures(GL gl, ParameterTupleOf!(fp_glGenTextures) params__) {
		return checkedCall(gl, "GenTextures", fp_glGenTextures, params__);
	}
	void DeleteTextures(GL gl, ParameterTupleOf!(fp_glDeleteTextures) params__) {
		return checkedCall(gl, "DeleteTextures", fp_glDeleteTextures, params__);
	}
	void BindTexture(GL gl, ParameterTupleOf!(fp_glBindTexture) params__) {
		return checkedCall(gl, "BindTexture", fp_glBindTexture, params__);
	}
	void PrioritizeTextures(GL gl, ParameterTupleOf!(fp_glPrioritizeTextures) params__) {
		return checkedCall(gl, "PrioritizeTextures", fp_glPrioritizeTextures, params__);
	}
	GLboolean AreTexturesResident(GL gl, ParameterTupleOf!(fp_glAreTexturesResident) params__) {
		return checkedCall(gl, "AreTexturesResident", fp_glAreTexturesResident, params__);
	}
	GLboolean IsTexture(GL gl, ParameterTupleOf!(fp_glIsTexture) params__) {
		return checkedCall(gl, "IsTexture", fp_glIsTexture, params__);
	}

	void TexSubImage1D(GL gl, ParameterTupleOf!(fp_glTexSubImage1D) params__) {
		return checkedCall(gl, "TexSubImage1D", fp_glTexSubImage1D, params__);
	}
	void TexSubImage2D(GL gl, ParameterTupleOf!(fp_glTexSubImage2D) params__) {
		return checkedCall(gl, "TexSubImage2D", fp_glTexSubImage2D, params__);
	}
	void CopyTexImage1D(GL gl, ParameterTupleOf!(fp_glCopyTexImage1D) params__) {
		return checkedCall(gl, "CopyTexImage1D", fp_glCopyTexImage1D, params__);
	}
	void CopyTexImage2D(GL gl, ParameterTupleOf!(fp_glCopyTexImage2D) params__) {
		return checkedCall(gl, "CopyTexImage2D", fp_glCopyTexImage2D, params__);
	}
	void CopyTexSubImage1D(GL gl, ParameterTupleOf!(fp_glCopyTexSubImage1D) params__) {
		return checkedCall(gl, "CopyTexSubImage1D", fp_glCopyTexSubImage1D, params__);
	}
	void CopyTexSubImage2D(GL gl, ParameterTupleOf!(fp_glCopyTexSubImage2D) params__) {
		return checkedCall(gl, "CopyTexSubImage2D", fp_glCopyTexSubImage2D, params__);
	}

	void VertexPointer(GL gl, ParameterTupleOf!(fp_glVertexPointer) params__) {
		return checkedCall(gl, "VertexPointer", fp_glVertexPointer, params__);
	}
	void NormalPointer(GL gl, ParameterTupleOf!(fp_glNormalPointer) params__) {
		return checkedCall(gl, "NormalPointer", fp_glNormalPointer, params__);
	}
	void ColorPointer(GL gl, ParameterTupleOf!(fp_glColorPointer) params__) {
		return checkedCall(gl, "ColorPointer", fp_glColorPointer, params__);
	}
	void IndexPointer(GL gl, ParameterTupleOf!(fp_glIndexPointer) params__) {
		return checkedCall(gl, "IndexPointer", fp_glIndexPointer, params__);
	}
	void TexCoordPointer(GL gl, ParameterTupleOf!(fp_glTexCoordPointer) params__) {
		return checkedCall(gl, "TexCoordPointer", fp_glTexCoordPointer, params__);
	}
	void EdgeFlagPointer(GL gl, ParameterTupleOf!(fp_glEdgeFlagPointer) params__) {
		return checkedCall(gl, "EdgeFlagPointer", fp_glEdgeFlagPointer, params__);
	}
	void GetPointerv(GL gl, ParameterTupleOf!(fp_glGetPointerv) params__) {
		return checkedCall(gl, "GetPointerv", fp_glGetPointerv, params__);
	}
	void ArrayElement(GL gl, ParameterTupleOf!(fp_glArrayElement) params__) {
		return checkedCall(gl, "ArrayElement", fp_glArrayElement, params__);
	}
	void DrawArrays(GL gl, ParameterTupleOf!(fp_glDrawArrays) params__) {
		return checkedCall(gl, "DrawArrays", fp_glDrawArrays, params__);
	}
	void DrawElements(GL gl, ParameterTupleOf!(fp_glDrawElements) params__) {
		return checkedCall(gl, "DrawElements", fp_glDrawElements, params__);
	}
	void InterleavedArrays(GL gl, ParameterTupleOf!(fp_glInterleavedArrays) params__) {
		return checkedCall(gl, "InterleavedArrays", fp_glInterleavedArrays, params__);
	}


	/+void  clearIndex(GL gl, ParameterTupleOf!(fp_glClearIndex) params__) {
		return checkedCall(gl, "clearIndex", fp_glClearIndex, params__);
	}
	void  clearColor(GL gl, ParameterTupleOf!(fp_glClearColor) params__) {
		return checkedCall(gl, "clearColor", fp_glClearColor, params__);
	}
	void  clear(GL gl, ParameterTupleOf!(fp_glClear) params__) {
		return checkedCall(gl, "clear", fp_glClear, params__);
	}
	void  indexMask(GL gl, ParameterTupleOf!(fp_glIndexMask) params__) {
		return checkedCall(gl, "indexMask", fp_glIndexMask, params__);
	}
	void  colorMask(GL gl, ParameterTupleOf!(fp_glColorMask) params__) {
		return checkedCall(gl, "colorMask", fp_glColorMask, params__);
	}
	void  alphaFunc(GL gl, ParameterTupleOf!(fp_glAlphaFunc) params__) {
		return checkedCall(gl, "alphaFunc", fp_glAlphaFunc, params__);
	}
	void  blendFunc(GL gl, ParameterTupleOf!(fp_glBlendFunc) params__) {
		return checkedCall(gl, "blendFunc", fp_glBlendFunc, params__);
	}
	void  logicOp(GL gl, ParameterTupleOf!(fp_glLogicOp) params__) {
		return checkedCall(gl, "logicOp", fp_glLogicOp, params__);
	}
	void  cullFace(GL gl, ParameterTupleOf!(fp_glCullFace) params__) {
		return checkedCall(gl, "cullFace", fp_glCullFace, params__);
	}
	void  frontFace(GL gl, ParameterTupleOf!(fp_glFrontFace) params__) {
		return checkedCall(gl, "frontFace", fp_glFrontFace, params__);
	}
	void  pointSize(GL gl, ParameterTupleOf!(fp_glPointSize) params__) {
		return checkedCall(gl, "pointSize", fp_glPointSize, params__);
	}
	void  lineWidth(GL gl, ParameterTupleOf!(fp_glLineWidth) params__) {
		return checkedCall(gl, "lineWidth", fp_glLineWidth, params__);
	}
	void  lineStipple(GL gl, ParameterTupleOf!(fp_glLineStipple) params__) {
		return checkedCall(gl, "lineStipple", fp_glLineStipple, params__);
	}
	void  polygonMode(GL gl, ParameterTupleOf!(fp_glPolygonMode) params__) {
		return checkedCall(gl, "polygonMode", fp_glPolygonMode, params__);
	}
	void  polygonOffset(GL gl, ParameterTupleOf!(fp_glPolygonOffset) params__) {
		return checkedCall(gl, "polygonOffset", fp_glPolygonOffset, params__);
	}
	void  polygonStipple(GL gl, ParameterTupleOf!(fp_glPolygonStipple) params__) {
		return checkedCall(gl, "polygonStipple", fp_glPolygonStipple, params__);
	}
	void  getPolygonStipple(GL gl, ParameterTupleOf!(fp_glGetPolygonStipple) params__) {
		return checkedCall(gl, "getPolygonStipple", fp_glGetPolygonStipple, params__);
	}
	void  edgeFlag(GL gl, ParameterTupleOf!(fp_glEdgeFlag) params__) {
		return checkedCall(gl, "edgeFlag", fp_glEdgeFlag, params__);
	}
	void  edgeFlagv(GL gl, ParameterTupleOf!(fp_glEdgeFlagv) params__) {
		return checkedCall(gl, "edgeFlagv", fp_glEdgeFlagv, params__);
	}
	void  scissor(GL gl, ParameterTupleOf!(fp_glScissor) params__) {
		return checkedCall(gl, "scissor", fp_glScissor, params__);
	}
	void  clipPlane(GL gl, ParameterTupleOf!(fp_glClipPlane) params__) {
		return checkedCall(gl, "clipPlane", fp_glClipPlane, params__);
	}
	void  getClipPlane(GL gl, ParameterTupleOf!(fp_glGetClipPlane) params__) {
		return checkedCall(gl, "getClipPlane", fp_glGetClipPlane, params__);
	}
	void  drawBuffer(GL gl, ParameterTupleOf!(fp_glDrawBuffer) params__) {
		return checkedCall(gl, "drawBuffer", fp_glDrawBuffer, params__);
	}
	void  readBuffer(GL gl, ParameterTupleOf!(fp_glReadBuffer) params__) {
		return checkedCall(gl, "readBuffer", fp_glReadBuffer, params__);
	}
	void  enable(GL gl, ParameterTupleOf!(fp_glEnable) params__) {
		return checkedCall(gl, "enable", fp_glEnable, params__);
	}
	void  disable(GL gl, ParameterTupleOf!(fp_glDisable) params__) {
		return checkedCall(gl, "disable", fp_glDisable, params__);
	}
	GLboolean  isEnabled(GL gl, ParameterTupleOf!(fp_glIsEnabled) params__) {
		return checkedCall(gl, "isEnabled", fp_glIsEnabled, params__);
	}
	void  enableClientState(GL gl, ParameterTupleOf!(fp_glEnableClientState) params__) {
		return checkedCall(gl, "enableClientState", fp_glEnableClientState, params__);
	}
	void  disableClientState(GL gl, ParameterTupleOf!(fp_glDisableClientState) params__) {
		return checkedCall(gl, "disableClientState", fp_glDisableClientState, params__);
	}
	void  getBooleanv(GL gl, ParameterTupleOf!(fp_glGetBooleanv) params__) {
		return checkedCall(gl, "getBooleanv", fp_glGetBooleanv, params__);
	}
	void  getDoublev(GL gl, ParameterTupleOf!(fp_glGetDoublev) params__) {
		return checkedCall(gl, "getDoublev", fp_glGetDoublev, params__);
	}
	void  getFloatv(GL gl, ParameterTupleOf!(fp_glGetFloatv) params__) {
		return checkedCall(gl, "getFloatv", fp_glGetFloatv, params__);
	}
	void  getIntegerv(GL gl, ParameterTupleOf!(fp_glGetIntegerv) params__) {
		return checkedCall(gl, "getIntegerv", fp_glGetIntegerv, params__);
	}
	void  pushAttrib(GL gl, ParameterTupleOf!(fp_glPushAttrib) params__) {
		return checkedCall(gl, "pushAttrib", fp_glPushAttrib, params__);
	}
	void  popAttrib(GL gl, ParameterTupleOf!(fp_glPopAttrib) params__) {
		return checkedCall(gl, "popAttrib", fp_glPopAttrib, params__);
	}
	void  pushClientAttrib(GL gl, ParameterTupleOf!(fp_glPushClientAttrib) params__) {
		return checkedCall(gl, "pushClientAttrib", fp_glPushClientAttrib, params__);
	}
	void  popClientAttrib(GL gl, ParameterTupleOf!(fp_glPopClientAttrib) params__) {
		return checkedCall(gl, "popClientAttrib", fp_glPopClientAttrib, params__);
	}
	GLint  renderMode(GL gl, ParameterTupleOf!(fp_glRenderMode) params__) {
		return checkedCall(gl, "renderMode", fp_glRenderMode, params__);
	}
	GLenum  getError(GL gl, ParameterTupleOf!(fp_glGetError) params__) {
		return fp_glGetError(params__);
	}
	GLchar*  getString(GL gl, ParameterTupleOf!(fp_glGetString) params__) {
		return checkedCall(gl, "getString", fp_glGetString, params__);
	}
	void  finish(GL gl, ParameterTupleOf!(fp_glFinish) params__) {
		return checkedCall(gl, "finish", fp_glFinish, params__);
	}
	void  flush(GL gl, ParameterTupleOf!(fp_glFlush) params__) {
		return checkedCall(gl, "flush", fp_glFlush, params__);
	}
	void  hint(GL gl, ParameterTupleOf!(fp_glHint) params__) {
		return checkedCall(gl, "hint", fp_glHint, params__);
	}


	void  clearDepth(GL gl, ParameterTupleOf!(fp_glClearDepth) params__) {
		return checkedCall(gl, "clearDepth", fp_glClearDepth, params__);
	}
	void  depthFunc(GL gl, ParameterTupleOf!(fp_glDepthFunc) params__) {
		return checkedCall(gl, "depthFunc", fp_glDepthFunc, params__);
	}
	void  depthMask(GL gl, ParameterTupleOf!(fp_glDepthMask) params__) {
		return checkedCall(gl, "depthMask", fp_glDepthMask, params__);
	}
	void  depthRange(GL gl, ParameterTupleOf!(fp_glDepthRange) params__) {
		return checkedCall(gl, "depthRange", fp_glDepthRange, params__);
	}

	void  clearAccum(GL gl, ParameterTupleOf!(fp_glClearAccum) params__) {
		return checkedCall(gl, "clearAccum", fp_glClearAccum, params__);
	}
	void  accum(GL gl, ParameterTupleOf!(fp_glAccum) params__) {
		return checkedCall(gl, "accum", fp_glAccum, params__);
	}

	void  matrixMode(GL gl, ParameterTupleOf!(fp_glMatrixMode) params__) {
		return checkedCall(gl, "matrixMode", fp_glMatrixMode, params__);
	}
	void  ortho(GL gl, ParameterTupleOf!(fp_glOrtho) params__) {
		return checkedCall(gl, "ortho", fp_glOrtho, params__);
	}
	void  frustum(GL gl, ParameterTupleOf!(fp_glFrustum) params__) {
		return checkedCall(gl, "frustum", fp_glFrustum, params__);
	}
	void  viewport(GL gl, ParameterTupleOf!(fp_glViewport) params__) {
		return checkedCall(gl, "viewport", fp_glViewport, params__);
	}
	void  pushMatrix(GL gl, ParameterTupleOf!(fp_glPushMatrix) params__) {
		return checkedCall(gl, "pushMatrix", fp_glPushMatrix, params__);
	}
	void  popMatrix(GL gl, ParameterTupleOf!(fp_glPopMatrix) params__) {
		return checkedCall(gl, "popMatrix", fp_glPopMatrix, params__);
	}
	void  loadIdentity(GL gl, ParameterTupleOf!(fp_glLoadIdentity) params__) {
		return checkedCall(gl, "loadIdentity", fp_glLoadIdentity, params__);
	}
	void  loadMatrixd(GL gl, ParameterTupleOf!(fp_glLoadMatrixd) params__) {
		return checkedCall(gl, "loadMatrixd", fp_glLoadMatrixd, params__);
	}
	void  loadMatrixf(GL gl, ParameterTupleOf!(fp_glLoadMatrixf) params__) {
		return checkedCall(gl, "loadMatrixf", fp_glLoadMatrixf, params__);
	}
	void  multMatrixd(GL gl, ParameterTupleOf!(fp_glMultMatrixd) params__) {
		return checkedCall(gl, "multMatrixd", fp_glMultMatrixd, params__);
	}
	void  multMatrixf(GL gl, ParameterTupleOf!(fp_glMultMatrixf) params__) {
		return checkedCall(gl, "multMatrixf", fp_glMultMatrixf, params__);
	}
	void  rotated(GL gl, ParameterTupleOf!(fp_glRotated) params__) {
		return checkedCall(gl, "rotated", fp_glRotated, params__);
	}
	void  rotatef(GL gl, ParameterTupleOf!(fp_glRotatef) params__) {
		return checkedCall(gl, "rotatef", fp_glRotatef, params__);
	}
	void  scaled(GL gl, ParameterTupleOf!(fp_glScaled) params__) {
		return checkedCall(gl, "scaled", fp_glScaled, params__);
	}
	void  scalef(GL gl, ParameterTupleOf!(fp_glScalef) params__) {
		return checkedCall(gl, "scalef", fp_glScalef, params__);
	}
	void  translated(GL gl, ParameterTupleOf!(fp_glTranslated) params__) {
		return checkedCall(gl, "translated", fp_glTranslated, params__);
	}
	void  translatef(GL gl, ParameterTupleOf!(fp_glTranslatef) params__) {
		return checkedCall(gl, "translatef", fp_glTranslatef, params__);
	}

	GLboolean  isList(GL gl, ParameterTupleOf!(fp_glIsList) params__) {
		return checkedCall(gl, "isList", fp_glIsList, params__);
	}
	void  deleteLists(GL gl, ParameterTupleOf!(fp_glDeleteLists) params__) {
		return checkedCall(gl, "deleteLists", fp_glDeleteLists, params__);
	}
	GLuint  genLists(GL gl, ParameterTupleOf!(fp_glGenLists) params__) {
		return checkedCall(gl, "genLists", fp_glGenLists, params__);
	}
	void  newList(GL gl, ParameterTupleOf!(fp_glNewList) params__) {
		return checkedCall(gl, "newList", fp_glNewList, params__);
	}
	void  endList(GL gl, ParameterTupleOf!(fp_glEndList) params__) {
		return checkedCall(gl, "endList", fp_glEndList, params__);
	}
	void  callList(GL gl, ParameterTupleOf!(fp_glCallList) params__) {
		return checkedCall(gl, "callList", fp_glCallList, params__);
	}
	void  callLists(GL gl, ParameterTupleOf!(fp_glCallLists) params__) {
		return checkedCall(gl, "callLists", fp_glCallLists, params__);
	}
	void  listBase(GL gl, ParameterTupleOf!(fp_glListBase) params__) {
		return checkedCall(gl, "listBase", fp_glListBase, params__);
	}

	void begin(GL gl, ParameterTupleOf!(fp_glBegin) params__) {
		_getGL(gl).insideGlBegin = true;
		return checkedCall(gl, "begin", fp_glBegin, params__);
	}
	void end(GL gl, ParameterTupleOf!(fp_glEnd) params__) {
		_getGL(gl).insideGlBegin = false;
		return checkedCall(gl, "end", fp_glEnd, params__);
	}

	void  vertex2d(GL gl, ParameterTupleOf!(fp_glVertex2d) params__) {
		return checkedCall(gl, "vertex2d", fp_glVertex2d, params__);
	}
	void  vertex2f(GL gl, ParameterTupleOf!(fp_glVertex2f) params__) {
		return checkedCall(gl, "vertex2f", fp_glVertex2f, params__);
	}
	void  vertex2i(GL gl, ParameterTupleOf!(fp_glVertex2i) params__) {
		return checkedCall(gl, "vertex2i", fp_glVertex2i, params__);
	}
	void  vertex2s(GL gl, ParameterTupleOf!(fp_glVertex2s) params__) {
		return checkedCall(gl, "vertex2s", fp_glVertex2s, params__);
	}
	void  vertex3d(GL gl, ParameterTupleOf!(fp_glVertex3d) params__) {
		return checkedCall(gl, "vertex3d", fp_glVertex3d, params__);
	}
	void  vertex3f(GL gl, ParameterTupleOf!(fp_glVertex3f) params__) {
		return checkedCall(gl, "vertex3f", fp_glVertex3f, params__);
	}
	void  vertex3i(GL gl, ParameterTupleOf!(fp_glVertex3i) params__) {
		return checkedCall(gl, "vertex3i", fp_glVertex3i, params__);
	}
	void  vertex3s(GL gl, ParameterTupleOf!(fp_glVertex3s) params__) {
		return checkedCall(gl, "vertex3s", fp_glVertex3s, params__);
	}
	void  vertex4d(GL gl, ParameterTupleOf!(fp_glVertex4d) params__) {
		return checkedCall(gl, "vertex4d", fp_glVertex4d, params__);
	}
	void  vertex4f(GL gl, ParameterTupleOf!(fp_glVertex4f) params__) {
		return checkedCall(gl, "vertex4f", fp_glVertex4f, params__);
	}
	void  vertex4i(GL gl, ParameterTupleOf!(fp_glVertex4i) params__) {
		return checkedCall(gl, "vertex4i", fp_glVertex4i, params__);
	}
	void  vertex4s(GL gl, ParameterTupleOf!(fp_glVertex4s) params__) {
		return checkedCall(gl, "vertex4s", fp_glVertex4s, params__);
	}
	void  vertex2dv(GL gl, ParameterTupleOf!(fp_glVertex2dv) params__) {
		return checkedCall(gl, "vertex2dv", fp_glVertex2dv, params__);
	}
	void  vertex2fv(GL gl, ParameterTupleOf!(fp_glVertex2fv) params__) {
		return checkedCall(gl, "vertex2fv", fp_glVertex2fv, params__);
	}
	void  vertex2iv(GL gl, ParameterTupleOf!(fp_glVertex2iv) params__) {
		return checkedCall(gl, "vertex2iv", fp_glVertex2iv, params__);
	}
	void  vertex2sv(GL gl, ParameterTupleOf!(fp_glVertex2sv) params__) {
		return checkedCall(gl, "vertex2sv", fp_glVertex2sv, params__);
	}
	void  vertex3dv(GL gl, ParameterTupleOf!(fp_glVertex3dv) params__) {
		return checkedCall(gl, "vertex3dv", fp_glVertex3dv, params__);
	}
	void  vertex3fv(GL gl, ParameterTupleOf!(fp_glVertex3fv) params__) {
		return checkedCall(gl, "vertex3fv", fp_glVertex3fv, params__);
	}
	void  vertex3iv(GL gl, ParameterTupleOf!(fp_glVertex3iv) params__) {
		return checkedCall(gl, "vertex3iv", fp_glVertex3iv, params__);
	}
	void  vertex3sv(GL gl, ParameterTupleOf!(fp_glVertex3sv) params__) {
		return checkedCall(gl, "vertex3sv", fp_glVertex3sv, params__);
	}
	void  vertex4dv(GL gl, ParameterTupleOf!(fp_glVertex4dv) params__) {
		return checkedCall(gl, "vertex4dv", fp_glVertex4dv, params__);
	}
	void  vertex4fv(GL gl, ParameterTupleOf!(fp_glVertex4fv) params__) {
		return checkedCall(gl, "vertex4fv", fp_glVertex4fv, params__);
	}
	void  vertex4iv(GL gl, ParameterTupleOf!(fp_glVertex4iv) params__) {
		return checkedCall(gl, "vertex4iv", fp_glVertex4iv, params__);
	}
	void  vertex4sv(GL gl, ParameterTupleOf!(fp_glVertex4sv) params__) {
		return checkedCall(gl, "vertex4sv", fp_glVertex4sv, params__);
	}
	void  normal3b(GL gl, ParameterTupleOf!(fp_glNormal3b) params__) {
		return checkedCall(gl, "normal3b", fp_glNormal3b, params__);
	}
	void  normal3d(GL gl, ParameterTupleOf!(fp_glNormal3d) params__) {
		return checkedCall(gl, "normal3d", fp_glNormal3d, params__);
	}
	void  normal3f(GL gl, ParameterTupleOf!(fp_glNormal3f) params__) {
		return checkedCall(gl, "normal3f", fp_glNormal3f, params__);
	}
	void  normal3i(GL gl, ParameterTupleOf!(fp_glNormal3i) params__) {
		return checkedCall(gl, "normal3i", fp_glNormal3i, params__);
	}
	void  normal3s(GL gl, ParameterTupleOf!(fp_glNormal3s) params__) {
		return checkedCall(gl, "normal3s", fp_glNormal3s, params__);
	}
	void  normal3bv(GL gl, ParameterTupleOf!(fp_glNormal3bv) params__) {
		return checkedCall(gl, "normal3bv", fp_glNormal3bv, params__);
	}
	void  normal3dv(GL gl, ParameterTupleOf!(fp_glNormal3dv) params__) {
		return checkedCall(gl, "normal3dv", fp_glNormal3dv, params__);
	}
	void  normal3fv(GL gl, ParameterTupleOf!(fp_glNormal3fv) params__) {
		return checkedCall(gl, "normal3fv", fp_glNormal3fv, params__);
	}
	void  normal3iv(GL gl, ParameterTupleOf!(fp_glNormal3iv) params__) {
		return checkedCall(gl, "normal3iv", fp_glNormal3iv, params__);
	}
	void  normal3sv(GL gl, ParameterTupleOf!(fp_glNormal3sv) params__) {
		return checkedCall(gl, "normal3sv", fp_glNormal3sv, params__);
	}
	void  indexd(GL gl, ParameterTupleOf!(fp_glIndexd) params__) {
		return checkedCall(gl, "indexd", fp_glIndexd, params__);
	}
	void  indexf(GL gl, ParameterTupleOf!(fp_glIndexf) params__) {
		return checkedCall(gl, "indexf", fp_glIndexf, params__);
	}
	void  indexi(GL gl, ParameterTupleOf!(fp_glIndexi) params__) {
		return checkedCall(gl, "indexi", fp_glIndexi, params__);
	}
	void  indexs(GL gl, ParameterTupleOf!(fp_glIndexs) params__) {
		return checkedCall(gl, "indexs", fp_glIndexs, params__);
	}
	void  indexub(GL gl, ParameterTupleOf!(fp_glIndexub) params__) {
		return checkedCall(gl, "indexub", fp_glIndexub, params__);
	}
	void  indexdv(GL gl, ParameterTupleOf!(fp_glIndexdv) params__) {
		return checkedCall(gl, "indexdv", fp_glIndexdv, params__);
	}
	void  indexfv(GL gl, ParameterTupleOf!(fp_glIndexfv) params__) {
		return checkedCall(gl, "indexfv", fp_glIndexfv, params__);
	}
	void  indexiv(GL gl, ParameterTupleOf!(fp_glIndexiv) params__) {
		return checkedCall(gl, "indexiv", fp_glIndexiv, params__);
	}
	void  indexsv(GL gl, ParameterTupleOf!(fp_glIndexsv) params__) {
		return checkedCall(gl, "indexsv", fp_glIndexsv, params__);
	}
	void  indexubv(GL gl, ParameterTupleOf!(fp_glIndexubv) params__) {
		return checkedCall(gl, "indexubv", fp_glIndexubv, params__);
	}
	void  color3b(GL gl, ParameterTupleOf!(fp_glColor3b) params__) {
		return checkedCall(gl, "color3b", fp_glColor3b, params__);
	}
	void  color3d(GL gl, ParameterTupleOf!(fp_glColor3d) params__) {
		return checkedCall(gl, "color3d", fp_glColor3d, params__);
	}
	void  color3f(GL gl, ParameterTupleOf!(fp_glColor3f) params__) {
		return checkedCall(gl, "color3f", fp_glColor3f, params__);
	}
	void  color3i(GL gl, ParameterTupleOf!(fp_glColor3i) params__) {
		return checkedCall(gl, "color3i", fp_glColor3i, params__);
	}
	void  color3s(GL gl, ParameterTupleOf!(fp_glColor3s) params__) {
		return checkedCall(gl, "color3s", fp_glColor3s, params__);
	}
	void  color3ub(GL gl, ParameterTupleOf!(fp_glColor3ub) params__) {
		return checkedCall(gl, "color3ub", fp_glColor3ub, params__);
	}
	void  color3ui(GL gl, ParameterTupleOf!(fp_glColor3ui) params__) {
		return checkedCall(gl, "color3ui", fp_glColor3ui, params__);
	}
	void  color3us(GL gl, ParameterTupleOf!(fp_glColor3us) params__) {
		return checkedCall(gl, "color3us", fp_glColor3us, params__);
	}
	void  color4b(GL gl, ParameterTupleOf!(fp_glColor4b) params__) {
		return checkedCall(gl, "color4b", fp_glColor4b, params__);
	}
	void  color4d(GL gl, ParameterTupleOf!(fp_glColor4d) params__) {
		return checkedCall(gl, "color4d", fp_glColor4d, params__);
	}
	void  color4f(GL gl, ParameterTupleOf!(fp_glColor4f) params__) {
		return checkedCall(gl, "color4f", fp_glColor4f, params__);
	}
	void  color4i(GL gl, ParameterTupleOf!(fp_glColor4i) params__) {
		return checkedCall(gl, "color4i", fp_glColor4i, params__);
	}
	void  color4s(GL gl, ParameterTupleOf!(fp_glColor4s) params__) {
		return checkedCall(gl, "color4s", fp_glColor4s, params__);
	}
	void  color4ub(GL gl, ParameterTupleOf!(fp_glColor4ub) params__) {
		return checkedCall(gl, "color4ub", fp_glColor4ub, params__);
	}
	void  color4ui(GL gl, ParameterTupleOf!(fp_glColor4ui) params__) {
		return checkedCall(gl, "color4ui", fp_glColor4ui, params__);
	}
	void  color4us(GL gl, ParameterTupleOf!(fp_glColor4us) params__) {
		return checkedCall(gl, "color4us", fp_glColor4us, params__);
	}
	void  color3bv(GL gl, ParameterTupleOf!(fp_glColor3bv) params__) {
		return checkedCall(gl, "color3bv", fp_glColor3bv, params__);
	}
	void  color3dv(GL gl, ParameterTupleOf!(fp_glColor3dv) params__) {
		return checkedCall(gl, "color3dv", fp_glColor3dv, params__);
	}
	void  color3fv(GL gl, ParameterTupleOf!(fp_glColor3fv) params__) {
		return checkedCall(gl, "color3fv", fp_glColor3fv, params__);
	}
	void  color3iv(GL gl, ParameterTupleOf!(fp_glColor3iv) params__) {
		return checkedCall(gl, "color3iv", fp_glColor3iv, params__);
	}
	void  color3sv(GL gl, ParameterTupleOf!(fp_glColor3sv) params__) {
		return checkedCall(gl, "color3sv", fp_glColor3sv, params__);
	}
	void  color3ubv(GL gl, ParameterTupleOf!(fp_glColor3ubv) params__) {
		return checkedCall(gl, "color3ubv", fp_glColor3ubv, params__);
	}
	void  color3uiv(GL gl, ParameterTupleOf!(fp_glColor3uiv) params__) {
		return checkedCall(gl, "color3uiv", fp_glColor3uiv, params__);
	}
	void  color3usv(GL gl, ParameterTupleOf!(fp_glColor3usv) params__) {
		return checkedCall(gl, "color3usv", fp_glColor3usv, params__);
	}
	void  color4bv(GL gl, ParameterTupleOf!(fp_glColor4bv) params__) {
		return checkedCall(gl, "color4bv", fp_glColor4bv, params__);
	}
	void  color4dv(GL gl, ParameterTupleOf!(fp_glColor4dv) params__) {
		return checkedCall(gl, "color4dv", fp_glColor4dv, params__);
	}
	void  color4fv(GL gl, ParameterTupleOf!(fp_glColor4fv) params__) {
		return checkedCall(gl, "color4fv", fp_glColor4fv, params__);
	}
	void  color4iv(GL gl, ParameterTupleOf!(fp_glColor4iv) params__) {
		return checkedCall(gl, "color4iv", fp_glColor4iv, params__);
	}
	void  color4sv(GL gl, ParameterTupleOf!(fp_glColor4sv) params__) {
		return checkedCall(gl, "color4sv", fp_glColor4sv, params__);
	}
	void  color4ubv(GL gl, ParameterTupleOf!(fp_glColor4ubv) params__) {
		return checkedCall(gl, "color4ubv", fp_glColor4ubv, params__);
	}
	void  color4uiv(GL gl, ParameterTupleOf!(fp_glColor4uiv) params__) {
		return checkedCall(gl, "color4uiv", fp_glColor4uiv, params__);
	}
	void  color4usv(GL gl, ParameterTupleOf!(fp_glColor4usv) params__) {
		return checkedCall(gl, "color4usv", fp_glColor4usv, params__);
	}
	void  texCoord1d(GL gl, ParameterTupleOf!(fp_glTexCoord1d) params__) {
		return checkedCall(gl, "texCoord1d", fp_glTexCoord1d, params__);
	}
	void  texCoord1f(GL gl, ParameterTupleOf!(fp_glTexCoord1f) params__) {
		return checkedCall(gl, "texCoord1f", fp_glTexCoord1f, params__);
	}
	void  texCoord1i(GL gl, ParameterTupleOf!(fp_glTexCoord1i) params__) {
		return checkedCall(gl, "texCoord1i", fp_glTexCoord1i, params__);
	}
	void  texCoord1s(GL gl, ParameterTupleOf!(fp_glTexCoord1s) params__) {
		return checkedCall(gl, "texCoord1s", fp_glTexCoord1s, params__);
	}
	void  texCoord2d(GL gl, ParameterTupleOf!(fp_glTexCoord2d) params__) {
		return checkedCall(gl, "texCoord2d", fp_glTexCoord2d, params__);
	}
	void  texCoord2f(GL gl, ParameterTupleOf!(fp_glTexCoord2f) params__) {
		return checkedCall(gl, "texCoord2f", fp_glTexCoord2f, params__);
	}
	void  texCoord2i(GL gl, ParameterTupleOf!(fp_glTexCoord2i) params__) {
		return checkedCall(gl, "texCoord2i", fp_glTexCoord2i, params__);
	}
	void  texCoord2s(GL gl, ParameterTupleOf!(fp_glTexCoord2s) params__) {
		return checkedCall(gl, "texCoord2s", fp_glTexCoord2s, params__);
	}
	void  texCoord3d(GL gl, ParameterTupleOf!(fp_glTexCoord3d) params__) {
		return checkedCall(gl, "texCoord3d", fp_glTexCoord3d, params__);
	}
	void  texCoord3f(GL gl, ParameterTupleOf!(fp_glTexCoord3f) params__) {
		return checkedCall(gl, "texCoord3f", fp_glTexCoord3f, params__);
	}
	void  texCoord3i(GL gl, ParameterTupleOf!(fp_glTexCoord3i) params__) {
		return checkedCall(gl, "texCoord3i", fp_glTexCoord3i, params__);
	}
	void  texCoord3s(GL gl, ParameterTupleOf!(fp_glTexCoord3s) params__) {
		return checkedCall(gl, "texCoord3s", fp_glTexCoord3s, params__);
	}
	void  texCoord4d(GL gl, ParameterTupleOf!(fp_glTexCoord4d) params__) {
		return checkedCall(gl, "texCoord4d", fp_glTexCoord4d, params__);
	}
	void  texCoord4f(GL gl, ParameterTupleOf!(fp_glTexCoord4f) params__) {
		return checkedCall(gl, "texCoord4f", fp_glTexCoord4f, params__);
	}
	void  texCoord4i(GL gl, ParameterTupleOf!(fp_glTexCoord4i) params__) {
		return checkedCall(gl, "texCoord4i", fp_glTexCoord4i, params__);
	}
	void  texCoord4s(GL gl, ParameterTupleOf!(fp_glTexCoord4s) params__) {
		return checkedCall(gl, "texCoord4s", fp_glTexCoord4s, params__);
	}
	void  texCoord1dv(GL gl, ParameterTupleOf!(fp_glTexCoord1dv) params__) {
		return checkedCall(gl, "texCoord1dv", fp_glTexCoord1dv, params__);
	}
	void  texCoord1fv(GL gl, ParameterTupleOf!(fp_glTexCoord1fv) params__) {
		return checkedCall(gl, "texCoord1fv", fp_glTexCoord1fv, params__);
	}
	void  texCoord1iv(GL gl, ParameterTupleOf!(fp_glTexCoord1iv) params__) {
		return checkedCall(gl, "texCoord1iv", fp_glTexCoord1iv, params__);
	}
	void  texCoord1sv(GL gl, ParameterTupleOf!(fp_glTexCoord1sv) params__) {
		return checkedCall(gl, "texCoord1sv", fp_glTexCoord1sv, params__);
	}
	void  texCoord2dv(GL gl, ParameterTupleOf!(fp_glTexCoord2dv) params__) {
		return checkedCall(gl, "texCoord2dv", fp_glTexCoord2dv, params__);
	}
	void  texCoord2fv(GL gl, ParameterTupleOf!(fp_glTexCoord2fv) params__) {
		return checkedCall(gl, "texCoord2fv", fp_glTexCoord2fv, params__);
	}
	void  texCoord2iv(GL gl, ParameterTupleOf!(fp_glTexCoord2iv) params__) {
		return checkedCall(gl, "texCoord2iv", fp_glTexCoord2iv, params__);
	}
	void  texCoord2sv(GL gl, ParameterTupleOf!(fp_glTexCoord2sv) params__) {
		return checkedCall(gl, "texCoord2sv", fp_glTexCoord2sv, params__);
	}
	void  texCoord3dv(GL gl, ParameterTupleOf!(fp_glTexCoord3dv) params__) {
		return checkedCall(gl, "texCoord3dv", fp_glTexCoord3dv, params__);
	}
	void  texCoord3fv(GL gl, ParameterTupleOf!(fp_glTexCoord3fv) params__) {
		return checkedCall(gl, "texCoord3fv", fp_glTexCoord3fv, params__);
	}
	void  texCoord3iv(GL gl, ParameterTupleOf!(fp_glTexCoord3iv) params__) {
		return checkedCall(gl, "texCoord3iv", fp_glTexCoord3iv, params__);
	}
	void  texCoord3sv(GL gl, ParameterTupleOf!(fp_glTexCoord3sv) params__) {
		return checkedCall(gl, "texCoord3sv", fp_glTexCoord3sv, params__);
	}
	void  texCoord4dv(GL gl, ParameterTupleOf!(fp_glTexCoord4dv) params__) {
		return checkedCall(gl, "texCoord4dv", fp_glTexCoord4dv, params__);
	}
	void  texCoord4fv(GL gl, ParameterTupleOf!(fp_glTexCoord4fv) params__) {
		return checkedCall(gl, "texCoord4fv", fp_glTexCoord4fv, params__);
	}
	void  texCoord4iv(GL gl, ParameterTupleOf!(fp_glTexCoord4iv) params__) {
		return checkedCall(gl, "texCoord4iv", fp_glTexCoord4iv, params__);
	}
	void  texCoord4sv(GL gl, ParameterTupleOf!(fp_glTexCoord4sv) params__) {
		return checkedCall(gl, "texCoord4sv", fp_glTexCoord4sv, params__);
	}
	void  rasterPos2d(GL gl, ParameterTupleOf!(fp_glRasterPos2d) params__) {
		return checkedCall(gl, "rasterPos2d", fp_glRasterPos2d, params__);
	}
	void  rasterPos2f(GL gl, ParameterTupleOf!(fp_glRasterPos2f) params__) {
		return checkedCall(gl, "rasterPos2f", fp_glRasterPos2f, params__);
	}
	void  rasterPos2i(GL gl, ParameterTupleOf!(fp_glRasterPos2i) params__) {
		return checkedCall(gl, "rasterPos2i", fp_glRasterPos2i, params__);
	}
	void  rasterPos2s(GL gl, ParameterTupleOf!(fp_glRasterPos2s) params__) {
		return checkedCall(gl, "rasterPos2s", fp_glRasterPos2s, params__);
	}
	void  rasterPos3d(GL gl, ParameterTupleOf!(fp_glRasterPos3d) params__) {
		return checkedCall(gl, "rasterPos3d", fp_glRasterPos3d, params__);
	}
	void  rasterPos3f(GL gl, ParameterTupleOf!(fp_glRasterPos3f) params__) {
		return checkedCall(gl, "rasterPos3f", fp_glRasterPos3f, params__);
	}
	void  rasterPos3i(GL gl, ParameterTupleOf!(fp_glRasterPos3i) params__) {
		return checkedCall(gl, "rasterPos3i", fp_glRasterPos3i, params__);
	}
	void  rasterPos3s(GL gl, ParameterTupleOf!(fp_glRasterPos3s) params__) {
		return checkedCall(gl, "rasterPos3s", fp_glRasterPos3s, params__);
	}
	void  rasterPos4d(GL gl, ParameterTupleOf!(fp_glRasterPos4d) params__) {
		return checkedCall(gl, "rasterPos4d", fp_glRasterPos4d, params__);
	}
	void  rasterPos4f(GL gl, ParameterTupleOf!(fp_glRasterPos4f) params__) {
		return checkedCall(gl, "rasterPos4f", fp_glRasterPos4f, params__);
	}
	void  rasterPos4i(GL gl, ParameterTupleOf!(fp_glRasterPos4i) params__) {
		return checkedCall(gl, "rasterPos4i", fp_glRasterPos4i, params__);
	}
	void  rasterPos4s(GL gl, ParameterTupleOf!(fp_glRasterPos4s) params__) {
		return checkedCall(gl, "rasterPos4s", fp_glRasterPos4s, params__);
	}
	void  rasterPos2dv(GL gl, ParameterTupleOf!(fp_glRasterPos2dv) params__) {
		return checkedCall(gl, "rasterPos2dv", fp_glRasterPos2dv, params__);
	}
	void  rasterPos2fv(GL gl, ParameterTupleOf!(fp_glRasterPos2fv) params__) {
		return checkedCall(gl, "rasterPos2fv", fp_glRasterPos2fv, params__);
	}
	void  rasterPos2iv(GL gl, ParameterTupleOf!(fp_glRasterPos2iv) params__) {
		return checkedCall(gl, "rasterPos2iv", fp_glRasterPos2iv, params__);
	}
	void  rasterPos2sv(GL gl, ParameterTupleOf!(fp_glRasterPos2sv) params__) {
		return checkedCall(gl, "rasterPos2sv", fp_glRasterPos2sv, params__);
	}
	void  rasterPos3dv(GL gl, ParameterTupleOf!(fp_glRasterPos3dv) params__) {
		return checkedCall(gl, "rasterPos3dv", fp_glRasterPos3dv, params__);
	}
	void  rasterPos3fv(GL gl, ParameterTupleOf!(fp_glRasterPos3fv) params__) {
		return checkedCall(gl, "rasterPos3fv", fp_glRasterPos3fv, params__);
	}
	void  rasterPos3iv(GL gl, ParameterTupleOf!(fp_glRasterPos3iv) params__) {
		return checkedCall(gl, "rasterPos3iv", fp_glRasterPos3iv, params__);
	}
	void  rasterPos3sv(GL gl, ParameterTupleOf!(fp_glRasterPos3sv) params__) {
		return checkedCall(gl, "rasterPos3sv", fp_glRasterPos3sv, params__);
	}
	void  rasterPos4dv(GL gl, ParameterTupleOf!(fp_glRasterPos4dv) params__) {
		return checkedCall(gl, "rasterPos4dv", fp_glRasterPos4dv, params__);
	}
	void  rasterPos4fv(GL gl, ParameterTupleOf!(fp_glRasterPos4fv) params__) {
		return checkedCall(gl, "rasterPos4fv", fp_glRasterPos4fv, params__);
	}
	void  rasterPos4iv(GL gl, ParameterTupleOf!(fp_glRasterPos4iv) params__) {
		return checkedCall(gl, "rasterPos4iv", fp_glRasterPos4iv, params__);
	}
	void  rasterPos4sv(GL gl, ParameterTupleOf!(fp_glRasterPos4sv) params__) {
		return checkedCall(gl, "rasterPos4sv", fp_glRasterPos4sv, params__);
	}
	void  rectd(GL gl, ParameterTupleOf!(fp_glRectd) params__) {
		return checkedCall(gl, "rectd", fp_glRectd, params__);
	}
	void  rectf(GL gl, ParameterTupleOf!(fp_glRectf) params__) {
		return checkedCall(gl, "rectf", fp_glRectf, params__);
	}
	void  recti(GL gl, ParameterTupleOf!(fp_glRecti) params__) {
		return checkedCall(gl, "recti", fp_glRecti, params__);
	}
	void  rects(GL gl, ParameterTupleOf!(fp_glRects) params__) {
		return checkedCall(gl, "rects", fp_glRects, params__);
	}
	void  rectdv(GL gl, ParameterTupleOf!(fp_glRectdv) params__) {
		return checkedCall(gl, "rectdv", fp_glRectdv, params__);
	}
	void  rectfv(GL gl, ParameterTupleOf!(fp_glRectfv) params__) {
		return checkedCall(gl, "rectfv", fp_glRectfv, params__);
	}
	void  rectiv(GL gl, ParameterTupleOf!(fp_glRectiv) params__) {
		return checkedCall(gl, "rectiv", fp_glRectiv, params__);
	}
	void  rectsv(GL gl, ParameterTupleOf!(fp_glRectsv) params__) {
		return checkedCall(gl, "rectsv", fp_glRectsv, params__);
	}

	void  shadeModel(GL gl, ParameterTupleOf!(fp_glShadeModel) params__) {
		return checkedCall(gl, "shadeModel", fp_glShadeModel, params__);
	}
	void  lightf(GL gl, ParameterTupleOf!(fp_glLightf) params__) {
		return checkedCall(gl, "lightf", fp_glLightf, params__);
	}
	void  lighti(GL gl, ParameterTupleOf!(fp_glLighti) params__) {
		return checkedCall(gl, "lighti", fp_glLighti, params__);
	}
	void  lightfv(GL gl, ParameterTupleOf!(fp_glLightfv) params__) {
		return checkedCall(gl, "lightfv", fp_glLightfv, params__);
	}
	void  lightiv(GL gl, ParameterTupleOf!(fp_glLightiv) params__) {
		return checkedCall(gl, "lightiv", fp_glLightiv, params__);
	}
	void  getLightfv(GL gl, ParameterTupleOf!(fp_glGetLightfv) params__) {
		return checkedCall(gl, "getLightfv", fp_glGetLightfv, params__);
	}
	void  getLightiv(GL gl, ParameterTupleOf!(fp_glGetLightiv) params__) {
		return checkedCall(gl, "getLightiv", fp_glGetLightiv, params__);
	}
	void  lightModelf(GL gl, ParameterTupleOf!(fp_glLightModelf) params__) {
		return checkedCall(gl, "lightModelf", fp_glLightModelf, params__);
	}
	void  lightModeli(GL gl, ParameterTupleOf!(fp_glLightModeli) params__) {
		return checkedCall(gl, "lightModeli", fp_glLightModeli, params__);
	}
	void  lightModelfv(GL gl, ParameterTupleOf!(fp_glLightModelfv) params__) {
		return checkedCall(gl, "lightModelfv", fp_glLightModelfv, params__);
	}
	void  lightModeliv(GL gl, ParameterTupleOf!(fp_glLightModeliv) params__) {
		return checkedCall(gl, "lightModeliv", fp_glLightModeliv, params__);
	}
	void  materialf(GL gl, ParameterTupleOf!(fp_glMaterialf) params__) {
		return checkedCall(gl, "materialf", fp_glMaterialf, params__);
	}
	void  materiali(GL gl, ParameterTupleOf!(fp_glMateriali) params__) {
		return checkedCall(gl, "materiali", fp_glMateriali, params__);
	}
	void  materialfv(GL gl, ParameterTupleOf!(fp_glMaterialfv) params__) {
		return checkedCall(gl, "materialfv", fp_glMaterialfv, params__);
	}
	void  materialiv(GL gl, ParameterTupleOf!(fp_glMaterialiv) params__) {
		return checkedCall(gl, "materialiv", fp_glMaterialiv, params__);
	}
	void  getMaterialfv(GL gl, ParameterTupleOf!(fp_glGetMaterialfv) params__) {
		return checkedCall(gl, "getMaterialfv", fp_glGetMaterialfv, params__);
	}
	void  getMaterialiv(GL gl, ParameterTupleOf!(fp_glGetMaterialiv) params__) {
		return checkedCall(gl, "getMaterialiv", fp_glGetMaterialiv, params__);
	}
	void  colorMaterial(GL gl, ParameterTupleOf!(fp_glColorMaterial) params__) {
		return checkedCall(gl, "colorMaterial", fp_glColorMaterial, params__);
	}

	void  pixelZoom(GL gl, ParameterTupleOf!(fp_glPixelZoom) params__) {
		return checkedCall(gl, "pixelZoom", fp_glPixelZoom, params__);
	}
	void  pixelStoref(GL gl, ParameterTupleOf!(fp_glPixelStoref) params__) {
		return checkedCall(gl, "pixelStoref", fp_glPixelStoref, params__);
	}
	void  pixelStorei(GL gl, ParameterTupleOf!(fp_glPixelStorei) params__) {
		return checkedCall(gl, "pixelStorei", fp_glPixelStorei, params__);
	}
	void  pixelTransferf(GL gl, ParameterTupleOf!(fp_glPixelTransferf) params__) {
		return checkedCall(gl, "pixelTransferf", fp_glPixelTransferf, params__);
	}
	void  pixelTransferi(GL gl, ParameterTupleOf!(fp_glPixelTransferi) params__) {
		return checkedCall(gl, "pixelTransferi", fp_glPixelTransferi, params__);
	}
	void  pixelMapfv(GL gl, ParameterTupleOf!(fp_glPixelMapfv) params__) {
		return checkedCall(gl, "pixelMapfv", fp_glPixelMapfv, params__);
	}
	void  pixelMapuiv(GL gl, ParameterTupleOf!(fp_glPixelMapuiv) params__) {
		return checkedCall(gl, "pixelMapuiv", fp_glPixelMapuiv, params__);
	}
	void  pixelMapusv(GL gl, ParameterTupleOf!(fp_glPixelMapusv) params__) {
		return checkedCall(gl, "pixelMapusv", fp_glPixelMapusv, params__);
	}
	void  getPixelMapfv(GL gl, ParameterTupleOf!(fp_glGetPixelMapfv) params__) {
		return checkedCall(gl, "getPixelMapfv", fp_glGetPixelMapfv, params__);
	}
	void  getPixelMapuiv(GL gl, ParameterTupleOf!(fp_glGetPixelMapuiv) params__) {
		return checkedCall(gl, "getPixelMapuiv", fp_glGetPixelMapuiv, params__);
	}
	void  getPixelMapusv(GL gl, ParameterTupleOf!(fp_glGetPixelMapusv) params__) {
		return checkedCall(gl, "getPixelMapusv", fp_glGetPixelMapusv, params__);
	}
	void  bitmap(GL gl, ParameterTupleOf!(fp_glBitmap) params__) {
		return checkedCall(gl, "bitmap", fp_glBitmap, params__);
	}
	void  readPixels(GL gl, ParameterTupleOf!(fp_glReadPixels) params__) {
		return checkedCall(gl, "readPixels", fp_glReadPixels, params__);
	}
	void  drawPixels(GL gl, ParameterTupleOf!(fp_glDrawPixels) params__) {
		return checkedCall(gl, "drawPixels", fp_glDrawPixels, params__);
	}
	void  copyPixels(GL gl, ParameterTupleOf!(fp_glCopyPixels) params__) {
		return checkedCall(gl, "copyPixels", fp_glCopyPixels, params__);
	}

	void  stencilFunc(GL gl, ParameterTupleOf!(fp_glStencilFunc) params__) {
		return checkedCall(gl, "stencilFunc", fp_glStencilFunc, params__);
	}
	void  stencilMask(GL gl, ParameterTupleOf!(fp_glStencilMask) params__) {
		return checkedCall(gl, "stencilMask", fp_glStencilMask, params__);
	}
	void  stencilOp(GL gl, ParameterTupleOf!(fp_glStencilOp) params__) {
		return checkedCall(gl, "stencilOp", fp_glStencilOp, params__);
	}
	void  clearStencil(GL gl, ParameterTupleOf!(fp_glClearStencil) params__) {
		return checkedCall(gl, "clearStencil", fp_glClearStencil, params__);
	}

	void  texGend(GL gl, ParameterTupleOf!(fp_glTexGend) params__) {
		return checkedCall(gl, "texGend", fp_glTexGend, params__);
	}
	void  texGenf(GL gl, ParameterTupleOf!(fp_glTexGenf) params__) {
		return checkedCall(gl, "texGenf", fp_glTexGenf, params__);
	}
	void  texGeni(GL gl, ParameterTupleOf!(fp_glTexGeni) params__) {
		return checkedCall(gl, "texGeni", fp_glTexGeni, params__);
	}
	void  texGendv(GL gl, ParameterTupleOf!(fp_glTexGendv) params__) {
		return checkedCall(gl, "texGendv", fp_glTexGendv, params__);
	}
	void  texGenfv(GL gl, ParameterTupleOf!(fp_glTexGenfv) params__) {
		return checkedCall(gl, "texGenfv", fp_glTexGenfv, params__);
	}
	void  texGeniv(GL gl, ParameterTupleOf!(fp_glTexGeniv) params__) {
		return checkedCall(gl, "texGeniv", fp_glTexGeniv, params__);
	}
	void  getTexGendv(GL gl, ParameterTupleOf!(fp_glGetTexGendv) params__) {
		return checkedCall(gl, "getTexGendv", fp_glGetTexGendv, params__);
	}
	void  getTexGenfv(GL gl, ParameterTupleOf!(fp_glGetTexGenfv) params__) {
		return checkedCall(gl, "getTexGenfv", fp_glGetTexGenfv, params__);
	}
	void  getTexGeniv(GL gl, ParameterTupleOf!(fp_glGetTexGeniv) params__) {
		return checkedCall(gl, "getTexGeniv", fp_glGetTexGeniv, params__);
	}
	void  texEnvf(GL gl, ParameterTupleOf!(fp_glTexEnvf) params__) {
		return checkedCall(gl, "texEnvf", fp_glTexEnvf, params__);
	}
	void  texEnvi(GL gl, ParameterTupleOf!(fp_glTexEnvi) params__) {
		return checkedCall(gl, "texEnvi", fp_glTexEnvi, params__);
	}
	void  texEnvfv(GL gl, ParameterTupleOf!(fp_glTexEnvfv) params__) {
		return checkedCall(gl, "texEnvfv", fp_glTexEnvfv, params__);
	}
	void  texEnviv(GL gl, ParameterTupleOf!(fp_glTexEnviv) params__) {
		return checkedCall(gl, "texEnviv", fp_glTexEnviv, params__);
	}
	void  getTexEnvfv(GL gl, ParameterTupleOf!(fp_glGetTexEnvfv) params__) {
		return checkedCall(gl, "getTexEnvfv", fp_glGetTexEnvfv, params__);
	}
	void  getTexEnviv(GL gl, ParameterTupleOf!(fp_glGetTexEnviv) params__) {
		return checkedCall(gl, "getTexEnviv", fp_glGetTexEnviv, params__);
	}
	void  texParameterf(GL gl, ParameterTupleOf!(fp_glTexParameterf) params__) {
		return checkedCall(gl, "texParameterf", fp_glTexParameterf, params__);
	}
	void  texParameteri(GL gl, ParameterTupleOf!(fp_glTexParameteri) params__) {
		return checkedCall(gl, "texParameteri", fp_glTexParameteri, params__);
	}
	void  texParameterfv(GL gl, ParameterTupleOf!(fp_glTexParameterfv) params__) {
		return checkedCall(gl, "texParameterfv", fp_glTexParameterfv, params__);
	}
	void  texParameteriv(GL gl, ParameterTupleOf!(fp_glTexParameteriv) params__) {
		return checkedCall(gl, "texParameteriv", fp_glTexParameteriv, params__);
	}
	void  getTexParameterfv(GL gl, ParameterTupleOf!(fp_glGetTexParameterfv) params__) {
		return checkedCall(gl, "getTexParameterfv", fp_glGetTexParameterfv, params__);
	}
	void  getTexParameteriv(GL gl, ParameterTupleOf!(fp_glGetTexParameteriv) params__) {
		return checkedCall(gl, "getTexParameteriv", fp_glGetTexParameteriv, params__);
	}
	void  getTexLevelParameterfv(GL gl, ParameterTupleOf!(fp_glGetTexLevelParameterfv) params__) {
		return checkedCall(gl, "getTexLevelParameterfv", fp_glGetTexLevelParameterfv, params__);
	}
	void  getTexLevelParameteriv(GL gl, ParameterTupleOf!(fp_glGetTexLevelParameteriv) params__) {
		return checkedCall(gl, "getTexLevelParameteriv", fp_glGetTexLevelParameteriv, params__);
	}
	void  texImage1D(GL gl, ParameterTupleOf!(fp_glTexImage1D) params__) {
		return checkedCall(gl, "texImage1D", fp_glTexImage1D, params__);
	}
	void  texImage2D(GL gl, ParameterTupleOf!(fp_glTexImage2D) params__) {
		return checkedCall(gl, "texImage2D", fp_glTexImage2D, params__);
	}
	void  getTexImage(GL gl, ParameterTupleOf!(fp_glGetTexImage) params__) {
		return checkedCall(gl, "getTexImage", fp_glGetTexImage, params__);
	}

	void  map1d(GL gl, ParameterTupleOf!(fp_glMap1d) params__) {
		return checkedCall(gl, "map1d", fp_glMap1d, params__);
	}
	void  map1f(GL gl, ParameterTupleOf!(fp_glMap1f) params__) {
		return checkedCall(gl, "map1f", fp_glMap1f, params__);
	}
	void  map2d(GL gl, ParameterTupleOf!(fp_glMap2d) params__) {
		return checkedCall(gl, "map2d", fp_glMap2d, params__);
	}
	void  map2f(GL gl, ParameterTupleOf!(fp_glMap2f) params__) {
		return checkedCall(gl, "map2f", fp_glMap2f, params__);
	}
	void  getMapdv(GL gl, ParameterTupleOf!(fp_glGetMapdv) params__) {
		return checkedCall(gl, "getMapdv", fp_glGetMapdv, params__);
	}
	void  getMapfv(GL gl, ParameterTupleOf!(fp_glGetMapfv) params__) {
		return checkedCall(gl, "getMapfv", fp_glGetMapfv, params__);
	}
	void  getMapiv(GL gl, ParameterTupleOf!(fp_glGetMapiv) params__) {
		return checkedCall(gl, "getMapiv", fp_glGetMapiv, params__);
	}
	void  evalCoord1d(GL gl, ParameterTupleOf!(fp_glEvalCoord1d) params__) {
		return checkedCall(gl, "evalCoord1d", fp_glEvalCoord1d, params__);
	}
	void  evalCoord1f(GL gl, ParameterTupleOf!(fp_glEvalCoord1f) params__) {
		return checkedCall(gl, "evalCoord1f", fp_glEvalCoord1f, params__);
	}
	void  evalCoord1dv(GL gl, ParameterTupleOf!(fp_glEvalCoord1dv) params__) {
		return checkedCall(gl, "evalCoord1dv", fp_glEvalCoord1dv, params__);
	}
	void  evalCoord1fv(GL gl, ParameterTupleOf!(fp_glEvalCoord1fv) params__) {
		return checkedCall(gl, "evalCoord1fv", fp_glEvalCoord1fv, params__);
	}
	void  evalCoord2d(GL gl, ParameterTupleOf!(fp_glEvalCoord2d) params__) {
		return checkedCall(gl, "evalCoord2d", fp_glEvalCoord2d, params__);
	}
	void  evalCoord2f(GL gl, ParameterTupleOf!(fp_glEvalCoord2f) params__) {
		return checkedCall(gl, "evalCoord2f", fp_glEvalCoord2f, params__);
	}
	void  evalCoord2dv(GL gl, ParameterTupleOf!(fp_glEvalCoord2dv) params__) {
		return checkedCall(gl, "evalCoord2dv", fp_glEvalCoord2dv, params__);
	}
	void  evalCoord2fv(GL gl, ParameterTupleOf!(fp_glEvalCoord2fv) params__) {
		return checkedCall(gl, "evalCoord2fv", fp_glEvalCoord2fv, params__);
	}
	void  mapGrid1d(GL gl, ParameterTupleOf!(fp_glMapGrid1d) params__) {
		return checkedCall(gl, "mapGrid1d", fp_glMapGrid1d, params__);
	}
	void  mapGrid1f(GL gl, ParameterTupleOf!(fp_glMapGrid1f) params__) {
		return checkedCall(gl, "mapGrid1f", fp_glMapGrid1f, params__);
	}
	void  mapGrid2d(GL gl, ParameterTupleOf!(fp_glMapGrid2d) params__) {
		return checkedCall(gl, "mapGrid2d", fp_glMapGrid2d, params__);
	}
	void  mapGrid2f(GL gl, ParameterTupleOf!(fp_glMapGrid2f) params__) {
		return checkedCall(gl, "mapGrid2f", fp_glMapGrid2f, params__);
	}
	void  evalPoint1(GL gl, ParameterTupleOf!(fp_glEvalPoint1) params__) {
		return checkedCall(gl, "evalPoint1", fp_glEvalPoint1, params__);
	}
	void  evalPoint2(GL gl, ParameterTupleOf!(fp_glEvalPoint2) params__) {
		return checkedCall(gl, "evalPoint2", fp_glEvalPoint2, params__);
	}
	void  evalMesh1(GL gl, ParameterTupleOf!(fp_glEvalMesh1) params__) {
		return checkedCall(gl, "evalMesh1", fp_glEvalMesh1, params__);
	}
	void  evalMesh2(GL gl, ParameterTupleOf!(fp_glEvalMesh2) params__) {
		return checkedCall(gl, "evalMesh2", fp_glEvalMesh2, params__);
	}

	void  fogf(GL gl, ParameterTupleOf!(fp_glFogf) params__) {
		return checkedCall(gl, "fogf", fp_glFogf, params__);
	}
	void  fogi(GL gl, ParameterTupleOf!(fp_glFogi) params__) {
		return checkedCall(gl, "fogi", fp_glFogi, params__);
	}
	void  fogfv(GL gl, ParameterTupleOf!(fp_glFogfv) params__) {
		return checkedCall(gl, "fogfv", fp_glFogfv, params__);
	}
	void  fogiv(GL gl, ParameterTupleOf!(fp_glFogiv) params__) {
		return checkedCall(gl, "fogiv", fp_glFogiv, params__);
	}

	void  feedbackBuffer(GL gl, ParameterTupleOf!(fp_glFeedbackBuffer) params__) {
		return checkedCall(gl, "feedbackBuffer", fp_glFeedbackBuffer, params__);
	}
	void  passThrough(GL gl, ParameterTupleOf!(fp_glPassThrough) params__) {
		return checkedCall(gl, "passThrough", fp_glPassThrough, params__);
	}
	void  selectBuffer(GL gl, ParameterTupleOf!(fp_glSelectBuffer) params__) {
		return checkedCall(gl, "selectBuffer", fp_glSelectBuffer, params__);
	}
	void  initNames(GL gl, ParameterTupleOf!(fp_glInitNames) params__) {
		return checkedCall(gl, "initNames", fp_glInitNames, params__);
	}
	void  loadName(GL gl, ParameterTupleOf!(fp_glLoadName) params__) {
		return checkedCall(gl, "loadName", fp_glLoadName, params__);
	}
	void  pushName(GL gl, ParameterTupleOf!(fp_glPushName) params__) {
		return checkedCall(gl, "pushName", fp_glPushName, params__);
	}
	void  popName(GL gl, ParameterTupleOf!(fp_glPopName) params__) {
		return checkedCall(gl, "popName", fp_glPopName, params__);
	}

	void  genTextures(GL gl, ParameterTupleOf!(fp_glGenTextures) params__) {
		return checkedCall(gl, "genTextures", fp_glGenTextures, params__);
	}
	void  deleteTextures(GL gl, ParameterTupleOf!(fp_glDeleteTextures) params__) {
		return checkedCall(gl, "deleteTextures", fp_glDeleteTextures, params__);
	}
	void  bindTexture(GL gl, ParameterTupleOf!(fp_glBindTexture) params__) {
		return checkedCall(gl, "bindTexture", fp_glBindTexture, params__);
	}
	void  prioritizeTextures(GL gl, ParameterTupleOf!(fp_glPrioritizeTextures) params__) {
		return checkedCall(gl, "prioritizeTextures", fp_glPrioritizeTextures, params__);
	}
	GLboolean  areTexturesResident(GL gl, ParameterTupleOf!(fp_glAreTexturesResident) params__) {
		return checkedCall(gl, "areTexturesResident", fp_glAreTexturesResident, params__);
	}
	GLboolean  isTexture(GL gl, ParameterTupleOf!(fp_glIsTexture) params__) {
		return checkedCall(gl, "isTexture", fp_glIsTexture, params__);
	}

	void  texSubImage1D(GL gl, ParameterTupleOf!(fp_glTexSubImage1D) params__) {
		return checkedCall(gl, "texSubImage1D", fp_glTexSubImage1D, params__);
	}
	void  texSubImage2D(GL gl, ParameterTupleOf!(fp_glTexSubImage2D) params__) {
		return checkedCall(gl, "texSubImage2D", fp_glTexSubImage2D, params__);
	}
	void  copyTexImage1D(GL gl, ParameterTupleOf!(fp_glCopyTexImage1D) params__) {
		return checkedCall(gl, "copyTexImage1D", fp_glCopyTexImage1D, params__);
	}
	void  copyTexImage2D(GL gl, ParameterTupleOf!(fp_glCopyTexImage2D) params__) {
		return checkedCall(gl, "copyTexImage2D", fp_glCopyTexImage2D, params__);
	}
	void  copyTexSubImage1D(GL gl, ParameterTupleOf!(fp_glCopyTexSubImage1D) params__) {
		return checkedCall(gl, "copyTexSubImage1D", fp_glCopyTexSubImage1D, params__);
	}
	void  copyTexSubImage2D(GL gl, ParameterTupleOf!(fp_glCopyTexSubImage2D) params__) {
		return checkedCall(gl, "copyTexSubImage2D", fp_glCopyTexSubImage2D, params__);
	}

	void  vertexPointer(GL gl, ParameterTupleOf!(fp_glVertexPointer) params__) {
		return checkedCall(gl, "vertexPointer", fp_glVertexPointer, params__);
	}
	void  normalPointer(GL gl, ParameterTupleOf!(fp_glNormalPointer) params__) {
		return checkedCall(gl, "normalPointer", fp_glNormalPointer, params__);
	}
	void  colorPointer(GL gl, ParameterTupleOf!(fp_glColorPointer) params__) {
		return checkedCall(gl, "colorPointer", fp_glColorPointer, params__);
	}
	void  indexPointer(GL gl, ParameterTupleOf!(fp_glIndexPointer) params__) {
		return checkedCall(gl, "indexPointer", fp_glIndexPointer, params__);
	}
	void  texCoordPointer(GL gl, ParameterTupleOf!(fp_glTexCoordPointer) params__) {
		return checkedCall(gl, "texCoordPointer", fp_glTexCoordPointer, params__);
	}
	void  edgeFlagPointer(GL gl, ParameterTupleOf!(fp_glEdgeFlagPointer) params__) {
		return checkedCall(gl, "edgeFlagPointer", fp_glEdgeFlagPointer, params__);
	}
	void  getPointerv(GL gl, ParameterTupleOf!(fp_glGetPointerv) params__) {
		return checkedCall(gl, "getPointerv", fp_glGetPointerv, params__);
	}
	void  arrayElement(GL gl, ParameterTupleOf!(fp_glArrayElement) params__) {
		return checkedCall(gl, "arrayElement", fp_glArrayElement, params__);
	}
	void  drawArrays(GL gl, ParameterTupleOf!(fp_glDrawArrays) params__) {
		return checkedCall(gl, "drawArrays", fp_glDrawArrays, params__);
	}
	void  drawElements(GL gl, ParameterTupleOf!(fp_glDrawElements) params__) {
		return checkedCall(gl, "drawElements", fp_glDrawElements, params__);
	}
	void  interleavedArrays(GL gl, ParameterTupleOf!(fp_glInterleavedArrays) params__) {
		return checkedCall(gl, "interleavedArrays", fp_glInterleavedArrays, params__);
	}+/
}



void loadCoreFunctions_(void* function(char*) loadFuncFromLib) {
	// could check all but what the hell...
	if (fp_glInterleavedArrays !is null) return;

	*cast(void**)&fp_glClearIndex = loadFuncFromLib(cast(char*)"glClearIndex");
	*cast(void**)&fp_glClearColor = loadFuncFromLib(cast(char*)"glClearColor");
	*cast(void**)&fp_glClear = loadFuncFromLib(cast(char*)"glClear");
	*cast(void**)&fp_glIndexMask = loadFuncFromLib(cast(char*)"glIndexMask");
	*cast(void**)&fp_glColorMask = loadFuncFromLib(cast(char*)"glColorMask");
	*cast(void**)&fp_glAlphaFunc = loadFuncFromLib(cast(char*)"glAlphaFunc");
	*cast(void**)&fp_glBlendFunc = loadFuncFromLib(cast(char*)"glBlendFunc");
	*cast(void**)&fp_glLogicOp = loadFuncFromLib(cast(char*)"glLogicOp");
	*cast(void**)&fp_glCullFace = loadFuncFromLib(cast(char*)"glCullFace");
	*cast(void**)&fp_glFrontFace = loadFuncFromLib(cast(char*)"glFrontFace");
	*cast(void**)&fp_glPointSize = loadFuncFromLib(cast(char*)"glPointSize");
	*cast(void**)&fp_glLineWidth = loadFuncFromLib(cast(char*)"glLineWidth");
	*cast(void**)&fp_glLineStipple = loadFuncFromLib(cast(char*)"glLineStipple");
	*cast(void**)&fp_glPolygonMode = loadFuncFromLib(cast(char*)"glPolygonMode");
	*cast(void**)&fp_glPolygonOffset = loadFuncFromLib(cast(char*)"glPolygonOffset");
	*cast(void**)&fp_glPolygonStipple = loadFuncFromLib(cast(char*)"glPolygonStipple");
	*cast(void**)&fp_glGetPolygonStipple = loadFuncFromLib(cast(char*)"glGetPolygonStipple");
	*cast(void**)&fp_glEdgeFlag = loadFuncFromLib(cast(char*)"glEdgeFlag");
	*cast(void**)&fp_glEdgeFlagv = loadFuncFromLib(cast(char*)"glEdgeFlagv");
	*cast(void**)&fp_glScissor = loadFuncFromLib(cast(char*)"glScissor");
	*cast(void**)&fp_glClipPlane = loadFuncFromLib(cast(char*)"glClipPlane");
	*cast(void**)&fp_glGetClipPlane = loadFuncFromLib(cast(char*)"glGetClipPlane");
	*cast(void**)&fp_glDrawBuffer = loadFuncFromLib(cast(char*)"glDrawBuffer");
	*cast(void**)&fp_glReadBuffer = loadFuncFromLib(cast(char*)"glReadBuffer");
	*cast(void**)&fp_glEnable = loadFuncFromLib(cast(char*)"glEnable");
	*cast(void**)&fp_glDisable = loadFuncFromLib(cast(char*)"glDisable");
	*cast(void**)&fp_glIsEnabled = loadFuncFromLib(cast(char*)"glIsEnabled");
	*cast(void**)&fp_glEnableClientState = loadFuncFromLib(cast(char*)"glEnableClientState");
	*cast(void**)&fp_glDisableClientState = loadFuncFromLib(cast(char*)"glDisableClientState");
	*cast(void**)&fp_glGetBooleanv = loadFuncFromLib(cast(char*)"glGetBooleanv");
	*cast(void**)&fp_glGetDoublev = loadFuncFromLib(cast(char*)"glGetDoublev");
	*cast(void**)&fp_glGetFloatv = loadFuncFromLib(cast(char*)"glGetFloatv");
	*cast(void**)&fp_glGetIntegerv = loadFuncFromLib(cast(char*)"glGetIntegerv");
	*cast(void**)&fp_glPushAttrib = loadFuncFromLib(cast(char*)"glPushAttrib");
	*cast(void**)&fp_glPopAttrib = loadFuncFromLib(cast(char*)"glPopAttrib");
	*cast(void**)&fp_glPushClientAttrib = loadFuncFromLib(cast(char*)"glPushClientAttrib");
	*cast(void**)&fp_glPopClientAttrib = loadFuncFromLib(cast(char*)"glPopClientAttrib");
	*cast(void**)&fp_glRenderMode = loadFuncFromLib(cast(char*)"glRenderMode");
	*cast(void**)&fp_glGetError = loadFuncFromLib(cast(char*)"glGetError");
	*cast(void**)&fp_glGetString = loadFuncFromLib(cast(char*)"glGetString");
	*cast(void**)&fp_glFinish = loadFuncFromLib(cast(char*)"glFinish");
	*cast(void**)&fp_glFlush = loadFuncFromLib(cast(char*)"glFlush");
	*cast(void**)&fp_glHint = loadFuncFromLib(cast(char*)"glHint");


	*cast(void**)&fp_glClearDepth = loadFuncFromLib(cast(char*)"glClearDepth");
	*cast(void**)&fp_glDepthFunc = loadFuncFromLib(cast(char*)"glDepthFunc");
	*cast(void**)&fp_glDepthMask = loadFuncFromLib(cast(char*)"glDepthMask");
	*cast(void**)&fp_glDepthRange = loadFuncFromLib(cast(char*)"glDepthRange");

	*cast(void**)&fp_glClearAccum = loadFuncFromLib(cast(char*)"glClearAccum");
	*cast(void**)&fp_glAccum = loadFuncFromLib(cast(char*)"glAccum");

	*cast(void**)&fp_glMatrixMode = loadFuncFromLib(cast(char*)"glMatrixMode");
	*cast(void**)&fp_glOrtho = loadFuncFromLib(cast(char*)"glOrtho");
	*cast(void**)&fp_glFrustum = loadFuncFromLib(cast(char*)"glFrustum");
	*cast(void**)&fp_glViewport = loadFuncFromLib(cast(char*)"glViewport");
	*cast(void**)&fp_glPushMatrix = loadFuncFromLib(cast(char*)"glPushMatrix");
	*cast(void**)&fp_glPopMatrix = loadFuncFromLib(cast(char*)"glPopMatrix");
	*cast(void**)&fp_glLoadIdentity = loadFuncFromLib(cast(char*)"glLoadIdentity");
	*cast(void**)&fp_glLoadMatrixd = loadFuncFromLib(cast(char*)"glLoadMatrixd");
	*cast(void**)&fp_glLoadMatrixf = loadFuncFromLib(cast(char*)"glLoadMatrixf");
	*cast(void**)&fp_glMultMatrixd = loadFuncFromLib(cast(char*)"glMultMatrixd");
	*cast(void**)&fp_glMultMatrixf = loadFuncFromLib(cast(char*)"glMultMatrixf");
	*cast(void**)&fp_glRotated = loadFuncFromLib(cast(char*)"glRotated");
	*cast(void**)&fp_glRotatef = loadFuncFromLib(cast(char*)"glRotatef");
	*cast(void**)&fp_glScaled = loadFuncFromLib(cast(char*)"glScaled");
	*cast(void**)&fp_glScalef = loadFuncFromLib(cast(char*)"glScalef");
	*cast(void**)&fp_glTranslated = loadFuncFromLib(cast(char*)"glTranslated");
	*cast(void**)&fp_glTranslatef = loadFuncFromLib(cast(char*)"glTranslatef");

	*cast(void**)&fp_glIsList = loadFuncFromLib(cast(char*)"glIsList");
	*cast(void**)&fp_glDeleteLists = loadFuncFromLib(cast(char*)"glDeleteLists");
	*cast(void**)&fp_glGenLists = loadFuncFromLib(cast(char*)"glGenLists");
	*cast(void**)&fp_glNewList = loadFuncFromLib(cast(char*)"glNewList");
	*cast(void**)&fp_glEndList = loadFuncFromLib(cast(char*)"glEndList");
	*cast(void**)&fp_glCallList = loadFuncFromLib(cast(char*)"glCallList");
	*cast(void**)&fp_glCallLists = loadFuncFromLib(cast(char*)"glCallLists");
	*cast(void**)&fp_glListBase = loadFuncFromLib(cast(char*)"glListBase");

	*cast(void**)&fp_glBegin = loadFuncFromLib(cast(char*)"glBegin");
	*cast(void**)&fp_glEnd = loadFuncFromLib(cast(char*)"glEnd");
	*cast(void**)&fp_glVertex2d = loadFuncFromLib(cast(char*)"glVertex2d");
	*cast(void**)&fp_glVertex2f = loadFuncFromLib(cast(char*)"glVertex2f");
	*cast(void**)&fp_glVertex2i = loadFuncFromLib(cast(char*)"glVertex2i");
	*cast(void**)&fp_glVertex2s = loadFuncFromLib(cast(char*)"glVertex2s");
	*cast(void**)&fp_glVertex3d = loadFuncFromLib(cast(char*)"glVertex3d");
	*cast(void**)&fp_glVertex3f = loadFuncFromLib(cast(char*)"glVertex3f");
	*cast(void**)&fp_glVertex3i = loadFuncFromLib(cast(char*)"glVertex3i");
	*cast(void**)&fp_glVertex3s = loadFuncFromLib(cast(char*)"glVertex3s");
	*cast(void**)&fp_glVertex4d = loadFuncFromLib(cast(char*)"glVertex4d");
	*cast(void**)&fp_glVertex4f = loadFuncFromLib(cast(char*)"glVertex4f");
	*cast(void**)&fp_glVertex4i = loadFuncFromLib(cast(char*)"glVertex4i");
	*cast(void**)&fp_glVertex4s = loadFuncFromLib(cast(char*)"glVertex4s");
	*cast(void**)&fp_glVertex2dv = loadFuncFromLib(cast(char*)"glVertex2dv");
	*cast(void**)&fp_glVertex2fv = loadFuncFromLib(cast(char*)"glVertex2fv");
	*cast(void**)&fp_glVertex2iv = loadFuncFromLib(cast(char*)"glVertex2iv");
	*cast(void**)&fp_glVertex2sv = loadFuncFromLib(cast(char*)"glVertex2sv");
	*cast(void**)&fp_glVertex3dv = loadFuncFromLib(cast(char*)"glVertex3dv");
	*cast(void**)&fp_glVertex3fv = loadFuncFromLib(cast(char*)"glVertex3fv");
	*cast(void**)&fp_glVertex3iv = loadFuncFromLib(cast(char*)"glVertex3iv");
	*cast(void**)&fp_glVertex3sv = loadFuncFromLib(cast(char*)"glVertex3sv");
	*cast(void**)&fp_glVertex4dv = loadFuncFromLib(cast(char*)"glVertex4dv");
	*cast(void**)&fp_glVertex4fv = loadFuncFromLib(cast(char*)"glVertex4fv");
	*cast(void**)&fp_glVertex4iv = loadFuncFromLib(cast(char*)"glVertex4iv");
	*cast(void**)&fp_glVertex4sv = loadFuncFromLib(cast(char*)"glVertex4sv");
	*cast(void**)&fp_glNormal3b = loadFuncFromLib(cast(char*)"glNormal3b");
	*cast(void**)&fp_glNormal3d = loadFuncFromLib(cast(char*)"glNormal3d");
	*cast(void**)&fp_glNormal3f = loadFuncFromLib(cast(char*)"glNormal3f");
	*cast(void**)&fp_glNormal3i = loadFuncFromLib(cast(char*)"glNormal3i");
	*cast(void**)&fp_glNormal3s = loadFuncFromLib(cast(char*)"glNormal3s");
	*cast(void**)&fp_glNormal3bv = loadFuncFromLib(cast(char*)"glNormal3bv");
	*cast(void**)&fp_glNormal3dv = loadFuncFromLib(cast(char*)"glNormal3dv");
	*cast(void**)&fp_glNormal3fv = loadFuncFromLib(cast(char*)"glNormal3fv");
	*cast(void**)&fp_glNormal3iv = loadFuncFromLib(cast(char*)"glNormal3iv");
	*cast(void**)&fp_glNormal3sv = loadFuncFromLib(cast(char*)"glNormal3sv");
	*cast(void**)&fp_glIndexd = loadFuncFromLib(cast(char*)"glIndexd");
	*cast(void**)&fp_glIndexf = loadFuncFromLib(cast(char*)"glIndexf");
	*cast(void**)&fp_glIndexi = loadFuncFromLib(cast(char*)"glIndexi");
	*cast(void**)&fp_glIndexs = loadFuncFromLib(cast(char*)"glIndexs");
	*cast(void**)&fp_glIndexub = loadFuncFromLib(cast(char*)"glIndexub");
	*cast(void**)&fp_glIndexdv = loadFuncFromLib(cast(char*)"glIndexdv");
	*cast(void**)&fp_glIndexfv = loadFuncFromLib(cast(char*)"glIndexfv");
	*cast(void**)&fp_glIndexiv = loadFuncFromLib(cast(char*)"glIndexiv");
	*cast(void**)&fp_glIndexsv = loadFuncFromLib(cast(char*)"glIndexsv");
	*cast(void**)&fp_glIndexubv = loadFuncFromLib(cast(char*)"glIndexubv");
	*cast(void**)&fp_glColor3b = loadFuncFromLib(cast(char*)"glColor3b");
	*cast(void**)&fp_glColor3d = loadFuncFromLib(cast(char*)"glColor3d");
	*cast(void**)&fp_glColor3f = loadFuncFromLib(cast(char*)"glColor3f");
	*cast(void**)&fp_glColor3i = loadFuncFromLib(cast(char*)"glColor3i");
	*cast(void**)&fp_glColor3s = loadFuncFromLib(cast(char*)"glColor3s");
	*cast(void**)&fp_glColor3ub = loadFuncFromLib(cast(char*)"glColor3ub");
	*cast(void**)&fp_glColor3ui = loadFuncFromLib(cast(char*)"glColor3ui");
	*cast(void**)&fp_glColor3us = loadFuncFromLib(cast(char*)"glColor3us");
	*cast(void**)&fp_glColor4b = loadFuncFromLib(cast(char*)"glColor4b");
	*cast(void**)&fp_glColor4d = loadFuncFromLib(cast(char*)"glColor4d");
	*cast(void**)&fp_glColor4f = loadFuncFromLib(cast(char*)"glColor4f");
	*cast(void**)&fp_glColor4i = loadFuncFromLib(cast(char*)"glColor4i");
	*cast(void**)&fp_glColor4s = loadFuncFromLib(cast(char*)"glColor4s");
	*cast(void**)&fp_glColor4ub = loadFuncFromLib(cast(char*)"glColor4ub");
	*cast(void**)&fp_glColor4ui = loadFuncFromLib(cast(char*)"glColor4ui");
	*cast(void**)&fp_glColor4us = loadFuncFromLib(cast(char*)"glColor4us");
	*cast(void**)&fp_glColor3bv = loadFuncFromLib(cast(char*)"glColor3bv");
	*cast(void**)&fp_glColor3dv = loadFuncFromLib(cast(char*)"glColor3dv");
	*cast(void**)&fp_glColor3fv = loadFuncFromLib(cast(char*)"glColor3fv");
	*cast(void**)&fp_glColor3iv = loadFuncFromLib(cast(char*)"glColor3iv");
	*cast(void**)&fp_glColor3sv = loadFuncFromLib(cast(char*)"glColor3sv");
	*cast(void**)&fp_glColor3ubv = loadFuncFromLib(cast(char*)"glColor3ubv");
	*cast(void**)&fp_glColor3uiv = loadFuncFromLib(cast(char*)"glColor3uiv");
	*cast(void**)&fp_glColor3usv = loadFuncFromLib(cast(char*)"glColor3usv");
	*cast(void**)&fp_glColor4bv = loadFuncFromLib(cast(char*)"glColor4bv");
	*cast(void**)&fp_glColor4dv = loadFuncFromLib(cast(char*)"glColor4dv");
	*cast(void**)&fp_glColor4fv = loadFuncFromLib(cast(char*)"glColor4fv");
	*cast(void**)&fp_glColor4iv = loadFuncFromLib(cast(char*)"glColor4iv");
	*cast(void**)&fp_glColor4sv = loadFuncFromLib(cast(char*)"glColor4sv");
	*cast(void**)&fp_glColor4ubv = loadFuncFromLib(cast(char*)"glColor4ubv");
	*cast(void**)&fp_glColor4uiv = loadFuncFromLib(cast(char*)"glColor4uiv");
	*cast(void**)&fp_glColor4usv = loadFuncFromLib(cast(char*)"glColor4usv");
	*cast(void**)&fp_glTexCoord1d = loadFuncFromLib(cast(char*)"glTexCoord1d");
	*cast(void**)&fp_glTexCoord1f = loadFuncFromLib(cast(char*)"glTexCoord1f");
	*cast(void**)&fp_glTexCoord1i = loadFuncFromLib(cast(char*)"glTexCoord1i");
	*cast(void**)&fp_glTexCoord1s = loadFuncFromLib(cast(char*)"glTexCoord1s");
	*cast(void**)&fp_glTexCoord2d = loadFuncFromLib(cast(char*)"glTexCoord2d");
	*cast(void**)&fp_glTexCoord2f = loadFuncFromLib(cast(char*)"glTexCoord2f");
	*cast(void**)&fp_glTexCoord2i = loadFuncFromLib(cast(char*)"glTexCoord2i");
	*cast(void**)&fp_glTexCoord2s = loadFuncFromLib(cast(char*)"glTexCoord2s");
	*cast(void**)&fp_glTexCoord3d = loadFuncFromLib(cast(char*)"glTexCoord3d");
	*cast(void**)&fp_glTexCoord3f = loadFuncFromLib(cast(char*)"glTexCoord3f");
	*cast(void**)&fp_glTexCoord3i = loadFuncFromLib(cast(char*)"glTexCoord3i");
	*cast(void**)&fp_glTexCoord3s = loadFuncFromLib(cast(char*)"glTexCoord3s");
	*cast(void**)&fp_glTexCoord4d = loadFuncFromLib(cast(char*)"glTexCoord4d");
	*cast(void**)&fp_glTexCoord4f = loadFuncFromLib(cast(char*)"glTexCoord4f");
	*cast(void**)&fp_glTexCoord4i = loadFuncFromLib(cast(char*)"glTexCoord4i");
	*cast(void**)&fp_glTexCoord4s = loadFuncFromLib(cast(char*)"glTexCoord4s");
	*cast(void**)&fp_glTexCoord1dv = loadFuncFromLib(cast(char*)"glTexCoord1dv");
	*cast(void**)&fp_glTexCoord1fv = loadFuncFromLib(cast(char*)"glTexCoord1fv");
	*cast(void**)&fp_glTexCoord1iv = loadFuncFromLib(cast(char*)"glTexCoord1iv");
	*cast(void**)&fp_glTexCoord1sv = loadFuncFromLib(cast(char*)"glTexCoord1sv");
	*cast(void**)&fp_glTexCoord2dv = loadFuncFromLib(cast(char*)"glTexCoord2dv");
	*cast(void**)&fp_glTexCoord2fv = loadFuncFromLib(cast(char*)"glTexCoord2fv");
	*cast(void**)&fp_glTexCoord2iv = loadFuncFromLib(cast(char*)"glTexCoord2iv");
	*cast(void**)&fp_glTexCoord2sv = loadFuncFromLib(cast(char*)"glTexCoord2sv");
	*cast(void**)&fp_glTexCoord3dv = loadFuncFromLib(cast(char*)"glTexCoord3dv");
	*cast(void**)&fp_glTexCoord3fv = loadFuncFromLib(cast(char*)"glTexCoord3fv");
	*cast(void**)&fp_glTexCoord3iv = loadFuncFromLib(cast(char*)"glTexCoord3iv");
	*cast(void**)&fp_glTexCoord3sv = loadFuncFromLib(cast(char*)"glTexCoord3sv");
	*cast(void**)&fp_glTexCoord4dv = loadFuncFromLib(cast(char*)"glTexCoord4dv");
	*cast(void**)&fp_glTexCoord4fv = loadFuncFromLib(cast(char*)"glTexCoord4fv");
	*cast(void**)&fp_glTexCoord4iv = loadFuncFromLib(cast(char*)"glTexCoord4iv");
	*cast(void**)&fp_glTexCoord4sv = loadFuncFromLib(cast(char*)"glTexCoord4sv");
	*cast(void**)&fp_glRasterPos2d = loadFuncFromLib(cast(char*)"glRasterPos2d");
	*cast(void**)&fp_glRasterPos2f = loadFuncFromLib(cast(char*)"glRasterPos2f");
	*cast(void**)&fp_glRasterPos2i = loadFuncFromLib(cast(char*)"glRasterPos2i");
	*cast(void**)&fp_glRasterPos2s = loadFuncFromLib(cast(char*)"glRasterPos2s");
	*cast(void**)&fp_glRasterPos3d = loadFuncFromLib(cast(char*)"glRasterPos3d");
	*cast(void**)&fp_glRasterPos3f = loadFuncFromLib(cast(char*)"glRasterPos3f");
	*cast(void**)&fp_glRasterPos3i = loadFuncFromLib(cast(char*)"glRasterPos3i");
	*cast(void**)&fp_glRasterPos3s = loadFuncFromLib(cast(char*)"glRasterPos3s");
	*cast(void**)&fp_glRasterPos4d = loadFuncFromLib(cast(char*)"glRasterPos4d");
	*cast(void**)&fp_glRasterPos4f = loadFuncFromLib(cast(char*)"glRasterPos4f");
	*cast(void**)&fp_glRasterPos4i = loadFuncFromLib(cast(char*)"glRasterPos4i");
	*cast(void**)&fp_glRasterPos4s = loadFuncFromLib(cast(char*)"glRasterPos4s");
	*cast(void**)&fp_glRasterPos2dv = loadFuncFromLib(cast(char*)"glRasterPos2dv");
	*cast(void**)&fp_glRasterPos2fv = loadFuncFromLib(cast(char*)"glRasterPos2fv");
	*cast(void**)&fp_glRasterPos2iv = loadFuncFromLib(cast(char*)"glRasterPos2iv");
	*cast(void**)&fp_glRasterPos2sv = loadFuncFromLib(cast(char*)"glRasterPos2sv");
	*cast(void**)&fp_glRasterPos3dv = loadFuncFromLib(cast(char*)"glRasterPos3dv");
	*cast(void**)&fp_glRasterPos3fv = loadFuncFromLib(cast(char*)"glRasterPos3fv");
	*cast(void**)&fp_glRasterPos3iv = loadFuncFromLib(cast(char*)"glRasterPos3iv");
	*cast(void**)&fp_glRasterPos3sv = loadFuncFromLib(cast(char*)"glRasterPos3sv");
	*cast(void**)&fp_glRasterPos4dv = loadFuncFromLib(cast(char*)"glRasterPos4dv");
	*cast(void**)&fp_glRasterPos4fv = loadFuncFromLib(cast(char*)"glRasterPos4fv");
	*cast(void**)&fp_glRasterPos4iv = loadFuncFromLib(cast(char*)"glRasterPos4iv");
	*cast(void**)&fp_glRasterPos4sv = loadFuncFromLib(cast(char*)"glRasterPos4sv");
	*cast(void**)&fp_glRectd = loadFuncFromLib(cast(char*)"glRectd");
	*cast(void**)&fp_glRectf = loadFuncFromLib(cast(char*)"glRectf");
	*cast(void**)&fp_glRecti = loadFuncFromLib(cast(char*)"glRecti");
	*cast(void**)&fp_glRects = loadFuncFromLib(cast(char*)"glRects");
	*cast(void**)&fp_glRectdv = loadFuncFromLib(cast(char*)"glRectdv");
	*cast(void**)&fp_glRectfv = loadFuncFromLib(cast(char*)"glRectfv");
	*cast(void**)&fp_glRectiv = loadFuncFromLib(cast(char*)"glRectiv");
	*cast(void**)&fp_glRectsv = loadFuncFromLib(cast(char*)"glRectsv");

	*cast(void**)&fp_glShadeModel = loadFuncFromLib(cast(char*)"glShadeModel");
	*cast(void**)&fp_glLightf = loadFuncFromLib(cast(char*)"glLightf");
	*cast(void**)&fp_glLighti = loadFuncFromLib(cast(char*)"glLighti");
	*cast(void**)&fp_glLightfv = loadFuncFromLib(cast(char*)"glLightfv");
	*cast(void**)&fp_glLightiv = loadFuncFromLib(cast(char*)"glLightiv");
	*cast(void**)&fp_glGetLightfv = loadFuncFromLib(cast(char*)"glGetLightfv");
	*cast(void**)&fp_glGetLightiv = loadFuncFromLib(cast(char*)"glGetLightiv");
	*cast(void**)&fp_glLightModelf = loadFuncFromLib(cast(char*)"glLightModelf");
	*cast(void**)&fp_glLightModeli = loadFuncFromLib(cast(char*)"glLightModeli");
	*cast(void**)&fp_glLightModelfv = loadFuncFromLib(cast(char*)"glLightModelfv");
	*cast(void**)&fp_glLightModeliv = loadFuncFromLib(cast(char*)"glLightModeliv");
	*cast(void**)&fp_glMaterialf = loadFuncFromLib(cast(char*)"glMaterialf");
	*cast(void**)&fp_glMateriali = loadFuncFromLib(cast(char*)"glMateriali");
	*cast(void**)&fp_glMaterialfv = loadFuncFromLib(cast(char*)"glMaterialfv");
	*cast(void**)&fp_glMaterialiv = loadFuncFromLib(cast(char*)"glMaterialiv");
	*cast(void**)&fp_glGetMaterialfv = loadFuncFromLib(cast(char*)"glGetMaterialfv");
	*cast(void**)&fp_glGetMaterialiv = loadFuncFromLib(cast(char*)"glGetMaterialiv");
	*cast(void**)&fp_glColorMaterial = loadFuncFromLib(cast(char*)"glColorMaterial");

	*cast(void**)&fp_glPixelZoom = loadFuncFromLib(cast(char*)"glPixelZoom");
	*cast(void**)&fp_glPixelStoref = loadFuncFromLib(cast(char*)"glPixelStoref");
	*cast(void**)&fp_glPixelStorei = loadFuncFromLib(cast(char*)"glPixelStorei");
	*cast(void**)&fp_glPixelTransferf = loadFuncFromLib(cast(char*)"glPixelTransferf");
	*cast(void**)&fp_glPixelTransferi = loadFuncFromLib(cast(char*)"glPixelTransferi");
	*cast(void**)&fp_glPixelMapfv = loadFuncFromLib(cast(char*)"glPixelMapfv");
	*cast(void**)&fp_glPixelMapuiv = loadFuncFromLib(cast(char*)"glPixelMapuiv");
	*cast(void**)&fp_glPixelMapusv = loadFuncFromLib(cast(char*)"glPixelMapusv");
	*cast(void**)&fp_glGetPixelMapfv = loadFuncFromLib(cast(char*)"glGetPixelMapfv");
	*cast(void**)&fp_glGetPixelMapuiv = loadFuncFromLib(cast(char*)"glGetPixelMapuiv");
	*cast(void**)&fp_glGetPixelMapusv = loadFuncFromLib(cast(char*)"glGetPixelMapusv");
	*cast(void**)&fp_glBitmap = loadFuncFromLib(cast(char*)"glBitmap");
	*cast(void**)&fp_glReadPixels = loadFuncFromLib(cast(char*)"glReadPixels");
	*cast(void**)&fp_glDrawPixels = loadFuncFromLib(cast(char*)"glDrawPixels");
	*cast(void**)&fp_glCopyPixels = loadFuncFromLib(cast(char*)"glCopyPixels");

	*cast(void**)&fp_glStencilFunc = loadFuncFromLib(cast(char*)"glStencilFunc");
	*cast(void**)&fp_glStencilMask = loadFuncFromLib(cast(char*)"glStencilMask");
	*cast(void**)&fp_glStencilOp = loadFuncFromLib(cast(char*)"glStencilOp");
	*cast(void**)&fp_glClearStencil = loadFuncFromLib(cast(char*)"glClearStencil");

	*cast(void**)&fp_glTexGend = loadFuncFromLib(cast(char*)"glTexGend");
	*cast(void**)&fp_glTexGenf = loadFuncFromLib(cast(char*)"glTexGenf");
	*cast(void**)&fp_glTexGeni = loadFuncFromLib(cast(char*)"glTexGeni");
	*cast(void**)&fp_glTexGendv = loadFuncFromLib(cast(char*)"glTexGendv");
	*cast(void**)&fp_glTexGenfv = loadFuncFromLib(cast(char*)"glTexGenfv");
	*cast(void**)&fp_glTexGeniv = loadFuncFromLib(cast(char*)"glTexGeniv");
	*cast(void**)&fp_glGetTexGendv = loadFuncFromLib(cast(char*)"glGetTexGendv");
	*cast(void**)&fp_glGetTexGenfv = loadFuncFromLib(cast(char*)"glGetTexGenfv");
	*cast(void**)&fp_glGetTexGeniv = loadFuncFromLib(cast(char*)"glGetTexGeniv");
	*cast(void**)&fp_glTexEnvf = loadFuncFromLib(cast(char*)"glTexEnvf");
	*cast(void**)&fp_glTexEnvi = loadFuncFromLib(cast(char*)"glTexEnvi");
	*cast(void**)&fp_glTexEnvfv = loadFuncFromLib(cast(char*)"glTexEnvfv");
	*cast(void**)&fp_glTexEnviv = loadFuncFromLib(cast(char*)"glTexEnviv");
	*cast(void**)&fp_glGetTexEnvfv = loadFuncFromLib(cast(char*)"glGetTexEnvfv");
	*cast(void**)&fp_glGetTexEnviv = loadFuncFromLib(cast(char*)"glGetTexEnviv");
	*cast(void**)&fp_glTexParameterf = loadFuncFromLib(cast(char*)"glTexParameterf");
	*cast(void**)&fp_glTexParameteri = loadFuncFromLib(cast(char*)"glTexParameteri");
	*cast(void**)&fp_glTexParameterfv = loadFuncFromLib(cast(char*)"glTexParameterfv");
	*cast(void**)&fp_glTexParameteriv = loadFuncFromLib(cast(char*)"glTexParameteriv");
	*cast(void**)&fp_glGetTexParameterfv = loadFuncFromLib(cast(char*)"glGetTexParameterfv");
	*cast(void**)&fp_glGetTexParameteriv = loadFuncFromLib(cast(char*)"glGetTexParameteriv");
	*cast(void**)&fp_glGetTexLevelParameterfv = loadFuncFromLib(cast(char*)"glGetTexLevelParameterfv");
	*cast(void**)&fp_glGetTexLevelParameteriv = loadFuncFromLib(cast(char*)"glGetTexLevelParameteriv");
	*cast(void**)&fp_glTexImage1D = loadFuncFromLib(cast(char*)"glTexImage1D");
	*cast(void**)&fp_glTexImage2D = loadFuncFromLib(cast(char*)"glTexImage2D");
	*cast(void**)&fp_glGetTexImage = loadFuncFromLib(cast(char*)"glGetTexImage");

	*cast(void**)&fp_glMap1d = loadFuncFromLib(cast(char*)"glMap1d");
	*cast(void**)&fp_glMap1f = loadFuncFromLib(cast(char*)"glMap1f");
	*cast(void**)&fp_glMap2d = loadFuncFromLib(cast(char*)"glMap2d");
	*cast(void**)&fp_glMap2f = loadFuncFromLib(cast(char*)"glMap2f");
	*cast(void**)&fp_glGetMapdv = loadFuncFromLib(cast(char*)"glGetMapdv");
	*cast(void**)&fp_glGetMapfv = loadFuncFromLib(cast(char*)"glGetMapfv");
	*cast(void**)&fp_glGetMapiv = loadFuncFromLib(cast(char*)"glGetMapiv");
	*cast(void**)&fp_glEvalCoord1d = loadFuncFromLib(cast(char*)"glEvalCoord1d");
	*cast(void**)&fp_glEvalCoord1f = loadFuncFromLib(cast(char*)"glEvalCoord1f");
	*cast(void**)&fp_glEvalCoord1dv = loadFuncFromLib(cast(char*)"glEvalCoord1dv");
	*cast(void**)&fp_glEvalCoord1fv = loadFuncFromLib(cast(char*)"glEvalCoord1fv");
	*cast(void**)&fp_glEvalCoord2d = loadFuncFromLib(cast(char*)"glEvalCoord2d");
	*cast(void**)&fp_glEvalCoord2f = loadFuncFromLib(cast(char*)"glEvalCoord2f");
	*cast(void**)&fp_glEvalCoord2dv = loadFuncFromLib(cast(char*)"glEvalCoord2dv");
	*cast(void**)&fp_glEvalCoord2fv = loadFuncFromLib(cast(char*)"glEvalCoord2fv");
	*cast(void**)&fp_glMapGrid1d = loadFuncFromLib(cast(char*)"glMapGrid1d");
	*cast(void**)&fp_glMapGrid1f = loadFuncFromLib(cast(char*)"glMapGrid1f");
	*cast(void**)&fp_glMapGrid2d = loadFuncFromLib(cast(char*)"glMapGrid2d");
	*cast(void**)&fp_glMapGrid2f = loadFuncFromLib(cast(char*)"glMapGrid2f");
	*cast(void**)&fp_glEvalPoint1 = loadFuncFromLib(cast(char*)"glEvalPoint1");
	*cast(void**)&fp_glEvalPoint2 = loadFuncFromLib(cast(char*)"glEvalPoint2");
	*cast(void**)&fp_glEvalMesh1 = loadFuncFromLib(cast(char*)"glEvalMesh1");
	*cast(void**)&fp_glEvalMesh2 = loadFuncFromLib(cast(char*)"glEvalMesh2");

	*cast(void**)&fp_glFogf = loadFuncFromLib(cast(char*)"glFogf");
	*cast(void**)&fp_glFogi = loadFuncFromLib(cast(char*)"glFogi");
	*cast(void**)&fp_glFogfv = loadFuncFromLib(cast(char*)"glFogfv");
	*cast(void**)&fp_glFogiv = loadFuncFromLib(cast(char*)"glFogiv");

	*cast(void**)&fp_glFeedbackBuffer = loadFuncFromLib(cast(char*)"glFeedbackBuffer");
	*cast(void**)&fp_glPassThrough = loadFuncFromLib(cast(char*)"glPassThrough");
	*cast(void**)&fp_glSelectBuffer = loadFuncFromLib(cast(char*)"glSelectBuffer");
	*cast(void**)&fp_glInitNames = loadFuncFromLib(cast(char*)"glInitNames");
	*cast(void**)&fp_glLoadName = loadFuncFromLib(cast(char*)"glLoadName");
	*cast(void**)&fp_glPushName = loadFuncFromLib(cast(char*)"glPushName");
	*cast(void**)&fp_glPopName = loadFuncFromLib(cast(char*)"glPopName");

	*cast(void**)&fp_glGenTextures = loadFuncFromLib(cast(char*)"glGenTextures");
	*cast(void**)&fp_glDeleteTextures = loadFuncFromLib(cast(char*)"glDeleteTextures");
	*cast(void**)&fp_glBindTexture = loadFuncFromLib(cast(char*)"glBindTexture");
	*cast(void**)&fp_glPrioritizeTextures = loadFuncFromLib(cast(char*)"glPrioritizeTextures");
	*cast(void**)&fp_glAreTexturesResident = loadFuncFromLib(cast(char*)"glAreTexturesResident");
	*cast(void**)&fp_glIsTexture = loadFuncFromLib(cast(char*)"glIsTexture");

	*cast(void**)&fp_glTexSubImage1D = loadFuncFromLib(cast(char*)"glTexSubImage1D");
	*cast(void**)&fp_glTexSubImage2D = loadFuncFromLib(cast(char*)"glTexSubImage2D");
	*cast(void**)&fp_glCopyTexImage1D = loadFuncFromLib(cast(char*)"glCopyTexImage1D");
	*cast(void**)&fp_glCopyTexImage2D = loadFuncFromLib(cast(char*)"glCopyTexImage2D");
	*cast(void**)&fp_glCopyTexSubImage1D = loadFuncFromLib(cast(char*)"glCopyTexSubImage1D");
	*cast(void**)&fp_glCopyTexSubImage2D = loadFuncFromLib(cast(char*)"glCopyTexSubImage2D");

	*cast(void**)&fp_glVertexPointer = loadFuncFromLib(cast(char*)"glVertexPointer");
	*cast(void**)&fp_glNormalPointer = loadFuncFromLib(cast(char*)"glNormalPointer");
	*cast(void**)&fp_glColorPointer = loadFuncFromLib(cast(char*)"glColorPointer");
	*cast(void**)&fp_glIndexPointer = loadFuncFromLib(cast(char*)"glIndexPointer");
	*cast(void**)&fp_glTexCoordPointer = loadFuncFromLib(cast(char*)"glTexCoordPointer");
	*cast(void**)&fp_glEdgeFlagPointer = loadFuncFromLib(cast(char*)"glEdgeFlagPointer");
	*cast(void**)&fp_glGetPointerv = loadFuncFromLib(cast(char*)"glGetPointerv");
	*cast(void**)&fp_glArrayElement = loadFuncFromLib(cast(char*)"glArrayElement");
	*cast(void**)&fp_glDrawArrays = loadFuncFromLib(cast(char*)"glDrawArrays");
	*cast(void**)&fp_glDrawElements = loadFuncFromLib(cast(char*)"glDrawElements");
	*cast(void**)&fp_glInterleavedArrays = loadFuncFromLib(cast(char*)"glInterleavedArrays");
}
