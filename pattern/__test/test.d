module test;

import pattern.dconstructor.default_builder;
import pattern.dconstructor.build;
import pattern.dconstructor.property;

import test_interface;


void main ()
{
	//builder ().bind!(IListener, Listener);
	//auto server = builder ().get!(IServer);
	auto server = builder ().get!(IServer);
	server.Run ();
}

