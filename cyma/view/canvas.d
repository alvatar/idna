module cyma.view.canvas;

private {
	import std.stdio;
	import std.traits;

	import cyma.view.icanvas;
	import cyma.view.idrawactor;
}

protected {
	import cyma.engine.idgenerator;
	import cyma.engine.element;
	import cyma.view.drawableproxy;
	import util.container.hashmap;
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + This abstract class takes care of linking Canvases with the DrawActor they
 + belong to
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
abstract class Canvas : ICanvas {

	/++ A link with a DrawActor that gives the Canvas all info needed +/
	protected IDrawActor drawActor;

	/++ Update the link with a DrawActor +/
	void setParendDrawActor( IDrawActor drawActor ) {
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
