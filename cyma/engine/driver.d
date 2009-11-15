module cyma.engine.driver;

private{
	import std.stdio;

	import cyma.engine.commands.all;
	import cyma.engine.command;
	import cyma.model.model;
	import math.vector;
	import util.singleton;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Drive commands: interpret issued commands and code, execute them, revert
 + them
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
class Driver {

	private {
		/++ Queue of commands to be executed +/
		ICommand[] _commandQueue;

		/++ Stack of executed commands, for undo +/
		ICommand[] _stackedCommands;

		/++ Commands associated to codes +/
		alias ICommand delegate() CommandCreator;
		CommandCreator[string] _codeMap;
	}

	this() {
		_codeMap["a"] = { return cast(ICommand)(new CreateLine); };
	}

	void init() {
	}

	void process( Model model ) {
		model.flatten;
		foreach( com; _commandQueue ) {
			com.execute( model );
			_stackedCommands ~= com;
			_commandQueue = _commandQueue[1..$];
		}
	}

	void rollback( Model model, uint times ) {
		model.flatten;
		for( uint i = 0; i<times && i<_commandQueue.length; ++i ) {
			_stackedCommands[$-1-i].revert( model );
			_stackedCommands = _stackedCommands[0..$-1];
		}
	}

	void evaluateNow( string code ) {
		if( code in _codeMap ) {
			_commandQueue ~= _codeMap[code]();
		}
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
