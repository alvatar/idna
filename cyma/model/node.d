module cyma.model.node;

protected {
	import cyma.engine.element;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + A node of the model tree
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
struct Node{
	
	/++ Reference to the engine element +/
	Element element;
}
