module cyma.view.Drawer;

private {
	import std.stdio;
	import std.functional;

	import cyma.model.Model;
	import cyma.view.canvas.All;
	import cyma.view.DrawActor;
	import util.creation;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + The Drawer manages canvases and takes care of generating the draw functios
 + from the model and the actors
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
class Drawer {
	
	private {
		/++ DrawActors: everything needed to execute a group of draw functions +/
		DrawActor[] _drawActors;
	}

	private {
		this() {
			init();
		}
	}

	/++
	 + Static Creation
	 +/
	mixin StaticCreation;

	/++
	 + Initialize Drawer and all DrawActors
	 +/
	 final void init() {
		 foreach( i, type; CanvasTypes ) {
			 auto actor = addDrawActor( new type, type.stringof );
		 }
	 }

	/++
	 + Zero level: iterate over everything and recreate the representation
	 +/
	final DrawActor[] load( ref Model model ) {

		foreach( ref actor; _drawActors ) {
			auto actorRef = actor;
			void actorExecution() {
				if( actorRef.active ) {
					actorRef.canvas.clear();
					// Traverse the model and draw it on each active canvas
					foreach( ref e; elements!(Model.Access.All)(model) ) {
						actorRef.canvas.add(e);
					}
					actorRef.canvas.changed();
				}
			}

			actor.preprocess = &actorExecution;
		}

		return _drawActors;
	}

	/++
	 + First level: Iterate over each active canvas, updating the proxy
	 + geometries to the model current state (adds, deletes, modifications).
	 +/
	final DrawActor[] update( ref Model model ) {

		foreach( ref actor; _drawActors ) {
			auto actorRef = actor;
			void actorExecution() {
				if( actorRef.active ) {
					// Traverse the model and add the new elements to the canvas
					foreach( ref e; elements!(Model.Access.New)(model) ) {
						actorRef.canvas.add(e);
					}
					// Traverse the model and regenerate modified elements
					foreach( ref e; elements!(Model.Access.Modified)(model) ) {
						actorRef.canvas.regenerate(e);
					}
					// Traverse the model and remove elements from canvas
					foreach( ref e; elements!(Model.Access.Removed)(model) ) {
						actorRef.canvas.remove(e);
					}
					// Tells the canvas that it has been changed
					actorRef.canvas.changed();
				}
				model.flatten();
			}

			actor.preprocess = &actorExecution;
		}
		return _drawActors;
	}

	/++
	 + Second level: Regenerate the proxy geometry that needs so
	 +/
	final DrawActor[] regenerate( ref Model model ) {
		// Note on implementation: could be done using a pointers-to-proxies list
		// or iteration and acting on specific proxy types.

		foreach( ref actor; _drawActors ) {
			auto actorRef = actor;
			void actorExecution() {
				if( actorRef.active ) {
					// Traverse the model and regenerate 
					// TODO
					/*
					foreach( ref e; elements!(Model.Access.Modified)(model) ) {
						actorRef.canvas.regenerate(e);
					}
					*/
				}
				model.flatten();
			}

			actor.preprocess = &actorExecution;
		}
		return _drawActors;
	}

	/++
	 + Third level: Redraw the current proxy geometry
	 +/
	final DrawActor[] draw() {

		foreach( ref actor; _drawActors ) {
			auto actorRef = actor;
			void actorExecution() {
				if( actorRef.active ) {
					actorRef.canvas.draw();
				}
			}

			actor.preprocess = null;
			actor.show = &actorExecution;
		}
		return _drawActors;
	}

	/++
	 + Add canvas to the target list of the drawer
	 +/
	final private DrawActor addDrawActor( Canvas canvas, string name ) {
		DrawActor newDrawActor = new DrawActor;
		newDrawActor.name = name;
		newDrawActor.canvas = canvas;
		canvas.setParendDrawActor( newDrawActor );
		_drawActors ~= newDrawActor;

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
