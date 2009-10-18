module cyma.engine.Element;

private {
	import io.Stdout;
}

protected {
	import cyma.view.DrawableObject;
}

interface Element {
    protected DrawableObject generateDrawable();
}

DrawableObject drawable( Element element ) {
	//debug(verbose) stdout("drawable!");
	return element.generateDrawable;
}

