module idna.cyma.model.Layer;

private {
	import idna.cyma.model.Substrate;
	import idna.cyma.model.Node;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + A layer is a container of the three substrates where nodes are placed
 + depending on the type of representation (raster, static vectors, dynamic
 + vectors).
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + This implements the foreach algorithm at the layer level
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
class Layer
{
	// Link to the layers of the model
	Substrate[] substrates;

	int opApply( int delegate (ref Substrate) dg )
	{
		int result;
		for( int i = 0; i < substrates.length; i++ ) {
			result = dg( substrates[i] );
			if(result) break;
		}
		return result;
	}
}
