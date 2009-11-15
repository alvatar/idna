module dgl.glufunctionptrs;

private {
	import dgl.common;
}



package extern (System) {
	GLint function(GLenum,GLint,GLsizei,GLenum,GLenum,GLint,GLint,GLint,void*) fp_gluBuild1DMipmapLevels;
	GLint function(GLenum,GLint,GLsizei,GLenum,GLenum,void*) fp_gluBuild1DMipmaps;
	GLint function(GLenum,GLint,GLsizei,GLsizei,GLenum,GLenum,GLint,GLint,GLint,void*) fp_gluBuild2DMipmapLevels;
	GLint function(GLenum,GLint,GLsizei,GLsizei,GLenum,GLenum,void*) fp_gluBuild2DMipmaps;
	GLint function(GLenum,GLint,GLsizei,GLsizei,GLsizei,GLenum,GLenum,GLint,GLint,GLint,void*) fp_gluBuild3DMipmapLevels;
	GLint function(GLenum,GLint,GLsizei,GLsizei,GLsizei,GLenum,GLenum,void*) fp_gluBuild3DMipmaps;
	GLboolean function(GLubyte*,GLubyte*) fp_gluCheckExtension;
	GLubyte* function(GLenum) fp_gluGetString;
	void function(GLUquadric*,GLdouble,GLdouble,GLdouble,GLint,GLint) fp_gluCylinder;
	void function(GLUquadric*,GLdouble,GLdouble,GLint,GLint) fp_gluDisk;
	void function(GLUquadric*,GLdouble,GLdouble,GLint,GLint,GLdouble,GLdouble) fp_gluPartialDisk;
	void function(GLUquadric*,GLdouble,GLint,GLint) fp_gluSphere;
	void function(GLUnurbs*) fp_gluBeginCurve;
	void function(GLUtesselator*) fp_gluBeginPolygon;
	void function(GLUnurbs*) fp_gluBeginSurface;
	void function(GLUnurbs*) fp_gluBeginTrim;
	void function(GLUnurbs*) fp_gluEndCurve;
	void function(GLUtesselator*) fp_gluEndPolygon;
	void function(GLUnurbs*) fp_gluEndSurface;
	void function(GLUnurbs*) fp_gluEndTrim;
	void function(GLUnurbs*) fp_gluDeleteNurbsRenderer;
	void function(GLUquadric*) fp_gluDeleteQuadric;
	void function(GLUtesselator*) fp_gluDeleteTess;
	void function(GLUnurbs*,GLenum,GLfloat*) fp_gluGetNurbsProperty;
	void function(GLUtesselator*,GLenum,GLdouble*) fp_gluGetTessProperty;
	void function(GLUnurbs*,GLfloat*,GLfloat*,GLint*) fp_gluLoadSamplingMatrices;
	GLUnurbs* function() fp_gluNewNurbsRenderer;
	GLUquadric* function() fp_gluNewQuadric;
	GLUtesselator* function() fp_gluNewTess;
	void function(GLUtesselator*,GLenum) fp_gluNextContour;
	void function(GLUnurbs*,GLenum,_GLUfuncptr) fp_gluNurbsCallback;
	void function(GLUnurbs*,GLvoid*) fp_gluNurbsCallbackData;
	void function(GLUnurbs*,GLvoid*) fp_gluNurbsCallbackDataEXT;
	void function(GLUnurbs*,GLint,GLfloat*,GLint,GLfloat*,GLint,GLenum) fp_gluNurbsCurve;
	void function(GLUnurbs*,GLenum,GLfloat) fp_gluNurbsProperty;
	void function(GLUnurbs*,GLint,GLfloat*,GLint,GLfloat*,GLint,GLint,GLfloat*,GLint,GLint,GLenum) fp_gluNurbsSurface;
	void function(GLUnurbs*,GLint,GLfloat*,GLint,GLenum) fp_gluPwlCurve;
	void function(GLUquadric*,GLenum,_GLUfuncptr) fp_gluQuadricCallback;
	void function(GLUquadric*,GLenum) fp_gluQuadricDrawStyle;
	void function(GLUquadric*,GLenum) fp_gluQuadricNormals;
	void function(GLUquadric*,GLenum) fp_gluQuadricOrientation;
	void function(GLUquadric*,GLboolean) fp_gluQuadricTexture;
	void function(GLUtesselator*) fp_gluTessBeginContour;
	void function(GLUtesselator*,GLvoid*) fp_gluTessBeginPolygon;
	void function(GLUtesselator*,GLenum,_GLUfuncptr) fp_gluTessCallback;
	void function(GLUtesselator*) fp_gluTessEndContour;
	void function(GLUtesselator*) fp_gluTessEndPolygon;
	void function(GLUtesselator*,GLdouble,GLdouble,GLdouble) fp_gluTessNormal;
	void function(GLUtesselator*,GLenum,GLdouble) fp_gluTessProperty;
	void function(GLUtesselator*,GLdouble*,GLvoid*) fp_gluTessVertex;
	void function(GLdouble,GLdouble,GLdouble,GLdouble,GLdouble,GLdouble,GLdouble,GLdouble,GLdouble) fp_gluLookAt;
	void function(GLdouble,GLdouble,GLdouble,GLdouble) fp_gluOrtho2D;
	void function(GLdouble,GLdouble,GLdouble,GLdouble) fp_gluPerspective;
	void function(GLdouble,GLdouble,GLdouble,GLdouble,GLint*) fp_gluPickMatrix;
	GLint function(GLdouble,GLdouble,GLdouble,GLdouble*,GLdouble*,GLint*,GLdouble*,GLdouble*,GLdouble*) fp_gluProject;
	GLint function(GLenum,GLsizei,GLsizei,GLenum,void*,GLsizei,GLsizei,GLenum,GLvoid*) fp_gluScaleImage;
	GLint function(GLdouble,GLdouble,GLdouble,GLdouble*,GLdouble*,GLint*,GLdouble*,GLdouble*,GLdouble*) fp_gluUnProject;
	GLint function(GLdouble,GLdouble,GLdouble,GLdouble,GLdouble*,GLdouble*,GLint*,GLdouble,GLdouble,GLdouble*,GLdouble*,GLdouble*,GLdouble*) fp_gluUnProject4;
}
