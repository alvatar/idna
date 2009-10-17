module xf.platform.osx.NSApplication;

import xf.platform.osx.objc_class;
import xf.platform.osx.objc_runtime;
import xf.platform.osx.NSObject;
import xf.platform.osx.NSEvent;

import xf.utils.Singleton;

private class NSApplication {

	void terminate(id sender = nil) {
		send(obj, sel("terminate:"), sender);
		destroyPool(pool);
	}

	void run() {
		send(obj, sel("run"));
	}

	void loadNib(char[] nibName) {
		send(cast(id)lookUp("NSBundle"), sel("loadNibNamed:owner:"), NSString(nibName), obj);
	}

	void update() {
		id updatePool = createPool();

		NSEvent event;
		event.obj = send(obj, selNextEvent, 0xffffffffU, distantPast, loopMode, YES);
		while(event.obj) {
			if (event.type == NSKeyDown) {
				if (event.modifiers & NSCommandKeyMask && event.keyCode == 12) {
					terminate();
				}
			}
			send(event.window, selDispatch, event);
			event.obj = send(obj, selNextEvent, 0xffffffffU, distantPast, loopMode, YES);
		}

		destroyPool(updatePool);
	}

	this() {
		_meta = lookUp("NSApplication");
		pool = createPool();
		_obj = send(cast(id)meta, sel("sharedApplication"));

		selDispatch = sel("dispatchEvent");
		selNextEvent = sel("nextEventMatchingMask:untilDate:inMode:dequeue:");
		distantPast = send(cast(id) lookUp("NSDate"), sel("distantPast"));
		loopMode = NSString("NSDefaultRunLoopMode");
	}

	public {
		SEL selDispatch;
	}
	private {
		static id pool;
		id distantPast;
		id loopMode;
		SEL selNextEvent;
	}
	mixin NSObject;
}

alias Singleton!(NSApplication) Application;
