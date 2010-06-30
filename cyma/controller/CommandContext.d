/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Copyright (c) 2010 by Álvaro Castro-Castilla, All Rights Reserved.
 + Licensed under the MIT/X11 license, see LICENSE file for full description
 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/

module cyma.controller.CommandContext;

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Context of execution. Used for injecting arbitrary data needed
 + for execution
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
interface CommandContext {}

private {
	class StringCommandContext : CommandContext {
		public string arguments;
	}

	class ArgsCommandContext(T...) : CommandContext {
		public T arguments;
	}

	template DefineContext(T...) {
		static if( T.length == 1 && is(typeof(T[0] == string)) )
			alias StringCommandContext DefineContext;
		else
			alias ArgsCommandContext!(T) DefineContext;
	}
}

template MakeContext(T...) {
	DefineContext!(T) MakeContext(T t) {
		DefineContext!(T) context = new DefineContext!(T);
		context.tupleof = t;
		return context;
	}
}
