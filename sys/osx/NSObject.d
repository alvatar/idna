module sys.osx.NSObject;

import sys.osx.objc_class;
import sys.osx.objc_runtime;

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
