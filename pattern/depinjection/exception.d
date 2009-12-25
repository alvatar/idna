module pattern.depinjection.exception;


class BuildException : Exception {
	this (string msg) {
		super (msg);
	}
}

class BindingException : Exception {
	this (string msg) {
		super (msg);
	}
}

class CircularDependencyException : Exception {

	private const string _defaultMessage = "A circular dependency was encountered.";

	this () {
		this (_defaultMessage);
	}

	this (string msg) {
		super (msg);
	}
}
