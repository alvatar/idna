module cyma.model.Model;

private {
	import std.random;
	import std.stdio;

	import cyma.model.Layer;
	import cyma.model.Node;
	import util.container.LinkedList;
	import util.container.Vector;
}

alias LinkedList!( Layer ) LayerStructure;
alias Vector!( Node* ) NodeVector;


/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + A Model owns all layers and all the data that defines the document. Should
 + also take care of the optimizations and offer the possibility of traversing
 + through the use of DrawableProxys
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
class Model {

	private {
		/++ A model is a set of layers that can be rearranged +/
		LayerStructure _layers;

		/++ Vector with references to new elements of the model (Deltas) +/
		NodeVector _newNodes;

		/++ Vector with references to modified elements of the model (Deltas) +/
		NodeVector _modifiedNodes;

		/++ Vector with references to elements to be deleted from the model
			(Deltas) +/
		NodeVector _removedNodes;

		/++ Flag: clear deltas in its right moment +/
		bool _clearDeltas;

		/++ Flag: were its contents updated? +/
		uint _updates = 0;

		/++ An instance of the id generator per model +/
		IdGenerator _idGenerator;
	}

	private {
		this() {
			++_updates;
			_layers = new LayerStructure;
			_layers.add(new Layer);
			_idGenerator = new IdGenerator;
			debug(verbose) writeln( "Layer created" );
		}
	}

	/++
	 + Static function to create a Model
	 +/
	static Model create() {
		return new Model;
	}

	/++
	 + Returns the number of updates that have been done to the model
	 +/
	uint updates() {
		return _updates;
	}

	/++
	 + Tells the model that its Layer Structure has been updated
	 +/
	uint updated() {
		return ++_updates;
	}

	IdType nextId() {
		return _idGenerator.getNextId();
	}

	/++
	 + Types of changes from previous model states' elements
	 +/
	enum Access {
		All
		, New
		, Modified
		, Removed
	}

	/++
	 + Informs the model of the new model added to the tree
	 +/
	void addDelta(Access type)( Node* node ) {
		static if( type == Access.New ) {
			_newNodes.add(node);
		} else static if( type == Access.Modified ) {
			_modifiedNodes.add(node);
		} else static if( type == Access.Removed ) {
			_removedNodes.add(node);
		}
	}

	/++
	 + Clear all delta elements references
	 +/
	void scheduleToClearDeltas() {
		_updates = 0;
		_clearDeltas = true;
	}

	/++
	 + Flatten the model: makes all the necessary adjustments to allow the
	 + model to be used by the Driver and cleans all left by the visualization
	 + step by the Drawer
	 +/
	void flatten() {
		_newNodes.clear();
		_modifiedNodes.clear();
		_removedNodes.clear();
	}

	/++
	 + Get a random layer
	 +/
	Layer randomLayer() {
		debug if(_layers.isEmpty) throw new Exception( "No layers in the model"
				, __FILE__, __LINE__ );
		auto rnd = Random(unpredictableSeed);
		return _layers.get( uniform(0, _layers.size, rnd) );
	}

	/++
	 + opApply
	 +/
	int opApply( int delegate (ref Node) dg ) {
		int result;
		auto layersIt = _layers.iterator;
		foreach( ref layer; layersIt ) {
			foreach( ref substrate; layer ) {
				foreach( ref node; substrate ) {
					result = dg( node );
						if(result) break;
				}
			}
		}
		return result;
	}
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + This class encapsulates access to elements in the nodes iterated over a
 + model
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
private class ModelElements {

	Model model;

	int opApply( int delegate (ref Element) dg ) {
		int result;
		foreach( node; model ) {
			result = dg( node.element );
			if(result) break;
		}
		return result;
	}
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + This class encapsulates access to elements that have been created, modified
 + or removed
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
private class ModelElementDeltas(string filter) {

	Model model;

	int opApply( int delegate (ref Element) dg ) {
		int result;
		foreach( node; __traits(getMember, this.model, filter) ) {
			result = dg( (*node).element );
			if(result) break;
		}
		return result;
	}
}

/++
 + Helper functions to get parts from a model
 +/
T getParts(T)( Model model ) {
	T result = new T;
	result.model = model;
	return result;
}

template elements(Model.Access type) {
	static if( type == Model.Access.All ) {
		alias getParts!( ModelElements ) elements;
	} else static if( type == Model.Access.New ) {
		alias getParts!( ModelElementDeltas!("_newNodes") ) elements;
	} else static if( type == Model.Access.Modified ) {
		alias getParts!( ModelElementDeltas!("_modifiedNodes") ) elements;
	} else static if( type == Model.Access.Removed ) {
		alias getParts!( ModelElementDeltas!("_removedNodes") ) elements;
	}
}

