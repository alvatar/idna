module dgl.GLFunctionPtrs;

private {
	import dgl.Common;
}



extern (System) {
	void function(GLfloat c)  fp_glClearIndex;
	void function(GLclampf,GLclampf,GLclampf,GLclampf)  fp_glClearColor;
	void function(GLbitfield)  fp_glClear;
	void function(GLuint)  fp_glIndexMask;
	void function(GLboolean,GLboolean,GLboolean,GLboolean)  fp_glColorMask;
	void function(GLenum,GLclampf)  fp_glAlphaFunc;
	void function(GLenum,GLenum)  fp_glBlendFunc;
	void function(GLenum)  fp_glLogicOp;
	void function(GLenum)  fp_glCullFace;
	void function(GLenum)  fp_glFrontFace;
	void function(GLfloat)  fp_glPointSize;
	void function(GLfloat)  fp_glLineWidth;
	void function(GLint,GLushort)  fp_glLineStipple;
	void function(GLenum,GLenum)  fp_glPolygonMode;
	void function(GLfloat,GLfloat)  fp_glPolygonOffset;
	void function(GLubyte*)  fp_glPolygonStipple;
	void function(GLubyte*)  fp_glGetPolygonStipple;
	void function(GLboolean)  fp_glEdgeFlag;
	void function(GLboolean*) fp_glEdgeFlagv;
	void function(GLint,GLint,GLsizei,GLsizei)  fp_glScissor;
	void function(GLenum,GLdouble*)  fp_glClipPlane;
	void function(GLenum,GLdouble*)  fp_glGetClipPlane;
	void function(GLenum)  fp_glDrawBuffer;
	void function(GLenum)  fp_glReadBuffer;
	void function(GLenum)  fp_glEnable;
	void function(GLenum)  fp_glDisable;
	GLboolean function(GLenum)  fp_glIsEnabled;
	void function(GLenum)  fp_glEnableClientState;
	void function(GLenum)  fp_glDisableClientState;
	void function(GLenum,GLboolean*)  fp_glGetBooleanv;
	void function(GLenum,GLdouble*)  fp_glGetDoublev;
	void function(GLenum,GLfloat*)  fp_glGetFloatv;
	void function(GLenum,GLint*)  fp_glGetIntegerv;
	void function(GLbitfield)  fp_glPushAttrib;
	void function()  fp_glPopAttrib;
	void function(GLbitfield)  fp_glPushClientAttrib;
	void function()  fp_glPopClientAttrib;
	GLint function(GLenum)  fp_glRenderMode;
	GLchar* function(GLenum)  fp_glGetString;
	void function()  fp_glFinish;
	void function()  fp_glFlush;
	void function(GLenum,GLenum)  fp_glHint;


	void function(GLclampd)  fp_glClearDepth;
	void function(GLenum)  fp_glDepthFunc;
	void function(GLboolean)  fp_glDepthMask;
	void function(GLclampd,GLclampd)  fp_glDepthRange;

	void function(GLfloat,GLfloat,GLfloat,GLfloat)  fp_glClearAccum;
	void function(GLenum,GLfloat)  fp_glAccum;

	void function(GLenum)  fp_glMatrixMode;
	void function(GLdouble,GLdouble,GLdouble,GLdouble,GLdouble,GLdouble)  fp_glOrtho;
	void function(GLdouble,GLdouble,GLdouble,GLdouble,GLdouble,GLdouble)  fp_glFrustum;
	void function(GLint,GLint,GLsizei,GLsizei)  fp_glViewport;
	void function()  fp_glPushMatrix;
	void function()  fp_glPopMatrix;
	void function()  fp_glLoadIdentity;
	void function(GLdouble*)  fp_glLoadMatrixd;
	void function(GLfloat*)  fp_glLoadMatrixf;
	void function(GLdouble*)  fp_glMultMatrixd;
	void function(GLfloat*)  fp_glMultMatrixf;
	void function(GLdouble,GLdouble,GLdouble,GLdouble)  fp_glRotated;
	void function(GLfloat,GLfloat,GLfloat,GLfloat)  fp_glRotatef;
	void function(GLdouble,GLdouble,GLdouble)  fp_glScaled;
	void function(GLfloat,GLfloat,GLfloat)  fp_glScalef;
	void function(GLdouble,GLdouble,GLdouble)  fp_glTranslated;
	void function(GLfloat,GLfloat,GLfloat)  fp_glTranslatef;

	GLboolean function(GLuint)  fp_glIsList;
	void function(GLuint,GLsizei)  fp_glDeleteLists;
	GLuint function(GLsizei)  fp_glGenLists;
	void function(GLuint,GLenum)  fp_glNewList;
	void function()  fp_glEndList;
	void function(GLuint)  fp_glCallList;
	void function(GLsizei,GLenum,GLvoid*)  fp_glCallLists;
	void function(GLuint)  fp_glListBase;

	void function(GLenum)  fp_glBegin;
	void function()  fp_glEnd;
	void function(GLdouble,GLdouble)  fp_glVertex2d;
	void function(GLfloat,GLfloat)  fp_glVertex2f;
	void function(GLint,GLint)  fp_glVertex2i;
	void function(GLshort,GLshort)  fp_glVertex2s;
	void function(GLdouble,GLdouble,GLdouble)  fp_glVertex3d;
	void function(GLfloat,GLfloat,GLfloat)  fp_glVertex3f;
	void function(GLint,GLint,GLint)  fp_glVertex3i;
	void function(GLshort,GLshort,GLshort)  fp_glVertex3s;
	void function(GLdouble,GLdouble,GLdouble,GLdouble)  fp_glVertex4d;
	void function(GLfloat,GLfloat,GLfloat,GLfloat)  fp_glVertex4f;
	void function(GLint,GLint,GLint,GLint)  fp_glVertex4i;
	void function(GLshort,GLshort,GLshort,GLshort)  fp_glVertex4s;
	void function(GLdouble*)  fp_glVertex2dv;
	void function(GLfloat*)  fp_glVertex2fv;
	void function(GLint*)  fp_glVertex2iv;
	void function(GLshort*)  fp_glVertex2sv;
	void function(GLdouble*)  fp_glVertex3dv;
	void function(GLfloat*)  fp_glVertex3fv;
	void function(GLint*)  fp_glVertex3iv;
	void function(GLshort*)  fp_glVertex3sv;
	void function(GLdouble*)  fp_glVertex4dv;
	void function(GLfloat*)  fp_glVertex4fv;
	void function(GLint*)  fp_glVertex4iv;
	void function(GLshort*)  fp_glVertex4sv;
	void function(GLbyte,GLbyte,GLbyte)  fp_glNormal3b;
	void function(GLdouble,GLdouble,GLdouble)  fp_glNormal3d;
	void function(GLfloat,GLfloat,GLfloat)  fp_glNormal3f;
	void function(GLint,GLint,GLint)  fp_glNormal3i;
	void function(GLshort,GLshort,GLshort)  fp_glNormal3s;
	void function(GLbyte*)  fp_glNormal3bv;
	void function(GLdouble*)  fp_glNormal3dv;
	void function(GLfloat*)  fp_glNormal3fv;
	void function(GLint*)  fp_glNormal3iv;
	void function(GLshort*)  fp_glNormal3sv;
	void function(GLdouble)  fp_glIndexd;
	void function(GLfloat)  fp_glIndexf;
	void function(GLint)  fp_glIndexi;
	void function(GLshort)  fp_glIndexs;
	void function(GLubyte)  fp_glIndexub;
	void function(GLdouble*)  fp_glIndexdv;
	void function(GLfloat*)  fp_glIndexfv;
	void function(GLint*)  fp_glIndexiv;
	void function(GLshort*)  fp_glIndexsv;
	void function(GLubyte*)  fp_glIndexubv;
	void function(GLbyte,GLbyte,GLbyte)  fp_glColor3b;
	void function(GLdouble,GLdouble,GLdouble)  fp_glColor3d;
	void function(GLfloat,GLfloat,GLfloat)  fp_glColor3f;
	void function(GLint,GLint,GLint)  fp_glColor3i;
	void function(GLshort,GLshort,GLshort)  fp_glColor3s;
	void function(GLubyte,GLubyte,GLubyte)  fp_glColor3ub;
	void function(GLuint,GLuint,GLuint)  fp_glColor3ui;
	void function(GLushort,GLushort,GLushort)  fp_glColor3us;
	void function(GLbyte,GLbyte,GLbyte,GLbyte)  fp_glColor4b;
	void function(GLdouble,GLdouble,GLdouble,GLdouble)  fp_glColor4d;
	void function(GLfloat,GLfloat,GLfloat,GLfloat)  fp_glColor4f;
	void function(GLint,GLint,GLint,GLint)  fp_glColor4i;
	void function(GLshort,GLshort,GLshort,GLshort)  fp_glColor4s;
	void function(GLubyte,GLubyte,GLubyte,GLubyte)  fp_glColor4ub;
	void function(GLuint,GLuint,GLuint,GLuint)  fp_glColor4ui;
	void function(GLushort,GLushort,GLushort,GLushort)  fp_glColor4us;
	void function(GLubyte*)  fp_glColor3bv;
	void function(GLdouble*)  fp_glColor3dv;
	void function(GLfloat*)  fp_glColor3fv;
	void function(GLint*)  fp_glColor3iv;
	void function(GLshort*)  fp_glColor3sv;
	void function(GLubyte*)  fp_glColor3ubv;
	void function(GLuint*)  fp_glColor3uiv;
	void function(GLushort*)  fp_glColor3usv;
	void function(GLbyte*)  fp_glColor4bv;
	void function(GLdouble*)  fp_glColor4dv;
	void function(GLfloat*)  fp_glColor4fv;
	void function(GLint*)  fp_glColor4iv;
	void function(GLshort*)  fp_glColor4sv;
	void function(GLubyte*)  fp_glColor4ubv;
	void function(GLuint*)  fp_glColor4uiv;
	void function(GLushort)  fp_glColor4usv;
	void function(GLdouble)  fp_glTexCoord1d;
	void function(GLfloat)  fp_glTexCoord1f;
	void function(GLint)  fp_glTexCoord1i;
	void function(GLshort)  fp_glTexCoord1s;
	void function(GLdouble,GLdouble)  fp_glTexCoord2d;
	void function(GLfloat,GLfloat)  fp_glTexCoord2f;
	void function(GLint,GLint)  fp_glTexCoord2i;
	void function(GLshort,GLshort)  fp_glTexCoord2s;
	void function(GLdouble,GLdouble,GLdouble)  fp_glTexCoord3d;
	void function(GLfloat,GLfloat,GLfloat)  fp_glTexCoord3f;
	void function(GLint,GLint,GLint)  fp_glTexCoord3i;
	void function(GLshort,GLshort,GLshort)  fp_glTexCoord3s;
	void function(GLdouble,GLdouble,GLdouble,GLdouble)  fp_glTexCoord4d;
	void function(GLfloat,GLfloat,GLfloat,GLfloat)  fp_glTexCoord4f;
	void function(GLint,GLint,GLint,GLint)  fp_glTexCoord4i;
	void function(GLshort,GLshort,GLshort,GLshort)  fp_glTexCoord4s;
	void function(GLdouble*)  fp_glTexCoord1dv;
	void function(GLfloat*)  fp_glTexCoord1fv;
	void function(GLint*)  fp_glTexCoord1iv;
	void function(GLshort*)  fp_glTexCoord1sv;
	void function(GLdouble*)  fp_glTexCoord2dv;
	void function(GLfloat*)  fp_glTexCoord2fv;
	void function(GLint*)  fp_glTexCoord2iv;
	void function(GLshort*)  fp_glTexCoord2sv;
	void function(GLdouble*)  fp_glTexCoord3dv;
	void function(GLfloat*)  fp_glTexCoord3fv;
	void function(GLint*)  fp_glTexCoord3iv;
	void function(GLshort*)  fp_glTexCoord3sv;
	void function(GLdouble*)  fp_glTexCoord4dv;
	void function(GLfloat*)  fp_glTexCoord4fv;
	void function(GLint*)  fp_glTexCoord4iv;
	void function(GLshort*)  fp_glTexCoord4sv;
	void function(GLdouble,GLdouble)  fp_glRasterPos2d;
	void function(GLfloat,GLfloat)  fp_glRasterPos2f;
	void function(GLint,GLint)  fp_glRasterPos2i;
	void function(GLshort,GLshort)  fp_glRasterPos2s;
	void function(GLdouble,GLdouble,GLdouble)  fp_glRasterPos3d;
	void function(GLfloat,GLfloat,GLfloat)  fp_glRasterPos3f;
	void function(GLint,GLint,GLint)  fp_glRasterPos3i;
	void function(GLshort,GLshort,GLshort)  fp_glRasterPos3s;
	void function(GLdouble,GLdouble,GLdouble,GLdouble)  fp_glRasterPos4d;
	void function(GLfloat,GLfloat,GLfloat,GLfloat)  fp_glRasterPos4f;
	void function(GLint,GLint,GLint,GLint)  fp_glRasterPos4i;
	void function(GLshort,GLshort,GLshort,GLshort)  fp_glRasterPos4s;
	void function(GLdouble*)  fp_glRasterPos2dv;
	void function(GLfloat*)  fp_glRasterPos2fv;
	void function(GLint*)  fp_glRasterPos2iv;
	void function(GLshort*)  fp_glRasterPos2sv;
	void function(GLdouble*)  fp_glRasterPos3dv;
	void function(GLfloat*)  fp_glRasterPos3fv;
	void function(GLint*)  fp_glRasterPos3iv;
	void function(GLshort*)  fp_glRasterPos3sv;
	void function(GLdouble*)  fp_glRasterPos4dv;
	void function(GLfloat*)  fp_glRasterPos4fv;
	void function(GLint*)  fp_glRasterPos4iv;
	void function(GLshort*)  fp_glRasterPos4sv;
	void function(GLdouble,GLdouble,GLdouble,GLdouble)  fp_glRectd;
	void function(GLfloat,GLfloat,GLfloat,GLfloat)  fp_glRectf;
	void function(GLint,GLint,GLint,GLint)  fp_glRecti;
	void function(GLshort,GLshort,GLshort,GLshort)  fp_glRects;
	void function(GLdouble*)  fp_glRectdv;
	void function(GLfloat*)  fp_glRectfv;
	void function(GLint*)  fp_glRectiv;
	void function(GLshort*)  fp_glRectsv;

	void function(GLenum)  fp_glShadeModel;
	void function(GLenum,GLenum,GLfloat)  fp_glLightf;
	void function(GLenum,GLenum,GLint)  fp_glLighti;
	void function(GLenum,GLenum,GLfloat*)  fp_glLightfv;
	void function(GLenum,GLenum,GLint*)  fp_glLightiv;
	void function(GLenum,GLenum,GLfloat*)  fp_glGetLightfv;
	void function(GLenum,GLenum,GLint*)  fp_glGetLightiv;
	void function(GLenum,GLfloat)  fp_glLightModelf;
	void function(GLenum,GLint)  fp_glLightModeli;
	void function(GLenum,GLfloat*)  fp_glLightModelfv;
	void function(GLenum,GLint*)  fp_glLightModeliv;
	void function(GLenum,GLenum,GLfloat)  fp_glMaterialf;
	void function(GLenum,GLenum,GLint)  fp_glMateriali;
	void function(GLenum,GLenum,GLfloat*)  fp_glMaterialfv;
	void function(GLenum,GLenum,GLint*)  fp_glMaterialiv;
	void function(GLenum,GLenum,GLfloat*)  fp_glGetMaterialfv;
	void function(GLenum,GLenum,GLint*)  fp_glGetMaterialiv;
	void function(GLenum,GLenum)  fp_glColorMaterial;

	void function(GLfloat,GLfloat)  fp_glPixelZoom;
	void function(GLenum,GLfloat)  fp_glPixelStoref;
	void function(GLenum,GLint)  fp_glPixelStorei;
	void function(GLenum,GLfloat)  fp_glPixelTransferf;
	void function(GLenum,GLint)  fp_glPixelTransferi;
	void function(GLenum,GLint,GLfloat*)  fp_glPixelMapfv;
	void function(GLenum,GLint,GLuint*)  fp_glPixelMapuiv;
	void function(GLenum,GLint,GLushort*)  fp_glPixelMapusv;
	void function(GLenum,GLfloat*)  fp_glGetPixelMapfv;
	void function(GLenum,GLuint*)  fp_glGetPixelMapuiv;
	void function(GLenum,GLushort*)  fp_glGetPixelMapusv;
	void function(GLsizei,GLsizei,GLfloat,GLfloat,GLfloat,GLfloat,GLubyte*)  fp_glBitmap;
	void function(GLint,GLint,GLsizei,GLsizei,GLenum,GLenum,GLvoid*)  fp_glReadPixels;
	void function(GLsizei,GLsizei,GLenum,GLenum,GLvoid*)  fp_glDrawPixels;
	void function(GLint,GLint,GLsizei,GLsizei,GLenum)  fp_glCopyPixels;

	void function(GLenum,GLint,GLuint)  fp_glStencilFunc;
	void function(GLuint)  fp_glStencilMask;
	void function(GLenum,GLenum,GLenum)  fp_glStencilOp;
	void function(GLint)  fp_glClearStencil;

	void function(GLenum,GLenum,GLdouble)  fp_glTexGend;
	void function(GLenum,GLenum,GLfloat)  fp_glTexGenf;
	void function(GLenum,GLenum,GLint)  fp_glTexGeni;
	void function(GLenum,GLenum,GLdouble*)  fp_glTexGendv;
	void function(GLenum,GLenum,GLfloat*)  fp_glTexGenfv;
	void function(GLenum,GLenum,GLint*)  fp_glTexGeniv;
	void function(GLenum,GLenum,GLdouble*)  fp_glGetTexGendv;
	void function(GLenum,GLenum,GLfloat*)  fp_glGetTexGenfv;
	void function(GLenum,GLenum,GLint*)  fp_glGetTexGeniv;
	void function(GLenum,GLenum,GLfloat)  fp_glTexEnvf;
	void function(GLenum,GLenum,GLint)  fp_glTexEnvi;
	void function(GLenum,GLenum,GLfloat*)  fp_glTexEnvfv;
	void function(GLenum,GLenum,GLint*)  fp_glTexEnviv;
	void function(GLenum,GLenum,GLfloat*)  fp_glGetTexEnvfv;
	void function(GLenum,GLenum,GLint*)  fp_glGetTexEnviv;
	void function(GLenum,GLenum,GLfloat)  fp_glTexParameterf;
	void function(GLenum,GLenum,GLint)  fp_glTexParameteri;
	void function(GLenum,GLenum,GLfloat*)  fp_glTexParameterfv;
	void function(GLenum,GLenum,GLint*)  fp_glTexParameteriv;
	void function(GLenum,GLenum,GLfloat*)  fp_glGetTexParameterfv;
	void function(GLenum,GLenum,GLint*)  fp_glGetTexParameteriv;
	void function(GLenum,GLint,GLenum,GLfloat*)  fp_glGetTexLevelParameterfv;
	void function(GLenum,GLint,GLenum,GLint*)  fp_glGetTexLevelParameteriv;
	void function(GLenum,GLint,GLint,GLsizei,GLint,GLenum,GLenum,GLvoid*)  fp_glTexImage1D;
	void function(GLenum,GLint,GLint,GLsizei,GLsizei,GLint,GLenum,GLenum,GLvoid*)  fp_glTexImage2D;
	void function(GLenum,GLint,GLenum,GLenum,GLvoid*)  fp_glGetTexImage;

	void function(GLenum,GLdouble,GLdouble,GLint,GLint,GLdouble*)  fp_glMap1d;
	void function(GLenum,GLfloat,GLfloat,GLint,GLint,GLfloat*)  fp_glMap1f;
	void function(GLenum,GLdouble,GLdouble,GLint,GLint,GLdouble,GLdouble,GLint,GLint,GLdouble*)  fp_glMap2d;
	void function(GLenum,GLfloat,GLfloat,GLint,GLint,GLfloat,GLfloat,GLint,GLint,GLfloat*)  fp_glMap2f;
	void function(GLenum,GLenum,GLdouble*)  fp_glGetMapdv;
	void function(GLenum,GLenum,GLfloat*)  fp_glGetMapfv;
	void function(GLenum,GLenum,GLint*)  fp_glGetMapiv;
	void function(GLdouble)  fp_glEvalCoord1d;
	void function(GLfloat)  fp_glEvalCoord1f;
	void function(GLdouble*)  fp_glEvalCoord1dv;
	void function(GLfloat*)  fp_glEvalCoord1fv;
	void function(GLdouble,GLdouble)  fp_glEvalCoord2d;
	void function(GLfloat,GLfloat)  fp_glEvalCoord2f;
	void function(GLdouble*)  fp_glEvalCoord2dv;
	void function(GLfloat*)  fp_glEvalCoord2fv;
	void function(GLint,GLdouble,GLdouble)  fp_glMapGrid1d;
	void function(GLint,GLfloat,GLfloat)  fp_glMapGrid1f;
	void function(GLint,GLdouble,GLdouble,GLint,GLdouble,GLdouble)  fp_glMapGrid2d;
	void function(GLint,GLfloat,GLfloat,GLint,GLfloat,GLfloat)  fp_glMapGrid2f;
	void function(GLint)  fp_glEvalPoint1;
	void function(GLint,GLint)  fp_glEvalPoint2;
	void function(GLenum,GLint,GLint)  fp_glEvalMesh1;
	void function(GLenum,GLint,GLint,GLint,GLint)  fp_glEvalMesh2;

	void function(GLenum,GLfloat)  fp_glFogf;
	void function(GLenum,GLint)  fp_glFogi;
	void function(GLenum,GLfloat*)  fp_glFogfv;
	void function(GLenum,GLint*)  fp_glFogiv;

	void function(GLsizei,GLenum,GLfloat*)  fp_glFeedbackBuffer;
	void function(GLfloat)  fp_glPassThrough;
	void function(GLsizei,GLuint*)  fp_glSelectBuffer;
	void function()  fp_glInitNames;
	void function(GLuint)  fp_glLoadName;
	void function(GLuint)  fp_glPushName;
	void function()  fp_glPopName;

	void function(GLsizei,GLuint*)  fp_glGenTextures;
	void function(GLsizei,GLuint*)  fp_glDeleteTextures;
	void function(GLenum,GLuint)  fp_glBindTexture;
	void function(GLsizei,GLuint*,GLclampf*)  fp_glPrioritizeTextures;
	GLboolean function(GLsizei,GLuint*,GLboolean*)  fp_glAreTexturesResident;
	GLboolean function(GLuint)  fp_glIsTexture;

	void function(GLenum,GLint,GLint,GLsizei,GLenum,GLenum,GLvoid*)  fp_glTexSubImage1D;
	void function(GLenum,GLint,GLint,GLint,GLsizei,GLsizei,GLenum,GLenum,GLvoid*)  fp_glTexSubImage2D;
	void function(GLenum,GLint,GLenum,GLint,GLint,GLsizei,GLint)  fp_glCopyTexImage1D;
	void function(GLenum,GLint,GLenum,GLint,GLint,GLsizei,GLsizei,GLint)  fp_glCopyTexImage2D;
	void function(GLenum,GLint,GLint,GLint,GLint,GLsizei)  fp_glCopyTexSubImage1D;
	void function(GLenum,GLint,GLint,GLint,GLint,GLint,GLsizei,GLsizei)  fp_glCopyTexSubImage2D;

	void function(GLint,GLenum,GLsizei,GLvoid*)  fp_glVertexPointer;
	void function(GLenum,GLsizei,GLvoid*)  fp_glNormalPointer;
	void function(GLint,GLenum,GLsizei,GLvoid*)  fp_glColorPointer;
	void function(GLenum,GLsizei,GLvoid*)  fp_glIndexPointer;
	void function(GLint,GLenum,GLsizei,GLvoid*)  fp_glTexCoordPointer;
	void function(GLsizei,GLvoid*)  fp_glEdgeFlagPointer;
	void function(GLenum,GLvoid**)  fp_glGetPointerv;
	void function(GLint)  fp_glArrayElement;
	void function(GLenum,GLint,GLsizei)  fp_glDrawArrays;
	void function(GLenum,GLsizei,GLenum,GLvoid*)  fp_glDrawElements;
	void function(GLenum,GLsizei,GLvoid*)  fp_glInterleavedArrays;
}