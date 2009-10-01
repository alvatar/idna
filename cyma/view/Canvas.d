module idna.cyma.view.Canvas;

private {
	import idna.tools.Compat;
	import idna.cyma.view.DrawableObject;
	import idna.cyma.view.ICanvas;
	import idna.cyma.view.IDrawActor;
}

abstract class Canvas : ICanvas {

	/++ A link with a DrawActor that gives the Canvas all info needed +/
	protected IDrawActor drawActor;

	/++ Update the link with a DrawActor +/
	void linkWithDrawActor( IDrawActor idrawActor ) {
		drawActor = idrawActor;
	}
}
