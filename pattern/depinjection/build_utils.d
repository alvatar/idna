module pattern.depinjection.build_utils;

private {
	import std.traits;

	import meta.numeric;
}

string get_deps(T) () {
	static if (is (typeof(new T) == T)) {
		return `return new T();`;
	} else {
		// TODO: d2 renamed this to __ctor
		return `return new T(` ~ get_deps_impl!(T, 0, "__ctor") () ~ `);`;
	}
}

string get_post_deps(T) () {
	return `obj.inject(` ~ get_deps_impl!(T, 0, "inject") ~ `);`;
}

string get_deps_impl(T, int i, string method) () {
	mixin ("alias T." ~ method ~ " inject_method;");
	static if( i < ParameterTypeTuple!(inject_method).length ) {
		string ret = `parent.get!(ParameterTypeTuple!(T.` ~ method ~ `)[` ~ (ctToString(i)) ~ `])`;
		static if (i < ParameterTypeTuple!(inject_method).length - 1)
			ret ~= `,`;
		return ret ~ get_deps_impl!(T, i + 1, method) ();
	} else {
		return ``;
	}
}
