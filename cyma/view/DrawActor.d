module idna.cyma.view.DrawActor;

private {
	import idna.tools.Compat;
	import idna.cyma.view.DrawContext;
}

class DrawActor {

	string name;

	DrawContext context;

	void delegate() func;

	bool active;

	bool updated;
}
