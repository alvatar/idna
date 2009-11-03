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
	
	/++ DrawActors: everything needed to execute a group of draw functions +/
	DrawActor[] drawActors;

	/++
	 + Initialize Drawer and all DrawActors
	 +/
	 final void init() {
		 foreach( i, type; CanvasTypes ) {
			auto actor = addDrawActor( new type, type.stringof );
		 }
	 }

	/++
	 + Iterate over each active canvas, updating the proxy geometries
	 + to the model current state (adds, deletes, modifications).
	 +/
	final DrawActor[] update( ref Model model ) {

		foreach( ref actor; drawActors ) {
			auto actorRef = actor;
			void actorExecution() {
				if( actorRef.active ) {
					// Traverse the model and draw it on each active canvas
					foreach( ref e; elements!(Model.Deltas.New)(model) ) {
						actorRef.canvas.add(e);
					}
					// Traverse the model and draw modified drawables
					foreach( ref e; elements!(Model.Deltas.Modified)(model) ) {
						actorRef.canvas.regenerate(e);
					}
					// Traverse the model and draw it on each active canvas
					foreach( ref e; elements!(Model.Deltas.Removed)(model) ) {
						actorRef.canvas.remove(e);
					}
				}
			}

			actor.execute = &actorExecution;
		}
		model.scheduleToClearDeltas;
		return drawActors;
	}

	/++
	 + Regenerate all the proxy geometry
	 +/
	final DrawActor[] regenerate() {
		// TODO
		// Note on implementation: could be done using a pointers-to-proxies list
		// or iteration and acting on specific proxy types.
		return drawActors;
	}

	/++
	 + Redraw the current proxy geometry
	 +/
	final DrawActor[] redraw() {

		foreach( ref actor; drawActors ) {
			auto actorRef = actor;
			void actorExecution() {
				if( actorRef.active ) {
					actorRef.canvas.draw();
				}
			}

			actor.execute = &actorExecution;
		}
		return drawActors;
	}

	/++
	 + Add canvas to the target list of the drawer
	 +/
	final private DrawActor addDrawActor( Canvas canvas, string name ) {
		DrawActor newDrawActor = new DrawActor;
		newDrawActor.name = name;
		newDrawActor.canvas = canvas;
		canvas.setParendDrawActor( newDrawActor );
		drawActors ~= newDrawActor;

		debug(verbose) writeln( "New registered Canvas: ", name );
		return newDrawActor;
	}

	/++
	 + Remove a canvas from the target list
	 +/
	final private DrawActor removeDrawActor( string name ) {
		// TODO
		return null;
	}
}

alias Singleton!(Drawer) drawer;
