/**
 * depinjection's first major revision is too heavy (too much overhead).
 * This aims to be a light-weight reimplementation.
 */
module pattern.depinjection.config;

private {
	import pattern.depinjection.exception;
	import pattern.depinjection.property;
	import pattern.depinjection.subbuilders;
	import pattern.depinjection.lifecycle;
	import pattern.depinjection.lifecycles;
}

struct Context {

	TypeInfo type;
	Config config;

	void provide(T) (T value) {
		config._for = type;
		config.provide (value);
		config._for = null;
	}

	void bind(TImpl, TService) () {
		config._for = type;
		config.bind!(TImpl, TService);
		config._for = null;
	}

	void register(T) () {
		config._for = type;
		config.register!(T);
		config._for = null;
	}
}

class Config {

	package static Config _default;
	package static Config defaultConfig() {
		if (_default is null) _default = new Config;
		return _default;
	}

	package ContextAwareBuilder[TypeInfo] builders;
	package TypeInfo _for = null;
	public bool autobuild = true;
	public ILifecycle defaultLifecycle;
	public ILifecycleProvider[] lifecycleProviders;

	this () {
		defaultLifecycle = new SingletonLifecycle;
		lifecycleProviders ~= new InstanceLifecycleProvider;
		lifecycleProviders ~= new SingletonLifecycleProvider;
	}

	void clear () {
		builders = null;
	}

	Config dup() {
		auto config = new Config;
		config.lifecycleProviders = this.lifecycleProviders.dup;
		config.defaultLifecycle = this.defaultLifecycle;
		config.autobuild = this.autobuild;
		foreach (key, value; this.builders)
			config.builders[key] = value;
		return config;
	}

	/** Create an instance of type T (or throw an exception if this is not possible).
	 * There is currently no way to check if the type can be created. */
	ContextAwareBuilder getBuilder(T) () {
		static if (is (T : Object))
			if (autobuild && !knowabout (typeid(T)))
				register!(T);
		return builders[typeid(T)];
	}

	/** When asked for an instance of the given type, insert (a copy of) the given value.
	 * For structs, for instance, it will duplicate the struct and pass the copy. */
	void provide(T) (T value) {
		void[] arr = (cast(void*) (&value))[0 .. T.sizeof];
		registerBuilder (typeid(T), new ConstantBuilder (arr));
	}

	/** When asked for TVisible, provide TImpl. This does not make TImpl available. 
	  * If you provide a lifecycle, that lifecycle will be used for created objects. */
	void bind(TVisible, TImpl: Object) (ILifecycle lifecycle = null) {
		static assert (is (TImpl : TVisible), "Type " ~ TImpl.stringof ~ " is not convertible to type " ~ TVisible.stringof ~ ".");
		auto builder = new CtorBuilder!(TImpl);
		registerBuilder (typeid(TVisible), builder, lifecycle);
	}

	/** Register a type to be built automatically.
	 * This type has to be constructable -- so it has to be a class type. */
	void register(T: Object) (ILifecycle lifecycle = null) {
		auto builder = new CtorBuilder!(T);
		registerBuilder (typeid(T), builder, lifecycle);
	}

	/** Write details about the current configuration to the given sink.
	 * Useful if you want to debug your configuration. */
	public void writeConfiguration (void delegate (char[]) sink) {
		sink ("\n\nRegistered types:");
		foreach (type, builder; builders)
		{
			sink ("\n\t");
			sink ("type ");
			sink (type.toString ());
			sink (": ");
			sink ((cast(Object) builder).toString);
		}
	}

	/** Set up a context on which to bind types.
	 * 
	 * That is, when building an instance of one type ('Building'), set up special
	 * mappings. Use this if you want to control access to certain services or
	 * override defaults. This is especially useful when providing instances of
	 * builtin value types -- a Server class might take an integer Socket, but
	 * a Logger class might take an integer LogLevel, and you don't want those
	 * to conflict.
	 * 
	 * Usage:
	 * with (builder.context!(BeingBuilt))
	 * {
	 * 		bind!(SpecializedImplementation, Interface);
	 * }
	 * builder.context!(BeingBuilt)().bind!(Thing, Interface);
	 */
	public Context context(T) () {
		Context c;
		c.config = this;
		c.type = typeid(T);
		return c;
	}

	/// ditto
	alias context on;

	package void registerBuilder (TypeInfo type, ISingleBuilder builder, ILifecycle lifecycle) {
		if (lifecycle is null)
			lifecycle = getLifecycle(type);
		builder = new LifecycleBuilder (builder, type, lifecycle);
		auto ptr = type in builders;
		if (ptr) {
			(*ptr).add (builder, _for);
		}
		else {
			auto multi = new ContextAwareBuilder;
			multi.add (builder, _for);
			builders[type] = multi;
		}
	}

	package ILifecycle getLifecycle (TypeInfo type) {
		foreach (provider; lifecycleProviders) {
			auto cycle = provider.get(type);
			if (cycle) return cycle;
		}
		return defaultLifecycle;
	}

	private bool knowabout (TypeInfo info) {
		return (info in builders) !is null;
	}
}
