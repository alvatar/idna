/*******************************************************************************

	copyright:      Copyright (c) 2008 Matthias Walter. All rights reserved

    authors:        Matthias Walter

*******************************************************************************/

module meta.identifier;

import meta.demangle;

/++ Returns the pretty printed name of a given identifier, optionally prefixed by its type +/
template prettyNameOf (alias A, bool show_type = false)
{
	string prettyNameOf = toString (demangleIdentifier !(A), show_type, 1, 1);
}

/++ Returns the fully qualified name of a given identifier +/
template fullyQualifiedNameOf (alias A)
{
	string fullyQualifiedNameOf = toString (demangleIdentifier !(A), false, 0, byte.max);
}

/// Returns the access name of a given identifier.
/// WARNING: This only works for local and global variables,
/// not for member variables of any kind! For those you will
/// see the class it belongs to.

template accessNameOf (alias A)
{
	string accessNameOf = getAccessName (demangleIdentifier !(A));
}

/++ Returns true, if the given identifier is a static function +/
template isFunction (alias A)
{
	const bool isFunction = isFunction_ !(A).result;
}

/++ Returns true, if the given identifier is a method (a non-static function) +/
template isMethod (alias A)
{
	const bool isMethod = isMethod_ !(A).result;
}

/++ Worker template for isFunctio +/
private template isFunction_ (alias A)
{
	const ident = demangleIdentifier !(A);
	static if (ident.type == Demangle.IdentifierQualifiedName)
	{
		const Demangle temp = ident.sub[ident.sub.length-1];
		static if (temp.type == Demangle.IdentifierTyped)
			const bool result = temp.sub[0].type == Demangle.TypeFunction;
		else
			const bool result = false;
	}
	else static if (ident.type == Demangle.IdentifierTyped)
		const bool result = ident.sub[0].type == Demangle.TypeFunction;
	else
		const bool result = false;
}

/++ Worker template for isMetho +/
private template isMethod_ (alias A)
{
	const ident = demangleIdentifier !(A);
	static if (ident.type == Demangle.IdentifierQualifiedName)
	{
		const Demangle temp = ident.sub[ident.sub.length-1];
		static if (temp.type == Demangle.IdentifierTyped)
			const bool result = temp.sub[0].type == Demangle.TypeDelegate;
		else
			const bool result = false;
	}
	else static if (ident.type == Demangle.IdentifierTyped)
		const bool result = ident.sub[0].type == Demangle.TypeDelegate;
	else
		const bool result = false;
}
