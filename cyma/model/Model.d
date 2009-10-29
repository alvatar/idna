module cyma.model.Model;

private {
	import std.random;
	import std.stdio;

	import util.container.LinkedList;
	import cyma.model.Layer;
	import cyma.model.Node;
	import cyma.view.DrawableObject;
}

/++ Alias for the type of the layers structure +/
alias LinkedList!(Layer) LayerStructure;


/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + A Model owns all layers and all the data that defines the document. Should
 + also take care of the optimizations and offer the possibility of traversing
 + through the use of DrawableObjects
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
class Model {

	private {
		this() {
			layers = new LayerStructure;
			layers.add(new Layer);
			debug(verbose) writeln( "Layer created" );
		}
	}

	/++
	 + Static function to create a Model
	 +/
	static Model create() {
		return new typeof(this);
	}

	/++
	 + Get a random layer
	 +/
	 Layer randomLayer() {
		debug if(layers.isEmpty) throw new Exception( "No layers in the model"
				, __FILE__, __LINE__ );
		auto rnd = Random(unpredictableSeed);
		return layers.get( uniform(0, layers.size, rnd) );
	 }

	private {
		/++ A model is a set of layers that can be rearranged +/
		LayerStructure layers;
	}

	/++
	 + opApply
	 +/
	int opApply( int delegate (ref Node) dg ) {
		int result;
		auto layersIt = layers.iterator;
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
			auto element = node.element;
			result = dg( element );
			if(result) break;
		}
		return result;
	}
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + This class encapsulates access to drawable objects in the nodes iterated
 + over a model
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
private class ModelDrawables {

	Model model;

	int opApply( int delegate (ref DrawableObject) dg ) {
		int result;
		foreach( node; model ) {
			auto drawable = drawable(node.element);
			result = dg( drawable );
			if(result) break;
		}
		return result;
	}
}

/++
 + Helper functions to get parts from a model
 +/
T parts(T)( Model model ) {
	T result = new T;
	result.model = model;
	return result;
}
alias parts!(ModelElements) elements;
alias parts!(ModelDrawables) drawables;
