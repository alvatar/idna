module idna.cyma.view.Drawer;

private {
	import xf.utils.Singleton;

	import idna.tools.Compat;
	import idna.tools.Curry;

	import idna.cyma.model.Model;
	import idna.cyma.view.canvas.All;
	import idna.cyma.view.DrawActor;
}

class Drawer {
	
	/++ Draw functions information, everything needed to execute them +/
	DrawActor[] drawActors;

	/++
	 + Initialize Drawer and all DrawActors
	 +/
	 void init() {
		 // Use alias from AllCanvas
		 foreach( type; CanvasTypes ) {
			addDrawActor( new type, type.stringof );
			drawActors[$-1].canvas.init();
		 }
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
					) ] );
		*/

		foreach( actor; drawActors ) {
			auto canvas = cast(Canvas)actor.canvas;
			canvas.linkWithDrawActor( actor );

			void drawCanvas( DrawActor injectActor, Model injectModel ) {
				if( injectActor.active ) {
					// Traverse the model and draw it on each active canvas
					foreach( drawable; drawables(injectModel) ) {
						injectActor.canvas.draw( drawable );
					}
				}
			}

			actor.execute = Curry( &drawCanvas, actor, model );
		}

		return drawActors;
	}

	/++
	 + Register canvas for use by the drawer. Mixed in by canvas classes's
	 + constructors
	 +/
	private void addDrawActor( Canvas canvas, string name ) {
		DrawActor newDrawActor = new DrawActor;
		newDrawActor.name = name;
		newDrawActor.canvas = canvas;
		drawActors ~= newDrawActor;

		debug(verbose) stdout( "New registered Canvas: {}", name );
	}
}

alias Singleton!(Drawer) drawer;
