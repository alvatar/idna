module idna.cyma.view.Canvas;

private {
	import idna.tools.Compat;
	import idna.cyma.view.DrawableObject;
	import idna.cyma.view.DrawActor;
}

interface ICanvas {

	void init();
	void draw( DrawableObject );
}

abstract class Canvas : ICanvas {

	/++ A link with a DrawActor that gives the Canvas all info needed +/
	protected DrawActor* drawActor;

	/++ Update the link with a DrawActor +/
	void linkWithDrawActor( DrawActor* idrawActor ) {
		drawActor = idrawActor;
	}
}
