/**
 * dconstructor's first major revision is too heavy (too much overhead).
 * This aims to be a light-weight reimplementation.
 */
module pattern.dconstructor.subbuilders;

import pattern.dconstructor.circular;
import pattern.dconstructor.exception;
import pattern.dconstructor.property;
import pattern.dconstructor.stack;
import pattern.dconstructor.build2;
import pattern.dconstructor.build_utils;
import pattern.dconstructor.lifecycle;
import pattern.dconstructor.lifecycles;
//import tango.core.RuntimeTraits;
//import tango.core.Traits;

interface ISingleBuilder
{
	void build (Builder builder, void* fill);
	string toString();
}

class LifecycleBuilder : ISingleBuilder
{
	void[] instance;
	ISingleBuilder subbuilder;
	size_t size;
	ILifecycle cycle;
	ulong iteration;

	this (ISingleBuilder sub, TypeInfo type, ILifecycle cycle)
	{
		this.subbuilder = sub;
		this.size = type.tsize();
		this.cycle = cycle;
	}

	void build (Builder builder, void* fill)
	{
		if (instance == null || !cycle.current(iteration))
		{
			instance = new void[size];
			subbuilder.build (builder, instance.ptr);
		}
		fill[0..size] = instance[0..$];
	}

	override string toString ()
	{
		return "Lifecycle(" ~ (cast(Object) subbuilder).toString ~ ", Lifecycle: " ~ (cast(Object)cycle).toString ~ ")";
	}
}

class ConstantBuilder : ISingleBuilder
{
	void[] instance;

	this (void[] instance)
	{
		this.instance = instance;
	}

	void build (Builder builder, void* fill)
	{
		fill[0..instance.length] = instance[0..$];
	}

	string toString()
	{
		return "Constant";
	}
}

class CtorBuilder (T) : ISingleBuilder
{
	static assert (is (T == class), "CtorBuilder cannot be associated with a type that is not a class. This indicates a bug in dconstructor.");

	void build (Builder parent, void* fill)
	{
		parent.circular.push (typeid(T));
		auto object = get (parent);
		parent.circular.endCtor (typeid(T));
		static if (is (typeof(T.inject) == function))
		{
			mixin (`object.inject(` ~ get_deps_impl!(T, 0, "inject") ~ `);`);
		}
		fill[0..object.sizeof] = (cast(void*) &object)[0 .. object.sizeof];
		auto arr = fill[0..object.sizeof];
		parent.intercept (arr, typeid(T));
	}

	import std.traits;
	T get (Builder parent)
	{
		mixin (get_deps!(T) ());
	}

	override string toString ()
	{
		return "Constructor(" ~ T.stringof ~ ")";
	}
}

class ContextAwareBuilder
{
	ISingleBuilder regular;
	ISingleBuilder[TypeInfo] specialized;

	void build (Builder parent, TypeInfo self, void* fill)
	{
		auto type = parent.stack.buildfor;
		auto ptr = type in specialized;
		if (ptr)
			return (*ptr).build (parent, fill);
		else if (regular)
			return regular.build (parent, fill);
		else
			throw new BindingException (
					"You asked me to build a `" ~ self.toString ~ "', which has been registered for some types that you want to build. However, there is no registered way for me to build it by default, and the available specializations do not match the current type being built, which is `" ~ type.toString ~ "'.");
	}

	void add (ISingleBuilder builder, TypeInfo context)
	{
		if (context)
		{
			specialized[context] = builder;
		}
		else
		{
			regular = builder;
		}
	}

	string toString ()
	{
		if (regular) return regular.toString;
		else return "specialized ContextAwareBuilder";
	}
}

