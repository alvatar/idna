module cyma.engine.elements.Circle;

private {
	import cyma.engine.Element;
}

class Circle : Element {
	protected DrawableProxy generateDrawable() {
		// TODO
		//debug(verbose) stdout("line!");
		DrawableProxy drawable;
		drawable.type = DrawableProxy.Types.Line;
		drawable.sizeInBytes = 2 * vec2.sizeof;
		return drawable;
	}

}
