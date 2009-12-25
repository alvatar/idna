module test_impl;

private {
	import test_interface;

	import pattern.depinjection.default_builder;
	import pattern.depinjection.property;
}

class Connection : IConnection
{
	string ReadAll ()
	{
		return "Hello, world!";
	}
}

class Listener : IListener
{
	mixin (Implements!(IListener));
	
	IConnection Accept ()
	{
		return new Connection ();
	}
}

class Server : IServer
{
	mixin (Implements!(IServer));

	private IListener _listener;

	this (IListener listener)
	{
		_listener = listener;
	}

	import std.stdio;
	void Run ()
	{
		for( int i=0; i<100; i++)
		{
			//IConnection connection = _listener.Accept ();
			//Stdout.formatln ("new connection: {}", connection.ReadAll ());
			//Thread.sleep (1.0);
			writeln("KILL ME");
		}
	}
}

class ServerExtra : IServer
{
	//mixin (Implements!(IServer));

	private IListener _listener;

	this (IListener listener)
	{
		_listener = listener;
	}

	import std.stdio;
	void Run ()
	{
		for( int i=0; i<100; i++)
		{
			writeln("SAVE ME");
		}
	}
}


