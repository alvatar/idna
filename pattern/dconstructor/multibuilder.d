module pattern.dconstructor.multibuilder;

import pattern.dconstructor.object_builder;
import pattern.dconstructor.exception;

class MultiBuilder
{
	private ISingleBuilder[TypeInfo] _subbuilders;
	private ISingleBuilder _default;

	public ISingleBuilder get (TypeInfo context)
	{
		if (context is null)
			return _default;
		if (context in _subbuilders)
			return _subbuilders[context];
		return _default;
	}

	public void add (ISingleBuilder builder, TypeInfo context)
	{
		if (context is null)
		{
			_default = builder;
		}
		else
		{
			_subbuilders[context] = builder;
		}
	}
}
