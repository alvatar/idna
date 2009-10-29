/*******************************************************************************

	copyright:      Copyright (c) 2008 Matthias Walter. All rights reserved

    authors:        Matthias Walter

*******************************************************************************/

module meta.type;

private import meta.demangle; 

/++
 + For a given class type, returns the name of it's constructor,
 + prefixed by the fully qualified class name
 +/
template constructorNameOf (T)
{
	static assert (is (T == class), "constructorNameOf needs a class as parameter.");
	string constructorNameOf = toString (demangleType !(T), false, 0, 0) ~ ".__ctor";
}

/++
 + For a given class type, returns the name of it's destructor,
 + prefixed by the fully qualified class name
 +/
template destructorNameOf (T)
{
	static assert (is (T == class), "destructorNameOf needs a class as parameter.");
	string destructorNameOf = toString (demangleType !(T), false, 0, 0) ~ ".__dtor";
}
