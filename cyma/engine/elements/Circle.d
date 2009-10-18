module cyma.engine.elements.Circle;

private {
	import cyma.engine.Element;
}

class Circle : Element {
	protected DrawableObject generateDrawable() {
		// TODO
		//debug(verbose) stdout("line!");
		DrawableObject drawable;
		drawable.type = DrawableObject.Types.Line;
		drawable.sizeInBytes = 2 * vec2.sizeof;
		return drawable;
	}

}
