module xf.platform.osx.NSObject;

import xf.platform.osx.objc_class;
import xf.platform.osx.objc_runtime;

template NSObject() {

	Class meta() {
		return _meta;
	}

	id obj() {
		return _obj;
	}

	protected {
		Class _meta;
		id _obj;
	}
}
