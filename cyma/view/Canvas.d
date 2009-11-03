module cyma.view.Canvas;

private {
	import io.Stdout;
	import cyma.view.ICanvas;
	import cyma.view.IDrawActor;
}

protected {
	import cyma.engine.Element;
	import cyma.view.DrawableProxy;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + This abstract class takes care of linking Canvases with the DrawActor they
 + belong to
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
abstract class Canvas : ICanvas {

	/++ A link with a DrawActor that gives the Canvas all info needed +/
	protected IDrawActor drawActor;

	/++ Update the link with a DrawActor +/
	void setParendDrawActor( IDrawActor drawActor ) {
		this.drawActor = drawActor;
	}

	/++
	 + Structure for proxy drawable object. It needs to be ordered (for correct
	 + z-depths) and indexable (to allow access knowing an element's id).
	 +/
	DrawableProxy[] proxies;
}
