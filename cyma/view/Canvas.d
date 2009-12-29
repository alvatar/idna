module cyma.view.Canvas;

private {
	import std.stdio;
	import std.traits;

	import cyma.controller.OutputActor;
	import cyma.controller.graphical.ICanvas;
}

protected {
	import cyma.engine.IdGenerator;
	import cyma.engine.Element;
	import cyma.view.DrawableProxy;
	import util.container.HashMap;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + This abstract class takes care of linking Canvases with the DrawActor they
 + belong to
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
abstract class Canvas : ICanvas {

	/++ A link with a DrawActor that gives the Canvas all info needed +/
	protected OutputActor drawActor;

	/++ Update the link with a DrawActor +/
	void setParendDrawActor( OutputActor drawActor ) {
		this.drawActor = drawActor;
	}

	void changed() {
		_isProxiesChanged = true;
	}

	protected {
		alias HashMap!(IdType, DrawableProxy) ProxiesMap;
		/++
		 + Structure for proxy drawable object. It needs to be ordered (for correct
		 + z-depths) and indexable (to allow access knowing an element's id).
		 +/
		 // TODO: SortedMap
		ProxiesMap _proxies;

		/++ Flag: ¿has proxies changed? +/
		bool _isProxiesChanged = false;

		/++ Flag: is vbo and everything initialized? +/
		bool _initialized = false;

		this() {
			_proxies = new ProxiesMap;
		}
	}
}
