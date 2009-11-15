module cyma.engine.element;

protected {
	import cyma.engine.idgenerator;
	import cyma.view.drawableproxy;
}

abstract class Element {
	protected IdType _id;
	public IdType id() {
		return _id;
	}
}

