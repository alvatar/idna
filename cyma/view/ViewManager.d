module cyma.view.ViewManager;

private {
	import std.stdio;
	import std.functional;

	import cyma.model.Model;
	import cyma.view.canvas.All;
	import cyma.view.ViewOutputActor;
	import util.creation;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + The ViewManager manages canvases and takes care of generating the draw
 + functions from the model and the actors
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
class ViewManager {
	
	private {
		/++ DrawActors: everything needed to execute a group of draw functions +/
		ViewOutputActor[] _viewActors;
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
	final ViewOutputActor[] load( ref Model model ) {

		foreach( ref actor; _viewActors ) {
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

		return _viewActors;
	}

	/++
	 + First level: Iterate over each active canvas, updating the proxy
	 + geometries to the model current state (adds, deletes, modifications).
	 +/
	final ViewOutputActor[] update( ref Model model ) {

		foreach( ref actor; _viewActors ) {
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
		return _viewActors;
	}

	/++
	 + Second level: Regenerate the proxy geometry that needs so
	 +/
	final ViewOutputActor[] regenerate( ref Model model ) {
		// Note on implementation: could be done using a pointers-to-proxies list
		// or iteration and acting on specific proxy types.

		foreach( ref actor; _viewActors ) {
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
		return _viewActors;
	}

	/++
	 + Third level: Redraw the current proxy geometry
	 +/
	final ViewOutputActor[] draw() {

		foreach( ref actor; _viewActors ) {
			auto actorRef = actor;
			void actorExecution() {
				if( actorRef.active ) {
					actorRef.canvas.draw();
				}
			}

			actor.preprocess = null;
			actor.show = &actorExecution;
		}
		return _viewActors;
	}

	/++
	 + Make an actor with immediate mode drawing capabilities with dynamically
	 + dispatched delegates (used for high-level drawing functions, as they
	 + have a high overhead)
	 +/
	 import std.variant;
	final ViewOutputActor immediate() {
		ViewOutputActor result = new ViewOutputActor;
		result.__attachMethod( "test"
				, delegate int(){ writeln("NO ARGS"); return 99; } );
		result.__attachMethod( "test2"
				, delegate int(int a){ writeln(a); return 99; } );
		result.__attachMethod( "test3"
				, delegate int(int a,int b){ writeln(a); writeln(b); return 99; } );
		result.__attachMethod( "test4"
				, delegate Variant(Variant[] a){ writeln(a); return Variant(77); } );
		return result;
	}

	/++
	 + Add canvas to the target list of the drawer
	 +/
	final private ViewOutputActor addDrawActor( Canvas canvas, string name ) {
		ViewOutputActor newDrawActor = new ViewOutputActor;
		newDrawActor.name = name;
		newDrawActor.canvas = canvas;
		canvas.setParendDrawActor( newDrawActor );
		_viewActors ~= newDrawActor;

		debug(verbose) writeln( "New registered Canvas: ", name );
		return newDrawActor;
	}

	/++
	 + Remove a canvas from the target list
	 +/
	final private ViewOutputActor removeDrawActor( string name ) {
		// TODO
		return null;
	}
}
