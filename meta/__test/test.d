module test;

import std.stdio;
import std.demangle;

import meta.char_funcs;
import meta.demangle;
import meta.identifier;
import meta.mixin_funcs;
import meta.numeric;
import meta.string_funcs;
import meta.typecons;


unittest {
}

void main() {
	
	void function() func;
	char[void function(char*,void[])] pene;

	//meta.identifier.isFunction !(func);
	writeln(demangle(func.mangleof));
	writefln("\n   ---   ALL TESTS PASSED   ---   \n");
}
