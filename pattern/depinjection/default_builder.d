/** This file is released under the WTFPL.
 * Copyright (C) 2008 Christopher Wright
 * Terms and conditions for copying, distribution, and modification:
 * 0. You just do what the fuck you want.
 */
module pattern.depinjection.default_builder;

private import pattern.depinjection.build;

private Builder _builder;

public typeof(_builder) builder () {
	if (_builder is null) {
		_builder = new typeof(_builder) ();
	}
	return _builder;
}
