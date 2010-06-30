/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Copyright (c) 2010 by Álvaro Castro-Castilla, All Rights Reserved.
 + Licensed under the MIT/X11 license, see LICENSE file for full description
 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/

module cyma.controller.Command;

protected {
	import std.variant;

	import cyma.application.EnvironmentProbe;
	import cyma.controller.OutputActor;
	import cyma.controller.CommandContext;
	import cyma.model.Model;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Interface for executable commands
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
abstract class Command {

	enum State {
		Created,
		Pending,
		Initialized,
		Executing,
		OnHold,
		Executed,
		Cancelled
	}

	protected {
		State _currentState;
		State _previousState;
		EnvironmentProbe _environment;
		OutputActor _output;
	}

	/++ Execution entry point, returns true if finished +/
	bool execute( ref Model );

	/++ Revert (undo) the command +/
	void revert( ref Model );

	/++ Pipe code as string inside this command +/
	void pipe( Variant input ) {}

	/++ A function to retrieve name must be implemented +/
	string name() {
		return typeof(this).toString;
	}

	/++ A) Messages (used in classes inheriting from Command, are intended for
	 + the following things:
	 +    1. Isolated actions over all the objects from a class
	 +    2. Actions over the user interface (Asynchronous messages) +/

	/++ B) Environment is intended for the following things:
	 +    1. Access program configuration and options
	 +    2. Access far and lightweight data for special cases +/
	@property
	EnvironmentProbe environment() {
		return _environment;
	}

	/++ C) Output is intended for the following things:
	 +    1. High-level drawing, to any canvas
	 +    2. Standard output of errors
	 +    3. Real-time information about the command +/
	@property
	OutputActor output() {
		return _output;
	}
}

abstract class ContextualizedCommand(T...) : Command {

	alias DefineContext!T ContextType;

	protected ContextType _context;

	/++ D) Context is inteded for the following things:
	 +    1. Store data necessary for execution of the Command
	 +    2. Pass arguments to the Command +/
	@property
	typeof(this) context( CommandContext context ) {
		debug if( (_context = cast(DefineContext!T)context) is null )
			throw new Exception("Incorrect context supplied to Command");
		return this;
	}

	@property
	ContextType context() {
		return _context;
	}

	typeof(this) makeContext(T...)(T args) {
		debug if( (_context = cast(DefineContext!T)MakeContext(args)) is null )
			throw new Exception("Incorrect context supplied to Command");
		return this;
	}
}

template MakeCommandConstructor() {
	this( EnvironmentProbe environment, OutputActor output ) {
		_environment = environment;
		_output = output;
	}
}
