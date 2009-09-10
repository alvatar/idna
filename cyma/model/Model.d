module idna.cyma.model.Model;

private {
	import tango.io.Stdout;
	import tango.util.container.LinkedList;
	import tango.util.container.more.Heap;

	import idna.cyma.view.DrawableObject;

	import idna.cyma.model.Layer;
	import idna.cyma.model.Node;
}

/++ Alias for the type of the layers structure +/
alias LinkedList!(Layer) LayerStructure;

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Interface for Models. Models should be only accessed from this interface
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
interface IModel {
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + A Model owns all layers and all the data that defines the document. Should
 + also take care of the optimizations and offer the possibility of traversing
 + through the use of DrawableObjects
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
class Model : IModel {
	// A model is a set of layers that can be rearranged
	LayerStructure layers;

	int opApply( int delegate (ref Node) dg ) {
		int result;
		layers.Iterator layersIt;
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
 + This class encapsulates access to drawable objects in the nodes iterated
 + over a model
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
private class ModelDrawables {
	Model model;

	int opApply( int delegate (ref DrawableObject) dg ) {
		int result;
		foreach( node; model ) {
			result = dg( node.drawable );
			if(result) break;
		}
		return result;
	}
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Helper function to get drawables from a model
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
ModelDrawables drawables (IModel model) {
	ModelDrawables modelDrawables;
	// Here is where the downcast is made to the right type (not implemented)
	modelDrawables.model = cast(Model)model;
	return modelDrawables;
}
