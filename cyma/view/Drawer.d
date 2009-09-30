module idna.cyma.view.Drawer;

private {
	import xf.utils.Singleton;

	import idna.tools.Compat;
	import idna.tools.Curry;
	import idna.cyma.model.Model;
	import idna.cyma.view.GLCanvas;
}

class DrawFunctionInfo {

	this( string iname
		, void delegate() ifunc ) {
		name = iname;
		func = ifunc;
	}

	void delegate() func;
	string name;
}

class Drawer {

	/++
	 + Structure holding information about registered Canvas
	 +/
	struct CanvasInfo {
		bool initialized;
		bool active;
		ICanvas canvasInstance;
	}

	/++ AA for registered canvas information +/
	CanvasInfo[string] canvasMap;

	/++
	 + Iterate over each active and uninitalized canvas
	 +/
	 void init() {
		 drawer.registerCanvas( new GLCanvas, "GlCanvas" );

		 foreach( canvasInfo; drawer.canvasMap ) {
			 if( !canvasInfo.initialized ) {
				 canvasInfo.canvasInstance.init();
				 canvasInfo.initialized = true;
			 }
		 }
	 }

	/++
	 + Iterate over each active canvas, traversing the model
	 +/
	DrawFunctionInfo[] draw( Model model ) {
		/*
		void drawFunc(Model injectModel) {
			// Check which canvas are currently active
			foreach( canvasInfo; canvasMap ) {
				if( canvasInfo.active ) {
					// Traverse the model and draw it on each active canvas
					foreach( drawable; drawables(injectModel) ) {
						canvasInfo.canvasInstance.draw( drawable );
					}
				}
			}
		}
		*/
		// TODO: A clean system to generate draw functions depending
		// on the canvas. CURRENTLY ONLY GlCanvas
		void drawGlCanvas( Model injectModel ) {
			auto canvasInfo = canvasMap["GlCanvas"];
			if( canvasInfo.active ) {
				// Traverse the model and draw it on each active canvas
				foreach( drawable; drawables(injectModel) ) {
					canvasInfo.canvasInstance.draw( drawable );
				}
			}
		}

		return( [ new DrawFunctionInfo(
				"GlCanvasFunc"
				, Curry(&drawGlCanvas, model)
					) ] );
	}

	/++
	 + Register canvas for use by the drawer. Mixed in by canvas classes's
	 + constructors
	 +/
	void registerCanvas( ICanvas canvas, string name ) {
		CanvasInfo canvasInfo = { false, true, canvas };
		canvasMap[name] = canvasInfo;
		debug(verbose) {
			stdout( "New registered Canvas: {}", name );
		}
	}
}

alias Singleton!(Drawer) drawer;
