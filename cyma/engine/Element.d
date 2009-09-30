module idna.cyma.engine.Element;

private {
	import idna.tools.Compat;
}

public import idna.cyma.view.DrawableObject;

interface Element {
    protected DrawableObject generateDrawable();
}

DrawableObject drawable( Element element ) {
	//debug(verbose) stdout("drawable!");
	return element.generateDrawable;
}

