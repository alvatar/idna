module idna.cyma.view.Drawer;

private {
	import xf.utils.Singleton;

	import idna.tools.Compat;
	import idna.tools.Curry;
	import idna.cyma.model.Model;
	import idna.cyma.view.DrawActor;
}

class Drawer {
	
	/++ Draw functions information, everything needed to execute them +/
	DrawActor[] drawActors;

	/++
	 + Iterate over each active and uninitalized canvas
	 +/
	 void init() {
		 /*
		 drawer.registerCanvas( new GlCanvas, "GlCanvas" );

		 foreach( canvasInfo; drawer.canvasMap ) {
			 if( !canvasInfo.initialized ) {
				 canvasInfo.canvasInstance.init();
				 canvasInfo.initialized = true;
			 }
		 }
		 */
	 }

	/++
	 + Iterate over each active canvas, traversing the model
	 +/
	DrawActor[] yield( Model model ) {
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

		/*
		void drawGlCanvas( Model injectModel ) {
			auto canvasInfo = canvasMap["GlCanvas"];
			if( canvasInfo.active ) {
				// Traverse the model and draw it on each active canvas
				foreach( drawable; drawables(injectModel) ) {
					canvasInfo.canvasInstance.draw( drawable );
				}
			}
		}

		return( [ DrawFunctionInfo(
				"GlCanvasFunc"
				, Curry(&drawGlCanvas, model)
				, DrawFunctionInfo.DrawContext( null )
					) ] );
		*/

		// TODO: A clean system to generate draw functions depending
		// on the actor. CURRENTLY ONLY GlCanvas
		drawActors[0]
			.context
			.canvas.linkWithDrawActor( &drawActors[0] );

		void drawGlCanvas( Model injectModel ) {
			if( drawActors[0].active ) {
				// Traverse the model and draw it on each active canvas
				foreach( drawable; drawables(injectModel) ) {
					drawActors[0]
						.context
						.canvas.draw( drawable );
				}
			}
		}

		drawActors[0].func = Curry( &drawGlCanvas, model );
		
		return drawActors;
	}

	/++
	 + Register canvas for use by the drawer. Mixed in by canvas classes's
	 + constructors
	 +/
	 /*j
	void registerCanvas( ICanvas canvas, string name ) {
		CanvasInfo canvasInfo = { false, true, canvas };
		canvasMap[name] = canvasInfo;
		debug(verbose) {
			stdout( "New registered Canvas: {}", name );
		}
	}
	*/
}

alias Singleton!(Drawer) drawer;
