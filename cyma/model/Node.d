module idna.cyma.model.Node;

protected {
	import idna.cyma.engine.Element;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + A node of the model tree
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
struct Node{
	
	/++ Reference to the engine element +/
	Element element;
}
