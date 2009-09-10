module idna.cyma.model.Node;

private {
	import tango.util.container.LinkedList;

	import idna.cyma.view.DrawableObject;
}

class Node {
	/++ Nodes contain nodes creating a tree +/
	alias LinkedList!(typeof(this)) ChildrenNodes;
	private ChildrenNodes children;

	/++ A flag to know if this is a leaf node +/
	bool isLeaf;

	/++ The renderable graphic data +/
	DrawableObject drawable;
}

