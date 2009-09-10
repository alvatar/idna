module idna.cyma.engine.Driver;

private{
	import idna.cyma.model.Model;
}

interface IDriver {
	void process( IModel );
}

class Driver : IDriver {
	void process( IModel ) {
	}
}
