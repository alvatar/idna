module pattern.dconstructor.lifecycles;

import pattern.dconstructor.lifecycle;
import pattern.dconstructor.property;
//import tango.core.RuntimeTraits;

/** A Lifecycle that lasts only for the time it takes to build one object. */
class InstanceLifecycle : ILifecycle
{               
	ulong key() { return 0; }
	bool current(ulong key) { return false; }
}

/** A Lifecycle that does not end, ever. */
class SingletonLifecycle : ILifecycle
{
	ulong key() { return 0; }
	bool current(ulong key) { return true; }
}

/** Iterate through all interfaces that type implements, directly or indirectly, including base interfaces. */
struct applyInterfaces
{
    ///
    static applyInterfaces opCall (ClassInfo type)
    {
        applyInterfaces apply;
        apply.type = type;
        return apply;
    }

    ///
    int opApply (int delegate (ref ClassInfo) dg)
    {
        int result = 0;
        for (; type; type = type.base)
        {
            foreach (iface; type.interfaces)
            {
                result = dg (iface.classinfo);
                if (result)
                    return result;
                result = applyInterfaces (iface.classinfo).opApply (dg);
                if (result)
                    return result;
            }
        }
        return result;
    }

    ClassInfo type;
}

bool implements (ClassInfo implementor, ClassInfo iface)
{
    foreach (info; applyInterfaces (implementor))
    {
        if (iface is info)
            return true;
    }
    return false;
}
/// If the given type represents a typedef, return the actual type.
TypeInfo realType (TypeInfo type)
{
    // TypeInfo_Typedef.next() doesn't return the actual type.
    // I think it returns TypeInfo_Typedef.base.next().
    // So, a slightly different method.
    auto def = cast(TypeInfo_Typedef) type;
    if (def !is null)
    {
        return def.base;
    }
    return type;
}


/// Returns true iff the given type represents an interface.
bool isInterface (TypeInfo type)
{
    return (cast(TypeInfo_Interface) type) !is null;
}

/// Returns true if the type represents a class (false for interfaces).
bool isClass (TypeInfo type)
{
    type = realType (type);
    return (cast(TypeInfo_Class) type) !is null;
}

/// If the given type represents a class, return its ClassInfo; else return null;
ClassInfo asClass (TypeInfo type)
{
    if (isInterface (type))
    {
        auto klass = cast(TypeInfo_Interface) type;
        return klass.info;
    }
    if (isClass (type))
    {
        auto klass = cast(TypeInfo_Class) type;
        return klass.info;
    }
    return null;
}

/** If a type implements Singleton, use SingletonLifecycle. */
class SingletonLifecycleProvider : ILifecycleProvider
{
	private SingletonLifecycle _single;
	this ()
	{
		_single = new SingletonLifecycle;
	}
	
	ILifecycle get(TypeInfo type)
	{
		if (implements(asClass(type), Singleton.classinfo))
		{
			return _single;
		}
		return null;
	}
}

/** If a type implements Instance, use InstanceLifecycle. */
class InstanceLifecycleProvider : ILifecycleProvider
{
	private InstanceLifecycle _single;
	this ()
	{
		_single = new InstanceLifecycle;
	}
	
	ILifecycle get(TypeInfo type)
	{
		if (implements(asClass(type), Instance.classinfo))
		{
			return _single;
		}
		return null;
	}
}
