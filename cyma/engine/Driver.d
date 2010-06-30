/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Copyright (c) 2010 by Álvaro Castro-Castilla, All Rights Reserved.
 + Licensed under the MIT/X11 license, see LICENSE file for full description
 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/

module cyma.engine.Driver;

private{
	import std.stdio;
	import std.variant;

	import core.MessageHub;
	import math.Vector;

	import cyma.application.messages;
	import cyma.controller.Command;
	import cyma.model.Model;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Drive commands: interpret issued commands and code, execute them, revert
 + them
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
class Driver {

	private {
		alias Command delegate() CommandCreator;

		/++ Queue of commands to be executed +/
		Command[] _commandQueue;

		/++ Stack of executed commands, for undo +/
		Command[] _stackedCommands;

		/++ Commands associated to codes +/
		CommandCreator[string] _codeMap;

		/++ The model that is going to be processed +/
		Model _model;
	}

	/++ Provide a link with a model to work with +/
	void plug( Model model ) {
		if(model)
			_model = model;
		else
			throw new Exception(typeof(this).stringof ~ " : Plugged model is null");
	}

	/++ Register commands with an associated code +/
	void registerCommand( string code, CommandCreator func ) {
		_codeMap[code] = func;
	}

	/++ Unregister commands +/
	void unregisterCommand( string code ) {
		_codeMap.remove( code );
	}

	/++ Execute all queued commands +/
	void process() {
		foreach( com; _commandQueue ) {
			bool finished = false;
			try {
				finished = com.execute( _model );
				scope(failure) finished = false;
			} catch(Exception e) {
				writeln(
					typeof(this).stringof
					~ "Exception when executing command: "
					~ e.toString
					);
			}
			if( !finished ) {
				messageHub.sendMessage(new CommandStartedMessage);
				break;
			} else {
				messageHub.sendMessage(new CommandFinishedMessage);
				_stackedCommands ~= com;
				_commandQueue = _commandQueue[1..$];
			}
		}
	}

	/++ Undo previously executed commands reverting their actions with
	 + the implemented "revert" methods +/
	void rollback( uint times ) {
		for( uint i = 0; i<times && i<_commandQueue.length; ++i ) {
			_stackedCommands[$-1-i].revert( _model );
			_stackedCommands = _stackedCommands[0..$-1];
		}
	}

	/++ Evaluate the given string as immediate commands +/
	void evaluateNow( string code ) {
		if( code in _codeMap )
			_commandQueue ~= _codeMap[code]();
	}

	/++ Pipe given strings to the command for its evaluation within the code +/
	void pipeToCurrentCommand( Variant data ) {
		debug if( !_commandQueue.length )
			throw new Exception(
				"pipeToCommand: You are piping code to commands and there aren't any"
				);
		// Feed the first of the commands
		_commandQueue[0].pipe( data );
	}

	/++ Push code for the language interpreter +/
	void pushCode( string code ) {
		assert( false, " ACCUMULATE CODE: TODO" );
	}

	/++ Run the interpreter and evaluate the code listing +/
	void evaluateCode() {
		assert( false, "EVALUATE CODE: TODO" );
	}

	void abortCurrent() {
		messageHub.sendMessage(new CommandFinishedMessage);
		_commandQueue = _commandQueue[1..$];
	}

	/++ Debug utility to directly inject a command in the queue +/
	debug void injectCommands( Command[] commands ) {
		_commandQueue ~= commands;
	}
}
