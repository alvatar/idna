module cyma.engine.commands.AddLine;

private {
	import std.stdio;

	import cyma.engine.Command;
	import cyma.engine.elements.Line;
	import math.Vector;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Add a single line
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
class TAddLine(T...) : Command!(T) {

	void execute( Model model ) {

		if( !context ) {
			debug writeln("Command: Add line; No context defined -> requesting data");
			interactiveSequence( model );
			return;
		}

		auto tree = model
						.randomLayer
						.staticVectorSubstrate
						.tree;
		auto newChild = tree.createNode(
			new Line((cast(DefineContext!(T))context).arguments)
		);
		tree.root.attachChild( newChild );
		model.addDelta!(Model.Access.New)( &newChild.value );
		debug writeln("Command: Add line -> executed");

		model.updated;
	}

	import std.random;
	void interactiveSequence( Model model ) {
		/*
		auto rnd = Random(unpredictableSeed);
		context( MakeContext( 
				vec2r( uniform(0,1.0,rnd), uniform(0,1.0,rnd) )
				, vec2r( uniform(0,1.0,rnd),uniform(0,1.0,rnd) )
			) );
			*/
	}
}

alias TAddLine!(vec2r, vec2r) AddLine;
