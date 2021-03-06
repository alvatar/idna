/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Copyright (c) 2010 by Álvaro Castro-Castilla, All Rights Reserved.
 + Licensed under the MIT/X11 license, see LICENSE file for full description
 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/

module cyma.view.Viewer;

private {
	import std.stdio;
	import std.functional;

	import cyma.model.Model;
	import cyma.view.canvas.All;
	import cyma.controller.OutputActor;
	import cyma.controller.MultiOutputActor;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + The ViewManager manages canvases and takes care of generating the draw
 + functions from the model and the actors
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
class Viewer {
	
	private {
		/++ DrawActors: everything needed to execute a group of draw functions +/
		OutputActor[] _viewActors;
	}

	this() {
		init();
	}

	/++
	 + Initialize Drawer and all DrawActors
	 +/
	final void init() {
		foreach( i, type; CanvasTypes ) {
			auto actor = addOutputActor( new type, type.stringof );
		}
	}

	/++
	 + Zero level: iterate over everything and recreate the representation
	 +/
	final OutputActor[] load( ref Model model ) {

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
	final OutputActor[] update( ref Model model ) {

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
	final OutputActor[] regenerate( ref Model model ) {
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
	final OutputActor[] draw() {

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
	 + Provide an actor for commands' direct output
	 +/
	final MultiOutputActor output() {
		auto res = new MultiOutputActor;
		foreach(ref a;_viewActors) // TODO: ref?
			res.addActor(a);
		return res;
	}

	/++
	 + Add canvas to the target list of the drawer
	 +/
	final private OutputActor addOutputActor( Canvas canvas, string name ) {
		OutputActor actor = new OutputActor;
		actor.name = name;
		actor.canvas = canvas;
		canvas.setParendOutputActor( actor );
		_viewActors ~= actor;

		debug(verbose) writeln( "New registered Canvas: ", name );
		return actor;
	}

	/++
	 + Remove a canvas from the target list
	 +/
	final private OutputActor removeDrawActor( string name ) {
		// TODO
		return null;
	}
}
