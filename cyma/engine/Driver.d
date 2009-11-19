module cyma.engine.Driver;

private{
	import std.stdio;

	import cyma.application.EnvironmentProbe;
	import cyma.engine.commands.All;
	import cyma.engine.Command;
	import cyma.model.Model;
	import math.Vector;
	import util.Singleton;
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

		/++ Environment probe, if null the commands cannot extract environment
			data, thus being non-interactive +/
		EnvironmentProbe _probe;
	}

	this() {
		_codeMap["a"] = { return cast(ICommand)(new CreateLine); };
	}

	void init() {
	}

	void makeInteractive( EnvironmentProbe probe ) {
		_probe = probe;
	}

	void process( Model model ) {
		foreach( com; _commandQueue ) {
			com.execute( model );
			_stackedCommands ~= com;
			_commandQueue = _commandQueue[1..$];
		}
	}

	void rollback( Model model, uint times ) {
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
		assert( false, " ACCUMULATE CODE: TODO" );
	}

	void evaluateCode() {
		assert( false, "EVALUATE CODE: TODO" );
	}

	debug void injectCommands( ICommand[] commands ) {
		_commandQueue ~= commands;
	}
}

alias Singleton!(Driver) driver;
