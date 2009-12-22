/*******************************************************************************

	copyright:      Copyright (c) 2008 Matthias Walter. All rights reserved

    authors:        Matthias Walter

*******************************************************************************/

module meta.demangle;

import meta.numeric;
import meta.string_funcs;
import meta.char_funcs;

// Activate this to debug compile-time-demangling via pragmas

// debug = Demangle;

/++ Returns the mangle of the given type +/
template demangleType (T)
{
	const demangleType = demangleType !(T.mangleof);
}

/++ Returns the mangle of the given identifier +/
template demangleIdentifier (alias A)
{
	const demangleIdentifier = demangleIdentifier_ !(A).result;
}

/++ Worker template for demangleIdentifie +/
private template demangleIdentifier_ (alias A)
{
	const type = demangleType !(rawIdentifierMangle !(A));
	const array = type.sub[0].sub[1].sub[0].sub[0].sub;
	const result = findFirstTemplateDemangle (array).sub[0].sub[0];
}

/++ Helper function to find the first template in an array +/
private Demangle findFirstTemplateDemangle (Demangle[] array)
{
	foreach (d; array)
	{
		if (d.type == Demangle.IdentifierTemplate)
			return d;
	}
	return Demangle ("Could not find a template in array.");
}

/++ Inner class for the demangling magic +/
template Inner (alias A)
{
	class Inner { }
}

/++ Outer class for the demangling magic +/
template Outer (alias A)
{
	void function (Inner !(A)) Outer;
}

/++ Worker template for demangling magic +/
template rawIdentifierMangle (alias A)
{
	string rawIdentifierMangle = typeof (&Outer !(A)).mangleof;
}

/*******************************************************************************

	Prints the Demangle.
	
	Params:
	show_type = Whether to prefix the identifier with its type.
	function_depth = Recursion depth to print function arguments.
	template_depth = Recursion depth to print template parameters.
	main_call = Whether this is the main call or a recursive call.
	
	Returns:
	Returns the demangled identifier in a readable representation. 

********************************************************************************/

public pure string toString (immutable Demangle demangle, bool show_type, byte function_depth = 1, byte template_depth = 1, bool main_call = true)
{
	switch (demangle.type)
	{
	case Demangle.IdentifierSimple:
		return demangle.cdata;
	case Demangle.IdentifierQualifiedName:
		string result = "";
		if (show_type)
			result = getPrefix (demangle.sub[$-1], function_depth, template_depth) ~ " ";
		foreach (i, ident; demangle.sub)
			result ~= (i > 0 ? "." : "") ~ toString (ident, false, function_depth, template_depth, false);
		return result;
	case Demangle.IdentifierTyped:
		string result = "";
		if (show_type && (demangle.sub[0].type == Demangle.TypeFunction || demangle.sub[0].type == Demangle.TypeDelegate))
			result = getPrefix (demangle.sub[0], function_depth, template_depth) ~ " ";
		result ~= demangle.cdata;
		if (function_depth > 0 && (demangle.sub[0].type == Demangle.TypeFunction || demangle.sub[0].type == Demangle.TypeDelegate) && (demangle.idata & 32) == 0)
		{
			result ~= " (";
			foreach (i, arg; demangle.sub[0].sub[1..$])
			{
				result ~= (i > 0 ? ", " : "") ~ toString (arg, false, cast(byte)(function_depth-1), cast(byte)(template_depth-1), false);
			}
			result ~= ")";
		}
		return result;
	case Demangle.IdentifierTemplate:
		if (template_depth > 0)
		{
			string result = demangle.cdata ~ " !(";
			foreach (i, arg; demangle.sub)
				result ~= (i > 0 ? ", " : "") ~ toString (arg, false, cast(byte)(function_depth-1), cast(byte)(template_depth-1), false);
			return result ~ ")";
		}
		else
			return demangle.cdata;
	
	case Demangle.ParameterAlias:
		return toString (demangle.sub[0], show_type, function_depth, template_depth, false);
	case Demangle.ParameterType:
		return toString (demangle.sub[0], show_type, function_depth, template_depth, false);
	case Demangle.ParameterValue:
		return toString (demangle.sub[0], show_type, function_depth, template_depth, false) ~ " = " ~ toString (demangle.sub[1], show_type, function_depth, template_depth, false);
		
	case Demangle.ArgumentIn:
	case Demangle.ArgumentOut:
	case Demangle.ArgumentRef:
	case Demangle.ArgumentLazy:
		return getBaseString(demangle) ~ toString (demangle.sub[0], show_type, function_depth, template_depth, false);
	case Demangle.ArgumentVariadic:
		return "... ";
		
	case Demangle.TypeConst: 
	case Demangle.TypeInvariant:
		return getBaseString (demangle) ~ toString (demangle.sub[0], show_type, function_depth, template_depth, main_call);
	case Demangle.TypeStruct:
	case Demangle.TypeClass:
	case Demangle.TypeEnum:
	case Demangle.TypeTypedef:
		return (main_call && show_type ? getBaseString (demangle) ~ " " : "") ~ toString (demangle.sub[0], false, function_depth, template_depth, main_call);
	case Demangle.TypeArray: 
	case Demangle.TypeStaticArray:
		return toString (demangle.sub[0], show_type, function_depth, template_depth, main_call) ~ getBaseString (demangle);
	case Demangle.TypeAssociativeArray:
		return toString (demangle.sub[0], show_type, function_depth, template_depth, main_call) ~ "[" ~ toString (demangle.sub[1], show_type, function_depth, template_depth, main_call) ~ "]";
	case Demangle.TypePointer:
		return toString (demangle.sub[0], show_type, function_depth, template_depth, main_call) ~ "*";
	case Demangle.TypeFunction:
		return Demangle.printExtern (demangle.idata) ~ toString (demangle.sub[0], show_type, function_depth, template_depth, false) ~ " function () ";
	case Demangle.TypeDelegate:
		return Demangle.printExtern (demangle.idata) ~ toString (demangle.sub[0], show_type, function_depth, template_depth, false) ~ " delegate () ";
	default: return getBaseString (demangle);
	}
}


/++ Returns the prefix of a demangle +/
private pure string getPrefix (immutable Demangle demangle, byte function_depth, byte template_depth)
{
	switch (demangle.type)
	{
	case Demangle.IdentifierSimple:
		return demangle.cdata;
	case Demangle.IdentifierTyped:
		string result = getPrefix (demangle.sub[0], function_depth, template_depth);
		if ((demangle.sub[0].type == Demangle.TypeFunction || demangle.sub[0].type == Demangle.TypeDelegate) && (demangle.sub[0].idata & 32) != 0)
		{
			result ~= " " ~ getBaseString (demangle.sub[0]) ~ " (";
			foreach (i, arg; demangle.sub[0].sub[1..$])
				result ~= (i > 0 ? ", " : "") ~ toString (arg, false, function_depth, template_depth, false); 
			result ~= ")";
		}
		return result;
		
	case Demangle.TypeFunction:
	case Demangle.TypeDelegate:
		return Demangle.printExtern (demangle.idata) ~ toString (demangle.sub[0], false, function_depth, template_depth, false);
	case Demangle.TypeArray:
	case Demangle.TypeStaticArray:
		return getPrefix (demangle.sub[0], function_depth, template_depth) ~ getBaseString (demangle);
	case Demangle.TypeAssociativeArray:
		return getPrefix (demangle.sub[0], function_depth, template_depth) ~ "[" ~ getPrefix (demangle.sub[1], function_depth, template_depth) ~ "]";
	default: return getBaseString (demangle);
	}
}

/++ Returns a debug string of a demangled identifier which contains almost all information +/
public pure string debugString (immutable Demangle demangle, string indent = "", bool already_indended = false)
{
	string first_indent = already_indended ? "" : indent;
	bool is_static = false;
	switch (demangle.type)
	{

	case Demangle.Invalid:
		return "<invalid mangle: \"" ~ demangle.cdata ~ "\">";
	case Demangle.IdentifierSimple:
		return indent ~ demangle.cdata;
	case Demangle.IdentifierTyped:
		return first_indent ~ demangle.cdata ~ " of type " ~ debugString (demangle.sub[0], indent, true);
	case Demangle.IdentifierTemplate:
		string result = first_indent ~ demangle.cdata ~ " (Template):\n";
		foreach (i, arg; demangle.sub)
			result ~= debugString (arg, indent ~ "  ", false) ~ (i+1 < demangle.sub.length ? "\n" : "");
		return result;
	case Demangle.IdentifierQualifiedName:
		string result = first_indent ~ "{\n";
		foreach (i, ident; demangle.sub)
			result ~= debugString (ident, indent ~ "  ", false) ~ "\n";
		return result ~ indent ~ "}";
	case Demangle.ParameterAlias:
	case Demangle.ParameterType:
		return indent ~ debugString (demangle.sub[0], indent, true);
	case Demangle.ParameterValue:
		return indent ~ debugString (demangle.sub[0], indent, true) ~ " = " ~ debugString (demangle.sub[1]);
	case Demangle.ArgumentIn:
		return indent ~ "In argument: " ~ debugString (demangle.sub[0], indent, true);
	case Demangle.ArgumentOut:
		return indent ~ "Out argument: " ~ debugString (demangle.sub[0], indent, true);
	case Demangle.ArgumentRef:
		return indent ~ "Ref argument: " ~ debugString (demangle.sub[0], indent, true);
	case Demangle.ArgumentLazy:
		return indent ~ "Lazy argument: " ~ debugString (demangle.sub[0], indent, true);
	case Demangle.ArgumentVariadic:
		return indent ~ "Variadic argument";
	case Demangle.TypeConst: 
	case Demangle.TypeInvariant:
		return getBaseString (demangle) ~ debugString (demangle.sub[0], indent, true);
	case Demangle.TypeArray:
	case Demangle.TypeStaticArray:
		return debugString (demangle.sub[0], indent, true) ~ getBaseString (demangle);
	case Demangle.TypeAssociativeArray:
		return debugString (demangle.sub[0], indent, true) ~ "[" ~ debugString (demangle.sub[1], indent, true) ~ "]";
	case Demangle.TypePointer:
		return "Pointer:\n  " ~ indent ~ debugString (demangle.sub[0], indent ~ "  ", true);
	case Demangle.TypeClass:
		return "Class:\n" ~ debugString (demangle.sub[0], indent ~ "  ", false);
	case Demangle.TypeStruct:
		return "Struct:\n" ~ debugString (demangle.sub[0], indent ~ "  ", false);
	case Demangle.TypeEnum:
		return "Enum:\n" ~ debugString (demangle.sub[0], indent ~ "  ", false);
	case Demangle.TypeTypedef:
		return "Typedef:\n" ~ debugString (demangle.sub[0], indent ~ "  ", false);
	case Demangle.TypeFunction:
		string result = Demangle.printExtern (demangle.idata);
		if ((demangle.idata & 32) != 0)
			result ~= "Function-Pointer:\n";
		else
			result ~= "Function:\n";
		result ~= indent ~ "  return: " ~ debugString (demangle.sub[0], indent ~ "  ", true) ~ "\n";
		foreach (i, t; demangle.sub[1..$])
			result ~= debugString (t, indent ~ "  ", true) ~ (i+2 < demangle.sub.length ? "\n" : "");
		return result;
	case Demangle.TypeDelegate:
		string result = Demangle.printExtern (demangle.idata);
		if ((demangle.idata & 32) != 0)
			result ~= "Delegate:\n";
		else
			result ~= "Method:\n";
		result ~= indent ~ "  return: " ~ debugString (demangle.sub[0], indent ~ "  ", true) ~ "\n";
		foreach (i, t; demangle.sub[1..$])
			result ~= debugString (t, indent ~ "  ", true) ~ (i+2 < demangle.sub.length ? "\n" : "");
		return result;	
	default:
		return getBaseString (demangle);
	}
}

/// Returns the very basic string of the identifier type.

private pure string getBaseString (immutable Demangle demangle)
{
	switch (demangle.type)
	{
	case Demangle.ArgumentIn: return "";
	case Demangle.ArgumentOut: return "out ";
	case Demangle.ArgumentRef: return "ref ";
	case Demangle.ArgumentLazy: return "lazy ";
	case Demangle.ArgumentVariadic: return "... ";

	case Demangle.TypeConst: return "const";
	case Demangle.TypeInvariant: return "invariant";
	case Demangle.TypeArray: return "[]";
	case Demangle.TypeStaticArray: return "[" ~ intToDec (demangle.idata) ~ "]";
	case Demangle.TypeAssociativeArray: return "[]";
	case Demangle.TypePointer: return "*";
	case Demangle.TypeFunction: return "function";
	case Demangle.TypeDelegate: return "delegate";
	case Demangle.TypeClass: return "class";
	case Demangle.TypeStruct: return "struct";
	case Demangle.TypeEnum: return "enum";
	case Demangle.TypeTypedef: return "typedef";
	case Demangle.TypeVoid: return "void";
	case Demangle.TypeByte: return "byte";
	case Demangle.TypeUByte: return "ubyte";
	case Demangle.TypeShort: return "short";
	case Demangle.TypeUShort: return "ushort";
	case Demangle.TypeInt: return "int";
	case Demangle.TypeUInt: return "uint";
	case Demangle.TypeLong: return "long";
	case Demangle.TypeULong: return "ulong";
	case Demangle.TypeFloat: return "float";
	case Demangle.TypeDouble: return "double";
	case Demangle.TypeReal: return "real";
	case Demangle.TypeIFloat: return "ifloat";
	case Demangle.TypeIDouble: return "idouble";
	case Demangle.TypeIReal: return "ireal";
	case Demangle.TypeCFloat: return "cfloat";
	case Demangle.TypeCDouble: return "cdouble";
	case Demangle.TypeCReal: return "creal";
	case Demangle.TypeBool: return "bool";
	case Demangle.TypeChar: return "char";
	case Demangle.TypeWChar: return "wchar";
	case Demangle.TypeDChar: return "char";
	
	case Demangle.ValueNull: return "null";
	case Demangle.ValueNumber: return intToDec (demangle.idata);
	case Demangle.ValueFloat: return floatToDec (demangle.fdata.re);
	case Demangle.ValueComplex: return floatToDec (demangle.fdata.re) ~ " + " ~ floatToDec(demangle.fdata.im) ~ "i";
	case Demangle.ValueString: return "\"" ~ demangle.cdata ~ "\"";
	case Demangle.ValueWString: return "\"" ~ demangle.cdata ~ "\"w";
	case Demangle.ValueDString: return "\"" ~ demangle.cdata ~ "\"d";

	default: return "<no base string>";
	}
}

/// Returns the name with which one can access the demangled identifier.

public pure string getAccessName (immutable Demangle demangle)
{
	switch (demangle.type)
	{
	case Demangle.Invalid:
		return "<invalid identifier>";
	case Demangle.IdentifierSimple:
	case Demangle.IdentifierTyped:
		return demangle.cdata;
	case Demangle.IdentifierQualifiedName:
		string result = getAccessName (demangle.sub[$-1]);
		int i = demangle.sub.length - 2;
		while (i >= 0)
		{
			if (demangle.sub[i].type == Demangle.Invalid || demangle.sub[i].type == Demangle.IdentifierTyped && (demangle.sub[i].sub[0].type == Demangle.TypeFunction || demangle.sub[i].sub[0].type == Demangle.TypeDelegate))
				break;
			result = getAccessName (demangle.sub[i]) ~ "." ~ result;
			i--;
		}
		return result;
	case Demangle.IdentifierTemplate:
		string result = demangle.cdata ~ " !(";
		foreach (i, arg; demangle.sub)
			result ~= (i > 0 ? ", " : "") ~ toString (arg, false, 0, byte.max, false);
		result ~= ")";
		return result;
	default:
		return "<access error>";
	}
}

/**
 * Demangle contains all information about an identifier which
 * can be extracted from its mangle.
 */  

struct Demangle
{
public:
	
	/// Type of the Demangled identifier.
	enum 
	{
		Invalid,
		IdentifierQualifiedName,
		IdentifierSimple,
		IdentifierTyped,
		IdentifierTemplate,
		
		ParameterAlias,
		ParameterType,
		ParameterValue,
		
		ArgumentIn,
		ArgumentOut,
		ArgumentRef,
		ArgumentLazy,
		ArgumentVariadic,

		TypeConst,
	    TypeInvariant,
	    TypeArray,
	    TypeStaticArray,
	    TypeAssociativeArray,
	    TypePointer,

	    TypeFunction, // (0 = D, 1 = C, 2 = Windows, 3 = Pascal, 4 = C++) | (8 = pure) | (16 = nothrow) | (32 == real function) 
	    TypeDelegate, // (0 = D, 1 = C, 2 = Windows, 3 = Pascal, 4 = C++) | (8 = pure) | (16 = nothrow) | (32 == real function)

	    TypeClass,
	    TypeStruct,
	    TypeEnum,
	    TypeTypedef,

	    TypeVoid,
	    TypeByte,
	    TypeUByte,
	    TypeShort,
	    TypeUShort,
	    TypeInt,
	    TypeUInt,
	    TypeLong,
	    TypeULong,
	    TypeFloat,
	    TypeDouble,
	    TypeReal,
	    TypeIFloat,
	    TypeIDouble,
	    TypeIReal,
	    TypeCFloat,
	    TypeCDouble,
	    TypeCReal,
	    TypeBool,
	    TypeChar,
	    TypeWChar,
	    TypeDChar,
	    
	    ValueNull,
	    ValueNumber,
	    ValueFloat,
	    ValueComplex,
	    ValueString,
	    ValueWString,
	    ValueDString,
	}

	/// Type of the demangled identifier.
	int type;
	/// Array of sub-identifiers, types and values.
	Demangle[] sub;
	/// Either the integer data or some attributes / flags.
	long idata;
	/// String data.
	string cdata;
	/// Float data.
	creal fdata;
	
	/// Main constructor.

	static Demangle opCall (int type, Demangle[] sub = [], long idata = 0, string cdata = [], real re = 0.0, real im = 0.0)
	{
		Demangle result = { type, sub, idata, cdata, re + 1.0i * im};
		return result;
	}
	
	/// Error constructor.
	
	static Demangle opCall (string error_message)
	{
		Demangle result = { Invalid, [], 0, error_message, 0.0 + 0.0i};
		return result;
	}

	/// Returns the attribute id for different extern types.

	private static long demangleExtern (char c)
	{
		switch (c)
		{
			case 'F': return 0;
			case 'U': return 1;
			case 'W': return 2;
			case 'V': return 3;
			case 'R': return 4;
			default: return -1;
		}
	}
	
	/// Prints the extern type according to the given attribute flag.

	private pure static string printExtern (long flag)
	{
		switch (flag & 7)
		{
			case 0: return "";
			case 1: return "extern (C) ";
			case 2: return "extern (Windows) ";
			case 3: return "extern (Pascal) ";
			case 4: return "extern (C++) ";
			default: return "extern (Unknown = " ~ intToDec (flag & 7) ~ ") ";
		}
	}

}

/// Demangle the mangle of a type.

template demangleType (string str, string indent = "")
{
	const demangleType = demangleType_ !(str, indent).demangle; 
}

/// Worker template for demangleType.

private template demangleType_ (string str, string indent = "")
{
	debug (Demangle)
		pragma (msg, indent ~ "demangleType (\"" ~ str ~ "\")");

	static if (str.length == 0)
		static assert (false, "demangleType got empty string.");
	else static if (str[0] == 'a') { const demangle = Demangle (Demangle.TypeChar); const remaining = str[1..$]; }
	else static if (str[0] == 'u') { const demangle = Demangle (Demangle.TypeWChar); const remaining = str[1..$]; }
	else static if (str[0] == 'w') { const demangle = Demangle (Demangle.TypeDChar); const remaining = str[1..$]; }
	else static if (str[0] == 'v') { const demangle = Demangle (Demangle.TypeVoid); const remaining = str[1..$]; }
	else static if (str[0] == 'g') { const demangle = Demangle (Demangle.TypeByte); const remaining = str[1..$]; }
	else static if (str[0] == 'h') { const demangle = Demangle (Demangle.TypeUByte); const remaining = str[1..$]; }
	else static if (str[0] == 's') { const demangle = Demangle (Demangle.TypeShort); const remaining = str[1..$]; }
	else static if (str[0] == 't') { const demangle = Demangle (Demangle.TypeUShort); const remaining = str[1..$]; }
	else static if (str[0] == 'i') { const demangle = Demangle (Demangle.TypeInt); const remaining = str[1..$]; }
	else static if (str[0] == 'k') { const demangle = Demangle (Demangle.TypeUInt); const remaining = str[1..$]; }
	else static if (str[0] == 'l') { const demangle = Demangle (Demangle.TypeLong); const remaining = str[1..$]; }
	else static if (str[0] == 'm') { const demangle = Demangle (Demangle.TypeULong); const remaining = str[1..$]; }
	else static if (str[0] == 'f') { const demangle = Demangle (Demangle.TypeFloat); const remaining = str[1..$]; }
	else static if (str[0] == 'd') { const demangle = Demangle (Demangle.TypeDouble); const remaining = str[1..$]; }
	else static if (str[0] == 'e') { const demangle = Demangle (Demangle.TypeReal); const remaining = str[1..$]; }
	else static if (str[0] == 'o') { const demangle = Demangle (Demangle.TypeIFloat); const remaining = str[1..$]; }
	else static if (str[0] == 'p') { const demangle = Demangle (Demangle.TypeIDouble); const remaining = str[1..$]; }
	else static if (str[0] == 'j') { const demangle = Demangle (Demangle.TypeIReal); const remaining = str[1..$]; }
	else static if (str[0] == 'q') { const demangle = Demangle (Demangle.TypeCFloat); const remaining = str[1..$]; }
	else static if (str[0] == 'r') { const demangle = Demangle (Demangle.TypeCDouble); const remaining = str[1..$]; }
	else static if (str[0] == 'c') { const demangle = Demangle (Demangle.TypeCReal); const remaining = str[1..$]; }
	else static if (str[0] == 'b') { const demangle = Demangle (Demangle.TypeBool); const remaining = str[1..$]; }
	else static if (str[0] == 'A')
	{
		alias demangleType_ !(str[1..$], indent ~ " ") temp;

		const demangle = Demangle (Demangle.TypeArray, [temp.demangle]);
		const remaining = temp.remaining;
	}
	else static if (str[0] == 'H')
	{
		alias demangleType_ !(str[1..$], indent ~ " ") temp1;
		alias demangleType_ !(temp1.remaining, indent ~ " ") temp2;

		const demangle = Demangle (Demangle.TypeAssociativeArray, [temp2.demangle, temp1.demangle]);
		const remaining = temp2.remaining;
	}
	else static if (str[0] == 'G')
	{
		const temp_number = decToInt (str[1..$]);
		const temp_remaining = consumeDecInt (str[1..$]);

		alias demangleType_ !(temp_remaining, indent ~ " ") temp;

		const demangle = Demangle (Demangle.TypeStaticArray, [temp.demangle], temp_number);
		const remaining = temp.remaining;
	}
	else static if (str.length > 1 && str[0] == 'P' && Demangle.demangleExtern (str[1]) >= 0)
	{
		mixin demangleFunction_ !(Demangle.TypeFunction, str[1..$], indent ~ " ", true);
	}
	else static if (str[0] == 'P')
	{
		alias demangleType_ !(str[1..$], indent ~ " ") temp;

		const demangle = Demangle (Demangle.TypePointer, [temp.demangle]);
		const remaining = temp.remaining;
	}
	else static if (Demangle.demangleExtern (str[0]) >= 0)
	{
		mixin demangleFunction_ !(Demangle.TypeFunction, str, indent ~ " ", false);
	}
	else static if (str[0] == 'C')
	{
		alias demangleQualifiedName_ !(str[1..$], indent ~ " ") temp;

		const demangle = Demangle (Demangle.TypeClass, [temp.demangle]);
		const remaining = temp.remaining;
	}
	else static if (str[0] == 'S')
	{
		alias demangleQualifiedName_ !(str[1..$], indent ~ " ") temp;

		const demangle = Demangle (Demangle.TypeStruct, [temp.demangle]);
		const remaining = temp.remaining;
	}
	else static if (str[0] == 'E')
	{
		alias demangleQualifiedName_ !(str[1..$], indent ~ " ") temp;

		const demangle = Demangle (Demangle.TypeEnum, temp.demangle);
		const remaining = temp.remaining;
	}
	else static if (str[0] == 'T')
	{
		alias demangleQualifiedName !(str[1..$], indent ~ " ") temp;

		const demangle = Demangle (Demangle.TypeTypedef, temp.demangle);
		const remaining = temp.remaining;
	}
	else static if (str.length > 1 && str[0] == 'D' && Demangle.demangleExtern (str[1]) >= 0)
	{
		mixin demangleFunction_ !(Demangle.TypeDelegate, str[1..$], indent ~ " ", true);
	}
	else
	{
		static assert (false, "Error  in demangleType: Unknown type");
	}
}

/// Demangle the mangle of a function.

template demangleFunction (string str, string indent = "")
{
	const demangleFunction = demangleFunction_ (str, indent).demangle;
}

/// Worker template for demangleFunction.

private template demangleFunction_ (int type, string str, string indent = "", bool is_anonymous)
{
	debug (Demangle)
		pragma (msg, indent ~ "demangleFunction_ (\"" ~ str ~ "\")");

	const long call_convention = Demangle.demangleExtern (str[0]);

	alias demangleFunctionArguments_ !(str[1..$], indent ~ " ") argument_types;
	alias demangleType_ !(argument_types.remaining, indent ~ " ") return_type;

	const demangle = Demangle (type, return_type.demangle ~ argument_types.demangles, call_convention | (is_anonymous ? 32 : 0));
	const remaining = return_type.remaining;
}

/// Demangle the mangle of function arguments.

template demangleFunctionArguments (string str, string indent = "")
{
	const demangleFunctionArguments = demangleFunctionArguments_ !(str, indent).demangle;
}

/// Worker template for demangleFunctionArguments.

private template demangleFunctionArguments_ (string str, string indent = "")
{
	debug (Demangle)
		pragma (msg, indent ~ "demangleFunctionArguments (\"" ~ str ~ "\")");

	static if (str.length > 0 && str[0] == 'Z')
	{
		const Demangle[] demangles = [];
		const remaining = str[1..$];
	}
	else static if (str.length > 0 && str[0] == 'X' || str[0] == 'Y')
	{
		const Demangle[] demangles = [Demangle (Demangle.ArgumentVariadic)];
		const remaining = str[1..$];
	}
	else
	{
		static if (str.length > 0 && str[0] == 'L') const auto arg_type = Demangle.ArgumentLazy;
		else static if (str.length > 0 && str[0] == 'K') const auto arg_type = Demangle.ArgumentRef;
		else static if (str.length > 0 && str[0] == 'J') const auto arg_type = Demangle.ArgumentOut;
		else const auto arg_type = Demangle.ArgumentIn;
		
		static if (arg_type == Demangle.ArgumentIn) const temp_remaining1 = str;
		else const temp_remaining1 = str[1..$];

		alias demangleType_ !(temp_remaining1, indent ~ " ") arg;
		alias demangleFunctionArguments_ !(arg.remaining, indent ~ " ") others;

		const Demangle[] demangles = Demangle (arg_type, [arg.demangle]) ~ others.demangles;
		const remaining = others.remaining;
	}
}

/// Demangle the mangle of a qualfied name.

template demangleQualifiedName (string str, string indent = "")
{
	const demangleQualifiedName = demangleQualifiedName_ !(str, indent).demangle;
}

/// Worker template for demangleQualifiedName.

private template demangleQualifiedName_ (string str, string indent = "")
{
	debug (Demangle)
		pragma (msg, indent ~ "demangleQualifiedName (\"" ~ str ~ "\")");
	
	static if (str.length > 1 && str[0..2] == "_D") string str2 = str[2..$];
	else string str2 = str;

	static if (str2.length > 0 && isDecDigit (str2[0]))
	{
		alias demangleSymbol_ !(str2, indent ~ " ") temp;
		alias demangleQualifiedName_ ! (temp.remaining, indent) others;
		
		const demangle = Demangle (Demangle.IdentifierQualifiedName, temp.demangle ~ others.demangle.sub);
		const remaining = others.remaining;
	}
	else
	{
		const demangle = Demangle (Demangle.IdentifierQualifiedName, []);
		const remaining = str2;
	}
}

/// Demangle the mangle of a single symbol.

template demangleSymbol (string str, string indent = "")
{
	const demangleSymbol = demangleSymbol_ !(str, indent).demangle;
}

/// Worker template for demangleSymbol.

private template demangleSymbol_ (string str, string indent = "")
{
	debug (Demangle)
		pragma (msg, indent ~ "demangleSymbol (\"" ~ str ~ "\")");

	alias demangleLName !(str, indent ~ " ") name;

	static if (name.name.length > 3 && name.name[0..3] == "__T")
	{
		alias demangleLName !(name.name[3..$], indent ~ " ") instance_name;
		alias demangleTemplateArguments_ !(instance_name.remaining, indent ~ " ") arguments;
		
		const demangle = Demangle (Demangle.IdentifierTemplate, arguments.demangles, 0, instance_name.name);
		const remaining = name.remaining; 		
	}
	else static if (name.remaining.length == 0 || isDecDigit (name.remaining[0]) || name.remaining[0] == 'Z' || name.remaining[0] == 'Y' || name.remaining[0] == 'X')
	{
		const remaining = name.remaining;
		const demangle = Demangle (Demangle.IdentifierSimple, [], 0, name.name);
	}
	else static if (name.remaining[0] == 'M')
	{
		alias demangleFunction_ !(Demangle.TypeDelegate, name.remaining[1..$], indent ~ " ", false) temp;

		const demangle = Demangle (Demangle.IdentifierTyped, [temp.demangle], 0, name.name);
		const remaining = temp.remaining;
	}
	else
	{
		alias demangleType_ !(name.remaining, indent ~ " ") temp;

		const demangle = Demangle (Demangle.IdentifierTyped, [temp.demangle], 0, name.name);
		const remaining = temp.remaining;
	}
}

/// Parse an LName.

template demangleLName (string str, string indent = "")
{
	debug (Demangle)
		pragma (msg, indent ~ "demangleLName (\"" ~ str ~ "\")");

	const long temp_size = decToInt (str);
	string temp_remaining = consumeDecInt (str);

	string name = temp_remaining [0..temp_size];
	const remaining = temp_remaining [temp_size..$];
}

/// Demangle the mangle of template parameters.

template demangleTemplateArguments (string str, string indent = "")
{
	const demangleTemplateArguments = demangleTemplateArguments_ !(str, indent).demangles;
}

/// Worker template for demangleTemplateArguments.

private template demangleTemplateArguments_ (string str, string indent = "")
{
	debug (Demangle)
		pragma (msg, indent ~ "demangleTemplateArguments (\"" ~ str ~ "\")");

	static if (str.length > 0 && str[0] == 'Z')
	{
		const Demangle[] demangles = [];
		const remaining = str[1..$];
	}
	else static if (str.length > 0 && str[0] == 'T')
	{
		alias demangleType_ !(str[1..$], indent ~ " ") type;
		alias demangleTemplateArguments_ !(type.remaining, indent) others;

		const Demangle[] demangles = Demangle (Demangle.ParameterType, [type.demangle]) ~ others.demangles;
		const remaining = others.remaining;
	}
	else static if (str.length > 0 && str[0] == 'V')
	{
		alias demangleType_ !(str[1..$], indent ~ " ") type;
		alias demangleValue_ !(type.remaining, indent ~ " ") value;
		alias demangleTemplateArguments_ !(value.remaining, indent) others;

		const Demangle[] demangles = Demangle (Demangle.ParameterValue, [type.demangle, value.demangle]) ~ others.demangles;
		const remaining = others.remaining;
	}
	else static if (str.length > 0 && str[0] == 'S')
	{
		alias demangleLName !(str[1..$], indent ~ " ") name;
		alias demangleQualifiedName_ !(name.name, indent ~ " ") qualified_name;
		alias demangleTemplateArguments_ !(name.remaining, indent) others; 
		
		const Demangle[] demangles = Demangle (Demangle.ParameterAlias, [qualified_name.demangle]) ~ others.demangles;
		const remaining = name.remaining;
	}
	else
	{
		const Demangle[] demangles = [];
		const remaining = "";
	}
}

/// Demangle the mangle of a value.

template demangleValue (string str, string indent = "")
{
	const demangleValue = demangleValue_ !(str, indent).demangle;
}

/// Worker template for demangleType.

private template demangleValue_ (string str, string indent = "")
{
	debug (Demangle)
		pragma (msg, indent ~ "demangleValue (\"" ~ str ~ "\")");

	static if (str.length > 0 && str[0] == 'n')
	{
		const demangle = Demangle (Demangle.ValueNull);
		const remaining = str[1..$];
	}
	else static if (str.length > 0 && isDecDigit (str[0]))
	{
		const long temp_number = decToInt (str);
		const remaining = consumeDecInt (str);
		const demangle = Demangle (Demangle.ValueNumber, [], temp_number);
	}
	else static if (str.length > 1 && str[0] == 'N' && isDecDigit (str[1]))
	{
		const long temp_number = decToInt (str[1..$]);
		const remaining = consumeDecInt (str[1..$]);
		const demangle = Demangle (Demangle.ValueNumber, [], -temp_number);
	}
	else static if (str.length > 0 && str[0] == 'a')
	{
		const long temp_number = decToInt (str[1..$], "");
		string temp_remaining = consumeDecInt (str[1..$], "");
		const demangle = Demangle (Demangle.ValueString, [], 0, hexToString8 (temp_remaining[1 .. 1 + temp_number * 2]));
		const remaining = temp_remaining[1+temp_number*2 .. $];
	}
	else static if (str.length > 0 && str[0] == 'w')
	{
		const long temp_number = decToInt (str[1..$], "");
		string temp_remaining = consumeDecInt (str[1..$], "");
		const demangle = Demangle (Demangle.ValueWString, [], 0, hexToString8 (temp_remaining[1 .. 1 + temp_number * 2]));
		const remaining = temp_remaining[1+temp_number*2 .. $];
	}
	else static if (str.length > 0 && str[0] == 'd')
	{
		const long temp_number = decToInt (str[1..$], "");
		string temp_remaining = consumeDecInt (str[1..$], "");
		const demangle = Demangle (Demangle.ValueDString, [], 0, hexToString8 (temp_remaining[1 .. 1 + temp_number * 2]));
		const remaining = temp_remaining[1+temp_number*2 .. $];
	}
	else static if (str.length > 0 && str[0] == 'e')
	{
		alias demangleHexFloat_ !(str[1..$], indent ~ " ") temp;

		const remaining = temp.remaining;
		const demangle = Demangle (Demangle.ValueFloat, [], 0, [], temp.value);
	}
	else static if (str.length > 0 && str[0] == 'c')
	{
		alias demangleHexFloat_ !(str[1..$], indent ~ " ") re;
		static assert (re.remaining[0] == 'c');
		alias demangleHexFloat_ !(re.remaining[1..$], indent ~ " ") im;
		
		const remaining = im.remaining;
		const demangle = Demangle (Demangle.ValueComplex, [], 0, [], re.value, im.value);
	}
	else
	{
		static assert (false, "Error parse value from \"" ~ str ~ "\"");
	}
}

/// Demangle the mangle of a hex float.

private template demangleHexFloat_ (string str, string indent = "")
{
	debug (Demangle)
		pragma (msg, indent ~ "demangleHexFloat (\"" ~ str ~ "\")");

	const real value = parseHexFloat (str);
	const remaining = consumeHexFloat (str);
}

/// Helper Method for parsing the string representation of hexadecimal floats.

package pure real parseHexFloat (string str)
{
	if (str[0] == 'N')
		return -parseHexFloat (str[1..$]);
	if (str.length > 2 && str[0..2] == "INF")
		return real.infinity;

	int i = void;
	// mantissa
	real result = 0.0;
	const real factor = 1.0 / 16.0;
	real multiplier = 1.0;
	for (i = 0; i < str.length && isHexDigit (str[i]); i++ )
	{
		result += hexDigitToInt (str[i]) * multiplier;
		multiplier *= factor;
	}
	// exponent
	if (i < str.length && str[i] == 'P')
	{
		byte change = 1;
		if (str[++i] == 'N')
		{
			change = -1;
			i++;
		}
		int index = void;
		long exponent = change * decToInt (str[i..$], "");
		while (exponent > 0)
		{
			result *= 2.0;
			exponent--;
		}
		while (exponent < 0)
		{
			result /= 2.0;
			exponent++;
		}
	}
	
	return result;
}

/// Helper method, returning the remaining string after parsing a hexadecimal float.

package pure string consumeHexFloat (string _str) {
	string str = _str;
	if (str.length  > 0 && str[0] == 'N')
		return consumeHexFloat (str[1..$]);
	if (str.length > 2 && str[0..3] == "INF")
		return str[2..$];
	while (str.length > 0 && str[0] != 'P')
		str = str[1..$];
	str = str[1..$];
	if (str.length > 0 && str[0] == 'N')
		str = str[1..$];
	while (str.length > 0 && isDecDigit (str[0]))
		str = str[1..$];
	return str;
}
