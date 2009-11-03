module cyma.engine.Element;

protected {
	import cyma.view.DrawableProxy;
}

abstract class Element {
	protected size_t _id;
	public size_t id() {
		return _id;
	}
}

