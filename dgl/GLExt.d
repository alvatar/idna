module dgl.GLExt;

private {
	import dgl.Common;
}

public {
	version( D_Version2 ) {
	} else {
		import tango.core.Traits : ParameterTupleOf;
	}
}


bool function(GL)[] __extSupportCheckingFuncs;
const char[] extNotEnabledError = "Extension was not enabled prior to using it!";
