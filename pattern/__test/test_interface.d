module test_interface;

interface IServer
{
	void Run ();
}

interface IConnection
{
	string ReadAll ();
}

interface IListener
{
	IConnection Accept ();
}

