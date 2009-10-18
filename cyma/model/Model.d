module cyma.model.Model;

private {
	import std.random;

	import util.container.LinkedList;
	import io.Stdout;
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
			debug(verbose) stdout( "Layer created" );
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
		version( D_Version2 ) {
			auto rnd = Random(unpredictableSeed);
			return layers.get( uniform(0, layers.size, rnd) );
		} else {
			auto r = new Random;
			return layers.get( r.uniformR(layers.size) );
		}
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
			Element element = node.element;
			result = dg( element );
			if(result) break;
		}
		return result;
	}
}

/++
 + Helper function to get drawables from a model
 +/
ModelElements elements (Model model) {
	ModelElements modelElem = new ModelElements;
	modelElem.model = model;
	return modelElem;
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
			DrawableObject drawable = drawable( node.element );
			result = dg( drawable );
			if(result) break;
		}
		return result;
	}
}

/++
 + Helper function to get drawables from a model
 +/
ModelDrawables drawables(Model model) {
	ModelDrawables modelDrawables = new ModelDrawables;
	modelDrawables.model = model;
	return modelDrawables;
}
