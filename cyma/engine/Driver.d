module cyma.engine.Driver;

private{
	import std.stdio;

	import cyma.engine.commands.All;
	import cyma.engine.Command;
	import cyma.model.Model;
	import math.Vector;
	import util.Singleton;
}

class Driver {

	private {
		/++ Queue of commands to be executed +/
		ICommand[] _commandQueue;

		/++ Commands associated to codes +/
		ICommand[string] _commandCodeMap;
	}

	this() { // TODO
		_commandCodeMap["a"] = new AddLine;
		/*
		_commandCodeMap["a"] = new AddLine(
					MakeContext( 
						vec2r( uniform(0,1.0,rnd), uniform(0,1.0,rnd) )
						, vec2r( uniform(0,1.0,rnd),uniform(0,1.0,rnd) )
						)
				);
				*/
		/*
		_commandCodeMap["a"].context( MakeContext( 
				vec2r( uniform(0,1.0,rnd), uniform(0,1.0,rnd) )
				, vec2r( uniform(0,1.0,rnd),uniform(0,1.0,rnd) )
			) );
			*/
	}

	void init() {
	}

	void process( Model model ) {
		model.flatten;
		foreach_reverse( com; _commandQueue ) {
			com.execute( model );
			_commandQueue = _commandQueue[0..$-1];
		}
	}

	void evaluateNow( string code ) {
		if( code in _commandCodeMap ) _commandQueue ~= _commandCodeMap[code];
	}

	void pushCode( string code ) {
		writeln( code, " ACCUMULATE CODE: TODO" );
	}

	void evaluateCode() {
		writeln( "EVALUATE CODE: TODO" );
	}

	debug void injectCommands( ICommand[] commands ) {
		_commandQueue ~= commands;
	}
}

alias Singleton!(Driver) driver;

