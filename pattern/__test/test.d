module test;

import pattern.depinjection.default_builder;
import pattern.depinjection.property;

import test_interface;
import test_impl;


void main ()
{
	builder ().bind!(IListener, Listener);
	//auto server = builder ().get!(IServer);
	auto server = builder ().get!(IServer);
	server.Run ();
}

