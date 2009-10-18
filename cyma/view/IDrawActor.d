module cyma.view.IDrawActor;

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Define the interface of a DrawActor, allowing to move draw environments
 + around avoiding cyclic dependencies
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
interface IDrawActor {
	void[] environment();
	void[] environment( void[] );
}
