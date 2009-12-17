module pattern.dconstructor.circular;

import pattern.dconstructor.stack;
import pattern.dconstructor.exception;

// Something can be in here many times -- once for a constructor, and once
// for post dependencies.
/** Internal use. This class will throw a CircularDependencyException if there
 * is an unresolveable circular dependency. It can handle solveable circular
 * dependencies involving setter injection. */
class Circular
{
	private bool[ClassInfo] _build;
	private BuildStack _stack;

	this (BuildStack stack)
	{
		_stack = stack;
	}

	void endCtor (TypeInfo info)
	in
	{
		assert (_stack.last () is info, "trying to exit a constructor that has not been entered -- this is a bug");
	}
	body
	{
		_stack.pop ();
		assert (!_stack.contains (info));
	}

	void push (TypeInfo type)
	{
		if (type is null)
		{
			throw new Exception ("Circular: cannot push null");
		}
		if (_stack.contains (type))
		{
			throwCircular (type);
		}
		_stack.push (type);
	}

	void throwCircular (TypeInfo type)
	{
		auto stack = _stack.targets ();
		if (stack.length == 0)
		{
			throw new Exception ("Circular dependencies while building nothing?! dconstructor bug!");
		}
		string msg = "Encountered circular dependencies while building ";
		msg ~= stack[0].toString;
		msg ~= ". The build stack was:\n";
		foreach (build; stack[1 .. $])
		{
			msg ~= "\t" ~ build.toString ~ ", which requires:\n";
		}
		msg ~= "\t" ~ type.toString;
		throw new CircularDependencyException (msg);
	}

}

static Circular circular;
