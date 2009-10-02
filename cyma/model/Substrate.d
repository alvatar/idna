
module idna.cyma.model.Substrate;

private {
	import idna.tools.Compat;
	import idna.cyma.model.Node;
	import idna.cyma.model.Node;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + A Substrate manages the set of nodes that belong to a layer, depending on
 + which type of data it is
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
class Substrate {

	/++ A tree structure of nodes, for organizing groups +/
	// TODO
	Node[] nodesRoot;

	/++
	 + Add new node to the nodes tree of the substrate
	 +/
	void addNode( Element element ) {
		nodesRoot ~= new Node( element );
	}

	int opApply( int delegate (ref Node) dg ) {
		int result;
		foreach( node; nodesRoot ) {
			result = dg( node );
			if(result) break;
		}
		return result;
	}
}
