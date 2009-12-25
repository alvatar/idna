module cyma.engine.Driver;

private{
	import std.stdio;

	import cyma.engine.Command;
	import cyma.model.Model;
	import math.Vector;
	import pattern.creation;
}

alias Command delegate() CommandCreator;

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Drive commands: interpret issued commands and code, execute them, revert
 + them
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
class Driver {

	private {
		/++ Queue of commands to be executed +/
		Command[] _commandQueue;

		/++ Stack of executed commands, for undo +/
		Command[] _stackedCommands;

		/++ Commands associated to codes +/
		CommandCreator[string] _codeMap;

		/++ The model that is going to be processed +/
		Model _model;
	}

	void init( Model model ) {
		_model = model;
	}

	/++
	 + Register commands with an associated code
	 +/
	void registerCommand( string code, CommandCreator func ) {
		_codeMap[code] = func;
	}

	/++
	 + Unregister commands
	 +/
	void unregisterCommand( string code ) {
		// TODO
	}

	/++
	 + Execute all queued commands
	 +/
	void process() {
		foreach( com; _commandQueue ) {
			com.execute( _model );
			_stackedCommands ~= com;
			_commandQueue = _commandQueue[1..$];
		}
	}

	/++
	 + Undo previously executed commands reverting their actions with
	 + the implemented "revert" methods
	 +/
	void rollback( uint times ) {
		for( uint i = 0; i<times && i<_commandQueue.length; ++i ) {
			_stackedCommands[$-1-i].revert( _model );
			_stackedCommands = _stackedCommands[0..$-1];
		}
	}

	/++
	 + Evaluate the given string as immediate commands
	 +/
	void evaluateNow( string code ) {
		if( code in _codeMap ) {
			_commandQueue ~= _codeMap[code]();
		}
	}

	/++
	 + Push code for the language interpreter
	 +/
	void pushCode( string code ) {
		assert( false, " ACCUMULATE CODE: TODO" );
	}

	/++
	 + Run the interpreter and evaluate the code listing
	 +/
	void evaluateCode() {
		assert( false, "EVALUATE CODE: TODO" );
	}

	/++
	 + Debug utility to directly inject a command in the queue
	 +/
	debug void injectCommands( Command[] commands ) {
		_commandQueue ~= commands;
	}
}
