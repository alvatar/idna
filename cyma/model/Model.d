module idna.cyma.model.Model;

private {
	import tango.util.container.LinkedList;
	import idna.tools.Compat;

	import idna.cyma.view.DrawableObject;

	import idna.cyma.model.Layer;
	import idna.cyma.model.Node;
}

/++ Alias for the type of the layers structure +/
alias LinkedList!(Layer) LayerStructure;


/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + A Model owns all layers and all the data that defines the document. Should
 + also take care of the optimizations and offer the possibility of traversing
 + through the use of DrawableObjects
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
class Model
{
	private{
		this() {}
	}

	static Model create()
	{
		return new typeof(this);
	}

	private {
		// A model is a set of layers that can be rearranged
		LayerStructure layers;
	}

	int opApply( int delegate (ref Node) dg )
	{
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
private class ModelDrawables
{
	Model model;

	int opApply( int delegate (ref DrawableObject) dg )
	{
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
ModelDrawables drawables (Model model)
{
	ModelDrawables modelDrawables = new ModelDrawables;
	modelDrawables.model = model;
	return modelDrawables;
}
