/**
 * depinjection's first major revision is too heavy (too much overhead).
 * This aims to be a light-weight reimplementation.
 */
module pattern.depinjection.build;

private {
	import pattern.depinjection.circular;
	import pattern.depinjection.exception;
	import pattern.depinjection.interceptor;
	import pattern.depinjection.property;
	import pattern.depinjection.stack;
	import pattern.depinjection.build_utils;
	import pattern.depinjection.lifecycle;
	import pattern.depinjection.subbuilders;
	import pattern.depinjection.lifecycles;
}


struct Context {

	TypeInfo type;
	Builder config;

	Context provide(T) (T value) {
		config._for = type;
		config.provide (value);
		config._for = null;
		return *this;
	}

	Context bind(TImpl, TService) () {
		config._for = type;
		config.bind!(TImpl, TService);
		config._for = null;
		return *this;
	}

	Context register(T) () {
		config._for = type;
		config.register!(T);
		config._for = null;
		return *this;
	}
}

class Builder {

	Interceptor[] interceptors;
	package Circular circular;
	public BuildStack stack;
	package ContextAwareBuilder[TypeInfo] builders;
	package TypeInfo _for = null;

	/** Whether we should automatically register any type that was requested but not
	  * registered. Only works for concrete classes. */
	public bool autobuild = true;
	public ILifecycle defaultLifecycle;
	public ILifecycleProvider[] lifecycleProviders;

	/** Create a builder using the default configuration. This is the recommended 
	  * way to create a builder -- it will pay attention to bindings created with
	  * depinjection.property. */
	this () {
		stack = new BuildStack;
		circular = new Circular (stack);
		defaultLifecycle = new SingletonLifecycle;
		lifecycleProviders ~= new InstanceLifecycleProvider;
		lifecycleProviders ~= new SingletonLifecycleProvider;
	}

	/** Clear the configuration that you are currently using. */
	void clear () {
		builders = null;
	}

	/** Create an instance of type T (or throw an exception if this is not possible).
	 * There is currently no way to check if the type can be created. */
	T build(T) () {
		T t;
		auto builder = getBuilder!(T);
		create (builder, cast(void*)&t, typeid(T));
		static if (is (T == interface)) {
			return cast(T) *cast(Object*) &t;
		} else {
			return t;
		}
	}

	/// ditto
	alias build get;

	private void create (ContextAwareBuilder builder, void* fill, TypeInfo type) {
		if (builder is null) {
			throw new BindingException (
					"Tried to build an instance of type `" ~ type.toString ~ "', but it was not yet registered.");
		}
		builder.build (this, type, fill);
	}

	package void intercept (ref void[] value, TypeInfo type) {
		foreach (interceptor; interceptors) {
			interceptor.intercept (value, type);
		}
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
	Builder provide(T) (T value) {
		void[] arr = (cast(void*) (&value))[0 .. T.sizeof];
		registerBuilder (typeid(T), new ConstantBuilder (arr));
		return this;
	}

	/** When asked for TVisible, provide TImpl. This does not make TImpl available. 
	  * If you provide a lifecycle, that lifecycle will be used for created objects. */
	Builder bind(TVisible, TImpl: Object) (ILifecycle lifecycle = null) {
		static assert (is (TImpl : TVisible), "Type " ~ TImpl.stringof ~ " is not convertible to type " ~ TVisible.stringof ~ ".");
		auto builder = new CtorBuilder!(TImpl);
		registerBuilder (typeid(TVisible), builder, lifecycle);
		return this;
	}

	/** Register a type to be built automatically.
	 * This type has to be constructable -- so it has to be a class type. */
	Builder register(T: Object) (ILifecycle lifecycle = null) {
		auto builder = new CtorBuilder!(T);
		registerBuilder (typeid(T), builder, lifecycle);
		return this;
	}

	/** Write details about the current configuration to the given sink.
	 * Useful if you want to debug your configuration. */
	public void writeConfiguration (void delegate (string) sink) {
		sink ("\n\nRegistered types:");
		foreach (type, builder; builders) {
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
		} else {
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
