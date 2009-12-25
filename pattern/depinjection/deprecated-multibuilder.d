MOdule pattern.depinjection.multibuilder;

private {
	import pattern.depinjection.object_builders;
	import pattern.depinjection.exception;
}

class MultiBuilder {

	private ISingleBuilder[TypeInfo] _subbuilders;
	private ISingleBuilder _default;

	public ISingleBuilder get (TypeInfo context) {
		if (context is null)
			return _default;
		if (context in _subbuilders)
			return _subbuilders[context];
		return _default;
	}

	public void add (ISingleBuilder builder, TypeInfo context) {
		if (context is null) {
			_default = builder;
		} else {
			_subbuilders[context] = builder;
		}
	}
}
