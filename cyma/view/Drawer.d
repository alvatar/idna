module cyma.view.Drawer;

private {
	import std.stdio;
	import std.functional;

	import util.Singleton;
	import cyma.model.Model;
	import cyma.view.canvas.All;
	import cyma.view.DrawActor;
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
	 final void init() {
		 foreach( type; CanvasTypes ) {
			addDrawActor( new type, type.stringof );
			drawActors[$-1].canvas.init();
		 }
	 }

	/++
	 + Iterate over each active canvas, traversing the model
	 +/
	final DrawActor[] yield( Model model ) {
		foreach( ref actor; drawActors ) {
			auto canvas = cast(Canvas)actor.canvas;
			canvas.linkDrawActor( actor );
			canvas.updateEnvironment();

			auto actorRef = actor;
			void drawCanvas() {
				if( actorRef.active ) {
					// Traverse the model and draw it on each active canvas
					foreach( drawable; drawables(model) ) {
						actorRef.canvas.draw( drawable );
					}
				}
			}

			// Note: this relies on D2 functionality. D1 must curry.
			actor.execute = &drawCanvas;
		}
		return drawActors;
	}

	/++
	 + Register canvas for use by the drawer.
	 +/
	final private void addDrawActor( Canvas canvas, string name ) {
		DrawActor newDrawActor = new DrawActor;
		newDrawActor.name = name;
		newDrawActor.canvas = canvas;
		drawActors ~= newDrawActor;

		debug(verbose) writeln( "New registered Canvas: ", name );
	}
}

alias Singleton!(Drawer) drawer;
