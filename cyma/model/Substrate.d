/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Copyright (c) 2010 by Álvaro Castro-Castilla, All Rights Reserved.
 + Licensed under the MIT/X11 license, see LICENSE file for full description
 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/

module cyma.model.Substrate;

private {
	import cyma.model.Node;
	import cyma.model.NodeTree;
}


/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + A Substrate manages the set of nodes that belong to a layer, depending on
 + which type of data it is
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
class Substrate {

	private {
		/++ A structure of nodes, for organizing groups +/
		NodeTree _tree;
	}

	this() {
		_tree = new NodeTree;
	}

	/++
	 + Return the nodes structure of the model
	 +/
	NodeTree tree() {
		return _tree;
	}

	/++
	 + opApply
	 +/
	int opApply( int delegate (ref Node) dg ) {
		int result;
		foreach( ref node; tree ) {
			result = dg( node );
			if(result) break;
		}
		return result;
	}
}
