module cyma.model.layer;

private {
	import std.stdio;

	import cyma.model.rastersubstrate;
	import cyma.model.staticvectorsubstrate;
	import cyma.model.dynamicvectorsubstrate;
	import cyma.model.node;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + A layer is a container of the three substrates where nodes are placed
 + depending on the type of representation (raster, static vectors, dynamic
 + vectors).
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
class Layer {

	this() {
		substrates[0] = new RasterSubstrate;
		rasterSubstrate = cast(RasterSubstrate)substrates[0];
		substrates[1] = new StaticVectorSubstrate;
		staticVectorSubstrate = cast(StaticVectorSubstrate)substrates[1];
		substrates[2] = new DynamicVectorSubstrate;
		dynamicVectorSubstrate = cast(DynamicVectorSubstrate)substrates[2];
		debug(verbose) writeln( "Substrates created" );
	}

	public {
		/++ Link to the layers of the model +/
		RasterSubstrate rasterSubstrate;
		StaticVectorSubstrate staticVectorSubstrate;
		DynamicVectorSubstrate dynamicVectorSubstrate;
	}

	private {
		Substrate[3] substrates;
	}

	/++
	 + opApply
	 +/
	int opApply( int delegate (ref Substrate) dg ) {
		int result;
		for( int i = 0; i < substrates.length; i++ ) {
			result = dg( substrates[i] );
			if(result) break;
		}
		return result;
	}
}
