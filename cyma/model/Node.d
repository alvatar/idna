module idna.cyma.model.Node;

private {
	import tango.util.container.LinkedList;
}

package import idna.cyma.engine.Element;

class Node {

	this( Element ielement, bool iisLeaf ) {
		element = ielement;
		isLeaf = iisLeaf;
	}

	/++ Nodes contain nodes creating a tree +/
	alias LinkedList!(typeof(this)) ChildrenNodes;
	private ChildrenNodes _children;

	/++ A flag to know if this is a leaf node +/
	bool isLeaf;

	/++ The engine element in the node +/
	Element element;
}
