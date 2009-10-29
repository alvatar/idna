module cyma.engine.Element;

protected {
	import cyma.view.DrawableObject;
}

interface Element {
    protected DrawableObject generateDrawable();
}

DrawableObject drawable( Element element ) {
	return element.generateDrawable;
}

