module idna.cyma.model.Node;

private {
	import tango.util.container.LinkedList;
}

protected {
	import idna.cyma.engine.Element;
}

/++ Type for building the scene graph +/
alias LinkedList!(Node) ChildrenNodes;

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + A node of the model tree
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
class Node {

	private {
		/++ The engine element in the node +/
		Element _element;

		/++ A flag to know if this is a leaf node +/
		bool _isLeaf;

		/++ Nodes contain nodes creating a tree +/
		private ChildrenNodes _children;
	}

	this( Element element ) {
		_element = element;
		_isLeaf = true;
		_children = null;
	}

	this( Element element, ChildrenNodes children ) {
		_element = element;
		_isLeaf = false;
		_children = children;
	}

	Element element() {
		return _element;
	}

	bool isLeaf() {
		return _isLeaf;
	}

	ChildrenNodes children() {
		return _children;
	}
}
