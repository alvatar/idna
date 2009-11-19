module cyma.engine.Element;

protected {
	import cyma.engine.IdGenerator;
	import cyma.view.DrawableProxy;
}

abstract class Element {
	protected IdType _id;
	public IdType id() {
		return _id;
	}
}

