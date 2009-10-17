module xf.platform.osx.DogView;

import xf.platform.osx.objc_class;
import xf.platform.osx.objc_runtime;
import xf.platform.osx.NSObject;
import xf.platform.osx.NSGeometry;

import xf.dog.Common: GL;

class DogView {

	static this() {
		registerClass("DogView", "NSOpenGLView");
	}

	this(id window, NSRect rect, id PF, id function(id, SEL, ...) drawFunc) {
		_meta = lookUp("DogView");
		_obj = createInstance(meta);
		selDraw = sel("drawDogView");
		selFlush = sel("flushBuffer");

		drawMethod.method_count = 1;
		drawMethod.method_list[0].method_name = selDraw;
		drawMethod.method_list[0].method_imp = drawFunc;
		class_removeMethods(meta, &drawMethod);
		class_addMethods(meta, &drawMethod);

		send(obj, sel("initWithFrame:pixelFormat:"), rect, PF);
		send(window, sel("setContentView:"), obj);

		_context = send(obj, sel("openGLContext"));
		send(context, sel("setView:"), obj);
		send(context, sel("makeCurrentContext"));
	}

	void destroy() {
		send(obj, sel("clearGLContext"));
		class_removeMethods(meta, &drawMethod);
	}

	void flush() {
		send(context, selFlush);
	}

	void opCall(void delegate(GL) dg, GL gl) {
		send(obj, selDraw, dg, gl);
	}

	id context() {
		return _context;
	}

	private {
		objc_method_list drawMethod;
		id _context;
		SEL selDraw;
		SEL selFlush;
	}
	mixin NSObject;
}

