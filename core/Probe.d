/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Copyright (c) 2010 by Álvaro Castro-Castilla, All Rights Reserved.
 + Licensed under the MIT/X11 license, see LICENSE file for full description
 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/

module core.Probe;

private {
	import std.variant;
	
	import util.container.HashMap;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + General class for registering members from another class and accessing the
 + updated values from any place pulling the probe instance in.
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
class Probe {

	private {
		alias Variant delegate() UpdaterType;
		alias HashMap!(string,UpdaterType) UpdatersMap;
		UpdatersMap _registered;
	}

	this() {
		_registered = new UpdatersMap;
	}

	/++ Registering a member from within another class will create an accessor
	 + function that takes care of passing the updated member every time is
	 + requested from outside +/
	void register(T)(lazy T t, string mname) {
		Variant updater() {
			return Variant(t);
		}
		_registered[mname] = &updater;
	}

	/++ Access the registered members +/
	debug private import std.stdio;
	Variant opIndex(string mname) {
		debug {
			try {
				return _registered[mname]();
			} catch {
				writeln( __FILE__
					~ ": You are requesting an environment flag that doesn't exist"
					);
				return Variant(0);
			}
		} else return _registered[mname]();
	}

	/++ Disallow any assignment from outside +/
	void opIndexAssign(T)(T t, string mname) {
		static assert( false,
			"Funny you are trying to assign a variable when this is called PROBE"
			);
	}

	@property
	Variant opDispatch(string mname)() {
		return this[mname];
	}
}

/++ Utility template to register a member with the same name it's given in its
 + own scope
 + 
 + Example:
 + with( util.Probe ) {
 +     mixin (Register!(environment_variable,member_variable));
 + }
 +/
public template Register( alias Probe, alias Member ) {
	const Register = RegisterImpl( Probe.stringof, Member.stringof );
}
private string RegisterImpl( string probename, string membername ) {
	return probename ~ `.register(` ~ membername ~ `,"` ~ membername ~ `");`;
}
