module simple;

import dconstructor.default_builder;
import dconstructor.build;
import dconstructor.property;
//import tango.core.Thread;
//import tango.io.Stdout;

interface IServer
{
	void Run ();
}

interface IConnection
{
	string ReadAll ();
}

class Connection : IConnection
{
	string ReadAll ()
	{
		return "Hello, world!";
	}
}

interface IListener
{
	IConnection Accept ();
}

class Listener : IListener
{
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
		while (true)
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
	mixin (Implements!(IServer));

	private IListener _listener;

	this (IListener listener)
	{
		_listener = listener;
	}

	import std.stdio;
	void Run ()
	{
		while (true)
		{
			writeln("SAVE ME");
		}
	}
}

void main ()
{
	builder ().bind!(IListener, Listener);
	auto server = builder ().get!(IServer);
	server.Run ();
}
