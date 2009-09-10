
module idna.cyma.model.Substrate;

private {
	import idna.cyma.model.Node;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + A Substrate manages the set of nodes that belong to a layer, depending on
 + which type of data it is
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + This implements the foreach algorithm at the layer level
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
class Substrate {
	// A tree structure of nodes, for organizing groups
	// TODO
	Node[] nodesRoot;

	int opApply( int delegate (ref Node) dg ) {
		int result;
		foreach( node; nodesRoot ) {
			result = dg( node );
			if(result) break;
		}
		return result;
	}
}
