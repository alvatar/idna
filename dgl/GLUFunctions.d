module dgl.GLUFunctions;

private {
	version( D_Version2 ) {
		import std.traits : ParameterTypeTuple, ReturnTypeOf = ReturnType;
		template ParameterTupleOf(alias dg) {
			alias ParameterTypeTuple!(dg) ParameterTupleOf;
		}
	} else {
		import tango.core.Traits : ParameterTupleOf;
	}
	import dgl.Common;
}

package {
	import dgl.GLUFunctionPtrs;
}



public final {
	GLint gluBuild1DMipmapLevels(GL gl, ParameterTupleOf!(fp_gluBuild1DMipmapLevels) params__) {
		return checkedCall(gl, "gluBuild1DMipmapLevels", fp_gluBuild1DMipmapLevels, params__);
	}
	GLint gluBuild1DMipmaps(GL gl, ParameterTupleOf!(fp_gluBuild1DMipmaps) params__) {
		return checkedCall(gl, "gluBuild1DMipmaps", fp_gluBuild1DMipmaps, params__);
	}
	GLint gluBuild2DMipmapLevels(GL gl, ParameterTupleOf!(fp_gluBuild2DMipmapLevels) params__) {
		return checkedCall(gl, "gluBuild2DMipmapLevels", fp_gluBuild2DMipmapLevels, params__);
	}
	GLint gluBuild2DMipmaps(GL gl, ParameterTupleOf!(fp_gluBuild2DMipmaps) params__) {
		return checkedCall(gl, "gluBuild2DMipmaps", fp_gluBuild2DMipmaps, params__);
	}
	GLint gluBuild3DMipmapLevels(GL gl, ParameterTupleOf!(fp_gluBuild3DMipmapLevels) params__) {
		return checkedCall(gl, "gluBuild3DMipmapLevels", fp_gluBuild3DMipmapLevels, params__);
	}
	GLint gluBuild3DMipmaps(GL gl, ParameterTupleOf!(fp_gluBuild3DMipmaps) params__) {
		return checkedCall(gl, "gluBuild3DMipmaps", fp_gluBuild3DMipmaps, params__);
	}
	GLboolean gluCheckExtension(GL gl, ParameterTupleOf!(fp_gluCheckExtension) params__) {
		return checkedCall(gl, "gluCheckExtension", fp_gluCheckExtension, params__);
	}
	GLubyte* gluGetString(GL gl, ParameterTupleOf!(fp_gluGetString) params__) {
		return checkedCall(gl, "gluGetString", fp_gluGetString, params__);
	}
	void gluCylinder(GL gl, ParameterTupleOf!(fp_gluCylinder) params__) {
		return checkedCall(gl, "gluCylinder", fp_gluCylinder, params__);
	}
	void gluDisk(GL gl, ParameterTupleOf!(fp_gluDisk) params__) {
		return checkedCall(gl, "gluDisk", fp_gluDisk, params__);
	}
	void gluPartialDisk(GL gl, ParameterTupleOf!(fp_gluPartialDisk) params__) {
		return checkedCall(gl, "gluPartialDisk", fp_gluPartialDisk, params__);
	}
	void gluSphere(GL gl, ParameterTupleOf!(fp_gluSphere) params__) {
		return checkedCall(gl, "gluSphere", fp_gluSphere, params__);
	}
	void gluBeginCurve(GL gl, ParameterTupleOf!(fp_gluBeginCurve) params__) {
		return checkedCall(gl, "gluBeginCurve", fp_gluBeginCurve, params__);
	}
	void gluBeginPolygon(GL gl, ParameterTupleOf!(fp_gluBeginPolygon) params__) {
		return checkedCall(gl, "gluBeginPolygon", fp_gluBeginPolygon, params__);
	}
	void gluBeginSurface(GL gl, ParameterTupleOf!(fp_gluBeginSurface) params__) {
		return checkedCall(gl, "gluBeginSurface", fp_gluBeginSurface, params__);
	}
	void gluBeginTrim(GL gl, ParameterTupleOf!(fp_gluBeginTrim) params__) {
		return checkedCall(gl, "gluBeginTrim", fp_gluBeginTrim, params__);
	}
	void gluEndCurve(GL gl, ParameterTupleOf!(fp_gluEndCurve) params__) {
		return checkedCall(gl, "gluEndCurve", fp_gluEndCurve, params__);
	}
	void gluEndPolygon(GL gl, ParameterTupleOf!(fp_gluEndPolygon) params__) {
		return checkedCall(gl, "gluEndPolygon", fp_gluEndPolygon, params__);
	}
	void gluEndSurface(GL gl, ParameterTupleOf!(fp_gluEndSurface) params__) {
		return checkedCall(gl, "gluEndSurface", fp_gluEndSurface, params__);
	}
	void gluEndTrim(GL gl, ParameterTupleOf!(fp_gluEndTrim) params__) {
		return checkedCall(gl, "gluEndTrim", fp_gluEndTrim, params__);
	}
	void gluDeleteNurbsRenderer(GL gl, ParameterTupleOf!(fp_gluDeleteNurbsRenderer) params__) {
		return checkedCall(gl, "gluDeleteNurbsRenderer", fp_gluDeleteNurbsRenderer, params__);
	}
	void gluDeleteQuadric(GL gl, ParameterTupleOf!(fp_gluDeleteQuadric) params__) {
		return checkedCall(gl, "gluDeleteQuadric", fp_gluDeleteQuadric, params__);
	}
	void gluDeleteTess(GL gl, ParameterTupleOf!(fp_gluDeleteTess) params__) {
		return checkedCall(gl, "gluDeleteTess", fp_gluDeleteTess, params__);
	}
	void gluGetNurbsProperty(GL gl, ParameterTupleOf!(fp_gluGetNurbsProperty) params__) {
		return checkedCall(gl, "gluGetNurbsProperty", fp_gluGetNurbsProperty, params__);
	}
	void gluGetTessProperty(GL gl, ParameterTupleOf!(fp_gluGetTessProperty) params__) {
		return checkedCall(gl, "gluGetTessProperty", fp_gluGetTessProperty, params__);
	}
	void gluLoadSamplingMatrices(GL gl, ParameterTupleOf!(fp_gluLoadSamplingMatrices) params__) {
		return checkedCall(gl, "gluLoadSamplingMatrices", fp_gluLoadSamplingMatrices, params__);
	}
	GLUnurbs* gluNewNurbsRenderer(GL gl, ParameterTupleOf!(fp_gluNewNurbsRenderer) params__) {
		return checkedCall(gl, "gluNewNurbsRenderer", fp_gluNewNurbsRenderer, params__);
	}
	GLUquadric* gluNewQuadric(GL gl, ParameterTupleOf!(fp_gluNewQuadric) params__) {
		return checkedCall(gl, "gluNewQuadric", fp_gluNewQuadric, params__);
	}
	GLUtesselator* gluNewTess(GL gl, ParameterTupleOf!(fp_gluNewTess) params__) {
		return checkedCall(gl, "gluNewTess", fp_gluNewTess, params__);
	}
	void gluNextContour(GL gl, ParameterTupleOf!(fp_gluNextContour) params__) {
		return checkedCall(gl, "gluNextContour", fp_gluNextContour, params__);
	}
	void gluNurbsCallback(GL gl, ParameterTupleOf!(fp_gluNurbsCallback) params__) {
		return checkedCall(gl, "gluNurbsCallback", fp_gluNurbsCallback, params__);
	}
	void gluNurbsCallbackData(GL gl, ParameterTupleOf!(fp_gluNurbsCallbackData) params__) {
		return checkedCall(gl, "gluNurbsCallbackData", fp_gluNurbsCallbackData, params__);
	}
	void gluNurbsCallbackDataEXT(GL gl, ParameterTupleOf!(fp_gluNurbsCallbackDataEXT) params__) {
		return checkedCall(gl, "gluNurbsCallbackDataEXT", fp_gluNurbsCallbackDataEXT, params__);
	}
	void gluNurbsCurve(GL gl, ParameterTupleOf!(fp_gluNurbsCurve) params__) {
		return checkedCall(gl, "gluNurbsCurve", fp_gluNurbsCurve, params__);
	}
	void gluNurbsProperty(GL gl, ParameterTupleOf!(fp_gluNurbsProperty) params__) {
		return checkedCall(gl, "gluNurbsProperty", fp_gluNurbsProperty, params__);
	}
	void gluNurbsSurface(GL gl, ParameterTupleOf!(fp_gluNurbsSurface) params__) {
		return checkedCall(gl, "gluNurbsSurface", fp_gluNurbsSurface, params__);
	}
	void gluPwlCurve(GL gl, ParameterTupleOf!(fp_gluPwlCurve) params__) {
		return checkedCall(gl, "gluPwlCurve", fp_gluPwlCurve, params__);
	}
	void gluQuadricCallback(GL gl, ParameterTupleOf!(fp_gluQuadricCallback) params__) {
		return checkedCall(gl, "gluQuadricCallback", fp_gluQuadricCallback, params__);
	}
	void gluQuadricDrawStyle(GL gl, ParameterTupleOf!(fp_gluQuadricDrawStyle) params__) {
		return checkedCall(gl, "gluQuadricDrawStyle", fp_gluQuadricDrawStyle, params__);
	}
	void gluQuadricNormals(GL gl, ParameterTupleOf!(fp_gluQuadricNormals) params__) {
		return checkedCall(gl, "gluQuadricNormals", fp_gluQuadricNormals, params__);
	}
	void gluQuadricOrientation(GL gl, ParameterTupleOf!(fp_gluQuadricOrientation) params__) {
		return checkedCall(gl, "gluQuadricOrientation", fp_gluQuadricOrientation, params__);
	}
	void gluQuadricTexture(GL gl, ParameterTupleOf!(fp_gluQuadricTexture) params__) {
		return checkedCall(gl, "gluQuadricTexture", fp_gluQuadricTexture, params__);
	}
	void gluTessBeginContour(GL gl, ParameterTupleOf!(fp_gluTessBeginContour) params__) {
		return checkedCall(gl, "gluTessBeginContour", fp_gluTessBeginContour, params__);
	}
	void gluTessBeginPolygon(GL gl, ParameterTupleOf!(fp_gluTessBeginPolygon) params__) {
		return checkedCall(gl, "gluTessBeginPolygon", fp_gluTessBeginPolygon, params__);
	}
	void gluTessCallback(GL gl, ParameterTupleOf!(fp_gluTessCallback) params__) {
		return checkedCall(gl, "gluTessCallback", fp_gluTessCallback, params__);
	}
	void gluTessEndContour(GL gl, ParameterTupleOf!(fp_gluTessEndContour) params__) {
		return checkedCall(gl, "gluTessEndContour", fp_gluTessEndContour, params__);
	}
	void gluTessEndPolygon(GL gl, ParameterTupleOf!(fp_gluTessEndPolygon) params__) {
		return checkedCall(gl, "gluTessEndPolygon", fp_gluTessEndPolygon, params__);
	}
	void gluTessNormal(GL gl, ParameterTupleOf!(fp_gluTessNormal) params__) {
		return checkedCall(gl, "gluTessNormal", fp_gluTessNormal, params__);
	}
	void gluTessProperty(GL gl, ParameterTupleOf!(fp_gluTessProperty) params__) {
		return checkedCall(gl, "gluTessProperty", fp_gluTessProperty, params__);
	}
	void gluTessVertex(GL gl, ParameterTupleOf!(fp_gluTessVertex) params__) {
		return checkedCall(gl, "gluTessVertex", fp_gluTessVertex, params__);
	}
	void gluLookAt(GL gl, ParameterTupleOf!(fp_gluLookAt) params__) {
		return checkedCall(gl, "gluLookAt", fp_gluLookAt, params__);
	}
	void gluOrtho2D(GL gl, ParameterTupleOf!(fp_gluOrtho2D) params__) {
		return checkedCall(gl, "gluOrtho2D", fp_gluOrtho2D, params__);
	}
	void gluPerspective(GL gl, ParameterTupleOf!(fp_gluPerspective) params__) {
		return checkedCall(gl, "gluPerspective", fp_gluPerspective, params__);
	}
	void gluPickMatrix(GL gl, ParameterTupleOf!(fp_gluPickMatrix) params__) {
		return checkedCall(gl, "gluPickMatrix", fp_gluPickMatrix, params__);
	}
	GLint gluProject(GL gl, ParameterTupleOf!(fp_gluProject) params__) {
		return checkedCall(gl, "gluProject", fp_gluProject, params__);
	}
	GLint gluScaleImage(GL gl, ParameterTupleOf!(fp_gluScaleImage) params__) {
		return checkedCall(gl, "gluScaleImage", fp_gluScaleImage, params__);
	}
	GLint gluUnProject(GL gl, ParameterTupleOf!(fp_gluUnProject) params__) {
		return checkedCall(gl, "gluUnProject", fp_gluUnProject, params__);
	}
	GLint gluUnProject4(GL gl, ParameterTupleOf!(fp_gluUnProject4) params__) {
		return checkedCall(gl, "gluUnProject4", fp_gluUnProject4, params__);
	}


	/+GLint gluBuild1DMipmapLevels(GL gl, ParameterTupleOf!(fp_gluBuild1DMipmapLevels) params__) {
		return checkedCall(gl, "build1DMipmapLevels", fp_gluBuild1DMipmapLevels, params__);
	}
	GLint gluBuild1DMipmaps(GL gl, ParameterTupleOf!(fp_gluBuild1DMipmaps) params__) {
		return checkedCall(gl, "build1DMipmaps", fp_gluBuild1DMipmaps, params__);
	}
	GLint gluBuild2DMipmapLevels(GL gl, ParameterTupleOf!(fp_gluBuild2DMipmapLevels) params__) {
		return checkedCall(gl, "build2DMipmapLevels", fp_gluBuild2DMipmapLevels, params__);
	}
	GLint gluBuild2DMipmaps(GL gl, ParameterTupleOf!(fp_gluBuild2DMipmaps) params__) {
		return checkedCall(gl, "build2DMipmaps", fp_gluBuild2DMipmaps, params__);
	}
	GLint gluBuild3DMipmapLevels(GL gl, ParameterTupleOf!(fp_gluBuild3DMipmapLevels) params__) {
		return checkedCall(gl, "build3DMipmapLevels", fp_gluBuild3DMipmapLevels, params__);
	}
	GLint gluBuild3DMipmaps(GL gl, ParameterTupleOf!(fp_gluBuild3DMipmaps) params__) {
		return checkedCall(gl, "build3DMipmaps", fp_gluBuild3DMipmaps, params__);
	}
	GLboolean gluCheckExtension(GL gl, ParameterTupleOf!(fp_gluCheckExtension) params__) {
		return checkedCall(gl, "checkExtension", fp_gluCheckExtension, params__);
	}
	GLubyte* gluErrorString(GL gl, ParameterTupleOf!(fp_gluErrorString) params__) {
		return checkedCall(gl, "errorString", fp_gluErrorString, params__);
	}
	GLubyte* gluGetString(GL gl, ParameterTupleOf!(fp_gluGetString) params__) {
		return checkedCall(gl, "getString", fp_gluGetString, params__);
	}
	void gluCylinder(GL gl, ParameterTupleOf!(fp_gluCylinder) params__) {
		return checkedCall(gl, "cylinder", fp_gluCylinder, params__);
	}
	void gluDisk(GL gl, ParameterTupleOf!(fp_gluDisk) params__) {
		return checkedCall(gl, "disk", fp_gluDisk, params__);
	}
	void gluPartialDisk(GL gl, ParameterTupleOf!(fp_gluPartialDisk) params__) {
		return checkedCall(gl, "partialDisk", fp_gluPartialDisk, params__);
	}
	void gluSphere(GL gl, ParameterTupleOf!(fp_gluSphere) params__) {
		return checkedCall(gl, "sphere", fp_gluSphere, params__);
	}
	void gluBeginCurve(GL gl, ParameterTupleOf!(fp_gluBeginCurve) params__) {
		return checkedCall(gl, "beginCurve", fp_gluBeginCurve, params__);
	}
	void gluBeginPolygon(GL gl, ParameterTupleOf!(fp_gluBeginPolygon) params__) {
		return checkedCall(gl, "beginPolygon", fp_gluBeginPolygon, params__);
	}
	void gluBeginSurface(GL gl, ParameterTupleOf!(fp_gluBeginSurface) params__) {
		return checkedCall(gl, "beginSurface", fp_gluBeginSurface, params__);
	}
	void gluBeginTrim(GL gl, ParameterTupleOf!(fp_gluBeginTrim) params__) {
		return checkedCall(gl, "beginTrim", fp_gluBeginTrim, params__);
	}
	void gluEndCurve(GL gl, ParameterTupleOf!(fp_gluEndCurve) params__) {
		return checkedCall(gl, "endCurve", fp_gluEndCurve, params__);
	}
	void gluEndPolygon(GL gl, ParameterTupleOf!(fp_gluEndPolygon) params__) {
		return checkedCall(gl, "endPolygon", fp_gluEndPolygon, params__);
	}
	void gluEndSurface(GL gl, ParameterTupleOf!(fp_gluEndSurface) params__) {
		return checkedCall(gl, "endSurface", fp_gluEndSurface, params__);
	}
	void gluEndTrim(GL gl, ParameterTupleOf!(fp_gluEndTrim) params__) {
		return checkedCall(gl, "endTrim", fp_gluEndTrim, params__);
	}
	void gluDeleteNurbsRenderer(GL gl, ParameterTupleOf!(fp_gluDeleteNurbsRenderer) params__) {
		return checkedCall(gl, "deleteNurbsRenderer", fp_gluDeleteNurbsRenderer, params__);
	}
	void gluDeleteQuadric(GL gl, ParameterTupleOf!(fp_gluDeleteQuadric) params__) {
		return checkedCall(gl, "deleteQuadric", fp_gluDeleteQuadric, params__);
	}
	void gluDeleteTess(GL gl, ParameterTupleOf!(fp_gluDeleteTess) params__) {
		return checkedCall(gl, "deleteTess", fp_gluDeleteTess, params__);
	}
	void gluGetNurbsProperty(GL gl, ParameterTupleOf!(fp_gluGetNurbsProperty) params__) {
		return checkedCall(gl, "getNurbsProperty", fp_gluGetNurbsProperty, params__);
	}
	void gluGetTessProperty(GL gl, ParameterTupleOf!(fp_gluGetTessProperty) params__) {
		return checkedCall(gl, "getTessProperty", fp_gluGetTessProperty, params__);
	}
	void gluLoadSamplingMatrices(GL gl, ParameterTupleOf!(fp_gluLoadSamplingMatrices) params__) {
		return checkedCall(gl, "loadSamplingMatrices", fp_gluLoadSamplingMatrices, params__);
	}
	GLUnurbs* gluNewNurbsRenderer(GL gl, ParameterTupleOf!(fp_gluNewNurbsRenderer) params__) {
		return checkedCall(gl, "newNurbsRenderer", fp_gluNewNurbsRenderer, params__);
	}
	GLUquadric* gluNewQuadric(GL gl, ParameterTupleOf!(fp_gluNewQuadric) params__) {
		return checkedCall(gl, "newQuadric", fp_gluNewQuadric, params__);
	}
	GLUtesselator* gluNewTess(GL gl, ParameterTupleOf!(fp_gluNewTess) params__) {
		return checkedCall(gl, "newTess", fp_gluNewTess, params__);
	}
	void gluNextContour(GL gl, ParameterTupleOf!(fp_gluNextContour) params__) {
		return checkedCall(gl, "nextContour", fp_gluNextContour, params__);
	}
	void gluNurbsCallback(GL gl, ParameterTupleOf!(fp_gluNurbsCallback) params__) {
		return checkedCall(gl, "nurbsCallback", fp_gluNurbsCallback, params__);
	}
	void gluNurbsCallbackData(GL gl, ParameterTupleOf!(fp_gluNurbsCallbackData) params__) {
		return checkedCall(gl, "nurbsCallbackData", fp_gluNurbsCallbackData, params__);
	}
	void gluNurbsCallbackDataEXT(GL gl, ParameterTupleOf!(fp_gluNurbsCallbackDataEXT) params__) {
		return checkedCall(gl, "nurbsCallbackDataEXT", fp_gluNurbsCallbackDataEXT, params__);
	}
	void gluNurbsCurve(GL gl, ParameterTupleOf!(fp_gluNurbsCurve) params__) {
		return checkedCall(gl, "nurbsCurve", fp_gluNurbsCurve, params__);
	}
	void gluNurbsProperty(GL gl, ParameterTupleOf!(fp_gluNurbsProperty) params__) {
		return checkedCall(gl, "nurbsProperty", fp_gluNurbsProperty, params__);
	}
	void gluNurbsSurface(GL gl, ParameterTupleOf!(fp_gluNurbsSurface) params__) {
		return checkedCall(gl, "nurbsSurface", fp_gluNurbsSurface, params__);
	}
	void gluPwlCurve(GL gl, ParameterTupleOf!(fp_gluPwlCurve) params__) {
		return checkedCall(gl, "pwlCurve", fp_gluPwlCurve, params__);
	}
	void gluQuadricCallback(GL gl, ParameterTupleOf!(fp_gluQuadricCallback) params__) {
		return checkedCall(gl, "quadricCallback", fp_gluQuadricCallback, params__);
	}
	void gluQuadricDrawStyle(GL gl, ParameterTupleOf!(fp_gluQuadricDrawStyle) params__) {
		return checkedCall(gl, "quadricDrawStyle", fp_gluQuadricDrawStyle, params__);
	}
	void gluQuadricNormals(GL gl, ParameterTupleOf!(fp_gluQuadricNormals) params__) {
		return checkedCall(gl, "quadricNormals", fp_gluQuadricNormals, params__);
	}
	void gluQuadricOrientation(GL gl, ParameterTupleOf!(fp_gluQuadricOrientation) params__) {
		return checkedCall(gl, "quadricOrientation", fp_gluQuadricOrientation, params__);
	}
	void gluQuadricTexture(GL gl, ParameterTupleOf!(fp_gluQuadricTexture) params__) {
		return checkedCall(gl, "quadricTexture", fp_gluQuadricTexture, params__);
	}
	void gluTessBeginContour(GL gl, ParameterTupleOf!(fp_gluTessBeginContour) params__) {
		return checkedCall(gl, "tessBeginContour", fp_gluTessBeginContour, params__);
	}
	void gluTessBeginPolygon(GL gl, ParameterTupleOf!(fp_gluTessBeginPolygon) params__) {
		return checkedCall(gl, "tessBeginPolygon", fp_gluTessBeginPolygon, params__);
	}
	void gluTessCallback(GL gl, ParameterTupleOf!(fp_gluTessCallback) params__) {
		return checkedCall(gl, "tessCallback", fp_gluTessCallback, params__);
	}
	void gluTessEndContour(GL gl, ParameterTupleOf!(fp_gluTessEndContour) params__) {
		return checkedCall(gl, "tessEndContour", fp_gluTessEndContour, params__);
	}
	void gluTessEndPolygon(GL gl, ParameterTupleOf!(fp_gluTessEndPolygon) params__) {
		return checkedCall(gl, "tessEndPolygon", fp_gluTessEndPolygon, params__);
	}
	void gluTessNormal(GL gl, ParameterTupleOf!(fp_gluTessNormal) params__) {
		return checkedCall(gl, "tessNormal", fp_gluTessNormal, params__);
	}
	void gluTessProperty(GL gl, ParameterTupleOf!(fp_gluTessProperty) params__) {
		return checkedCall(gl, "tessProperty", fp_gluTessProperty, params__);
	}
	void gluTessVertex(GL gl, ParameterTupleOf!(fp_gluTessVertex) params__) {
		return checkedCall(gl, "tessVertex", fp_gluTessVertex, params__);
	}
	void gluLookAt(GL gl, ParameterTupleOf!(fp_gluLookAt) params__) {
		return checkedCall(gl, "lookAt", fp_gluLookAt, params__);
	}
	void gluOrtho2D(GL gl, ParameterTupleOf!(fp_gluOrtho2D) params__) {
		return checkedCall(gl, "ortho2D", fp_gluOrtho2D, params__);
	}
	void gluPerspective(GL gl, ParameterTupleOf!(fp_gluPerspective) params__) {
		return checkedCall(gl, "perspective", fp_gluPerspective, params__);
	}
	void gluPickMatrix(GL gl, ParameterTupleOf!(fp_gluPickMatrix) params__) {
		return checkedCall(gl, "pickMatrix", fp_gluPickMatrix, params__);
	}
	GLint gluProject(GL gl, ParameterTupleOf!(fp_gluProject) params__) {
		return checkedCall(gl, "project", fp_gluProject, params__);
	}
	GLint gluScaleImage(GL gl, ParameterTupleOf!(fp_gluScaleImage) params__) {
		return checkedCall(gl, "scaleImage", fp_gluScaleImage, params__);
	}
	GLint gluUnProject(GL gl, ParameterTupleOf!(fp_gluUnProject) params__) {
		return checkedCall(gl, "unProject", fp_gluUnProject, params__);
	}
	GLint gluUnProject4(GL gl, ParameterTupleOf!(fp_gluUnProject4) params__) {
		return checkedCall(gl, "unProject4", fp_gluUnProject4, params__);
	}+/
}


void loadGluFunctions_(void* function(char*) loadFuncFromGluLib) {
	// could check all but what the hell...
	if (fp_gluUnProject !is null) return;
	
	//*cast(void**)&fp_gluBuild1DMipmapLevels = loadFuncFromGluLib(cast(char*)"gluBuild1DMipmapLevels");
	*cast(void**)&fp_gluBuild1DMipmaps = loadFuncFromGluLib(cast(char*)"gluBuild1DMipmaps");
	//*cast(void**)&fp_gluBuild2DMipmapLevels = loadFuncFromGluLib(cast(char*)"gluBuild2DMipmapLevels");
	*cast(void**)&fp_gluBuild2DMipmaps = loadFuncFromGluLib(cast(char*)"gluBuild2DMipmaps");
	//*cast(void**)&fp_gluBuild3DMipmapLevels = loadFuncFromGluLib("gluBuild3DMipmapLevels");
	//*cast(void**)&fp_gluBuild3DMipmaps = loadFuncFromGluLib(cast(char*)"gluBuild3DMipmaps");
	//*cast(void**)&fp_gluCheckExtension = loadFuncFromGluLib(cast(char*)"gluCheckExtension");
	*cast(void**)&fp_gluErrorString = loadFuncFromGluLib(cast(char*)"gluErrorString");
	*cast(void**)&fp_gluGetString = loadFuncFromGluLib(cast(char*)"gluGetString");
	*cast(void**)&fp_gluCylinder = loadFuncFromGluLib(cast(char*)"gluCylinder");
	*cast(void**)&fp_gluDisk = loadFuncFromGluLib(cast(char*)"gluDisk");
	*cast(void**)&fp_gluPartialDisk = loadFuncFromGluLib(cast(char*)"gluPartialDisk");
	*cast(void**)&fp_gluSphere = loadFuncFromGluLib(cast(char*)"gluSphere");
	*cast(void**)&fp_gluBeginCurve = loadFuncFromGluLib(cast(char*)"gluBeginCurve");
	*cast(void**)&fp_gluBeginPolygon = loadFuncFromGluLib(cast(char*)"gluBeginPolygon");
	*cast(void**)&fp_gluBeginSurface = loadFuncFromGluLib(cast(char*)"gluBeginSurface");
	*cast(void**)&fp_gluBeginTrim = loadFuncFromGluLib(cast(char*)"gluBeginTrim");
	*cast(void**)&fp_gluEndCurve = loadFuncFromGluLib(cast(char*)"gluEndCurve");
	*cast(void**)&fp_gluEndPolygon = loadFuncFromGluLib(cast(char*)"gluEndPolygon");
	*cast(void**)&fp_gluEndSurface = loadFuncFromGluLib(cast(char*)"gluEndSurface");
	*cast(void**)&fp_gluEndTrim = loadFuncFromGluLib(cast(char*)"gluEndTrim");
	*cast(void**)&fp_gluDeleteNurbsRenderer = loadFuncFromGluLib(cast(char*)"gluDeleteNurbsRenderer");
	*cast(void**)&fp_gluDeleteQuadric = loadFuncFromGluLib(cast(char*)"gluDeleteQuadric");
	*cast(void**)&fp_gluDeleteTess = loadFuncFromGluLib(cast(char*)"gluDeleteTess");
	*cast(void**)&fp_gluGetNurbsProperty = loadFuncFromGluLib(cast(char*)"gluGetNurbsProperty");
	*cast(void**)&fp_gluGetTessProperty = loadFuncFromGluLib(cast(char*)"gluGetTessProperty");
	*cast(void**)&fp_gluLoadSamplingMatrices = loadFuncFromGluLib(cast(char*)"gluLoadSamplingMatrices");
	*cast(void**)&fp_gluNewNurbsRenderer = loadFuncFromGluLib(cast(char*)"gluNewNurbsRenderer");
	*cast(void**)&fp_gluNewQuadric = loadFuncFromGluLib(cast(char*)"gluNewQuadric");
	*cast(void**)&fp_gluNewTess = loadFuncFromGluLib(cast(char*)"gluNewTess");
	*cast(void**)&fp_gluNextContour = loadFuncFromGluLib(cast(char*)"gluNextContour");
	*cast(void**)&fp_gluNurbsCallback = loadFuncFromGluLib(cast(char*)"gluNurbsCallback");
	//*cast(void**)&fp_gluNurbsCallbackData = loadFuncFromGluLib(cast(char*)"gluNurbsCallbackData");
	//*cast(void**)&fp_gluNurbsCallbackDataEXT = loadFuncFromGluLib(cast(char*)"gluNurbsCallbackDataEXT");
	*cast(void**)&fp_gluNurbsCurve = loadFuncFromGluLib(cast(char*)"gluNurbsCurve");
	*cast(void**)&fp_gluNurbsProperty = loadFuncFromGluLib(cast(char*)"gluNurbsProperty");
	*cast(void**)&fp_gluNurbsSurface = loadFuncFromGluLib(cast(char*)"gluNurbsSurface");
	*cast(void**)&fp_gluPwlCurve = loadFuncFromGluLib(cast(char*)"gluPwlCurve");
	*cast(void**)&fp_gluQuadricCallback = loadFuncFromGluLib(cast(char*)"gluQuadricCallback");
	*cast(void**)&fp_gluQuadricDrawStyle = loadFuncFromGluLib(cast(char*)"gluQuadricDrawStyle");
	*cast(void**)&fp_gluQuadricNormals = loadFuncFromGluLib(cast(char*)"gluQuadricNormals");
	*cast(void**)&fp_gluQuadricOrientation = loadFuncFromGluLib(cast(char*)"gluQuadricOrientation");
	*cast(void**)&fp_gluQuadricTexture = loadFuncFromGluLib(cast(char*)"gluQuadricTexture");
	*cast(void**)&fp_gluTessBeginContour = loadFuncFromGluLib(cast(char*)"gluTessBeginContour");
	*cast(void**)&fp_gluTessBeginPolygon = loadFuncFromGluLib(cast(char*)"gluTessBeginPolygon");
	*cast(void**)&fp_gluTessCallback = loadFuncFromGluLib(cast(char*)"gluTessCallback");
	*cast(void**)&fp_gluTessEndContour = loadFuncFromGluLib(cast(char*)"gluTessEndContour");
	*cast(void**)&fp_gluTessEndPolygon = loadFuncFromGluLib(cast(char*)"gluTessEndPolygon");
	*cast(void**)&fp_gluTessNormal = loadFuncFromGluLib(cast(char*)"gluTessNormal");
	*cast(void**)&fp_gluTessProperty = loadFuncFromGluLib(cast(char*)"gluTessProperty");
	*cast(void**)&fp_gluTessVertex = loadFuncFromGluLib(cast(char*)"gluTessVertex");
	*cast(void**)&fp_gluLookAt = loadFuncFromGluLib(cast(char*)"gluLookAt");
	*cast(void**)&fp_gluOrtho2D = loadFuncFromGluLib(cast(char*)"gluOrtho2D");
	*cast(void**)&fp_gluPerspective = loadFuncFromGluLib(cast(char*)"gluPerspective");
	*cast(void**)&fp_gluPickMatrix = loadFuncFromGluLib(cast(char*)"gluPickMatrix");
	*cast(void**)&fp_gluProject = loadFuncFromGluLib(cast(char*)"gluProject");
	*cast(void**)&fp_gluScaleImage = loadFuncFromGluLib(cast(char*)"gluScaleImage");
	*cast(void**)&fp_gluUnProject = loadFuncFromGluLib(cast(char*)"gluUnProject");
	//*cast(void**)&fp_gluUnProject4 = loadFuncFromGluLib(cast(char*)"gluUnProject4");
}
