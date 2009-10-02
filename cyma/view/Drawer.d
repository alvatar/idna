module idna.cyma.view.Drawer;

private {
	import xf.utils.Singleton;

	import idna.tools.Compat;
	import idna.tools.Curry;

	import idna.cyma.model.Model;
	import idna.cyma.view.canvas.All;
	import idna.cyma.view.DrawActor;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + The Drawer manages canvases and takes care of generating the draw functios
 + from the model and the actors
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
class Drawer {
	
	/++ DrawActors, everything needed to execute a group of draw functions +/
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
	 }

	/++
	 + Iterate over each active canvas, traversing the model
	 +/
	DrawActor[] yield( Model model ) {
		foreach( ref actor; drawActors ) {
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
