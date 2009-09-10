module idna.cyma.view.Drawer;

import tango.io.Stdout;

import idna.tools.Compat;
import idna.cyma.model.Model;
import idna.cyma.view.Canvas;

interface IDrawer {
	void draw( IModel model );

	void registerCanvas(T)( Canvas canvas );
}

class Drawer : IDrawer {

	/+
	 + Structure holding information about registered Canvas
	 +/
	struct CanvasInfo {
		bool created;
		bool active;
		ICanvas canvasInstance;
	}

	/++ AA for registered canvas information +/
	CanvasInfo[string] canvasMap;

	void draw( IModel model ) {
		// Check which canvas are currently active
		foreach( canvasInfo; canvasMap ) {
			if( canvasInfo.active ) {
				// Traverse the model and draw it on each active canvas
				foreach( drawable; drawables(model) ) {
					canvasInfo.canvasInstance.draw( drawable );
				}
			}
		}
	}

	void registerCanvas(T : ICanvas)( T canvas ) {
		CanvasInfo canvasInfo = { true, false, this };
		canvasMap[typeof(T)] = canvasInfo;
		debug
			Stdout.formatln( "New registered Canvas: {}", typeof(T) );
	}
}
