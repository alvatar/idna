module pattern.depinjection.build;

private {
	import pattern.depinjection.property;
	import pattern.depinjection.object_builder;
	import pattern.depinjection.multibuilder;
	import pattern.depinjection.aggregate;
	import pattern.depinjection.exception;
	import pattern.depinjection.build_utils;
	static import pattern.depinjection.circular;
	import pattern.depinjection.stack;
	import pattern.depinjection.tracedexception;
}

debug (depinjectionTrace) {
	import tango.io.Stdout;

	void debugln (char[] fmt, ...) {
		Stdout.formatln (fmt, _arguments, _argptr);
	}
} else {
	void debugln (...) {
	}
}

// Unless this is in the same module as Builder, and before Builder in the module,
// dmd gives forward reference complaints.
/** This class holds a configuration for a Builder. You should not use this
 * class directly; instead use the methods on Builder. */
class Config (TBuilder) {
	private TBuilder _parent;

	this (TBuilder parent) {
		_parent = parent;
	}

	/**
	 * The next call to bind, provide, etc will only apply to the given type.
	 * Subsequent calls will not apply to the given type unless you call this
	 * method again.
	 */
	typeof(this) on(T) () {
		_context = typeid(T);
		return this;
	}

	/**
	 * When someone asks for TVisible, give them a TImpl instead.
	 */
	typeof(this) bind(TVisible, TImpl) () {
		static assert (is (TImpl : TVisible), "binding failure: cannot convert type " ~ TImpl.stringof ~ " to type " ~ TVisible.stringof);
		// again, only possible b/c no inheritance for structs
		wrap (TVisible.classinfo, new DelegatingBuilder!(TBuilder, TVisible, TImpl)(singleton!(TImpl)));
		return this;
	}

	private bool singleton(T)() {
		if (is (T : Singleton)) return true;
		if (is (T : Instance)) return false;
		return _defaultSingleton;
	}
	
	/** Notify depinjection about this type so it can build it later. This is not
	 * necessary if you are using the autobuild option. */
	typeof(this) register(T) () {
		static assert (is (T == class), "Currently, only classes can be registered for creation. Tried to register " ~ T.stringof);
		if (singleton!(T)) {
			wrap (T.classinfo, new SingletonBuilder!(TBuilder, T) ());
		} else {
			wrap (T.classinfo, new ObjectBuilder!(TBuilder, T) ());
		}
		return this;
	}

	/** 
	 * For the given type, rather than creating an object automatically, 
	 * whenever anything requires that type, return the given object.
	 * Implicit singletonization. This is required for structs, if you want to
	 * set any of the fields (since by default static opCall is not called).
	 */
	typeof(this) provide(T) (T obj) { wrap (T.classinfo, new StaticBuilder!(TBuilder, T) (obj));
		return this;
	}

	/**
	 * Whenever anyone asks for an array of the given type, insert the given
	 * array. There is no other way to provide structs.
	 */
	typeof(this) list(TVal) (TVal[] elems) {
		throw new Exception ("Non-class types are not supported currently");
	/*
	 wrap!(TVal[])(new GlobalListBuilder!(TBuilder, TVal)(elems));
	 return this;
	 */
	}

	/**
	 * Whenever someone asks for an associative array of the given type,
	 * insert the given associative array.
	 */
	typeof(this) map(TVal, TKey) (TVal[TKey] elems) {
		throw new Exception ("Non-class types are not supported currently");
	/*
	 wrap!(TVal[TKey])(new GlobalDictionaryBuilder!(TBuilder, TKey, TVal)(elems));
	 return this;
	 */
	}

	/** Delete the current configuration.
	 * Sometimes useful, mostly not. */
	void clear () {
		_builders = null;
		_context = null;
	}

	/** Add a custom builder. Check depinjection.object_builder for the API. */
	void custom(T) (AbstractBuilder!(TBuilder, T) builder) {
		wrap (T.classinfo, builder);
	}

	private {
		MultiBuilder[ClassInfo] _builders;
		TypeInfo _context;
		bool _defaultSingleton = true;

		MultiBuilder get (ClassInfo info) {
			if (info in _builders) {
				return _builders[info];
			}
			return null;
		}

		MultiBuilder wrap (ClassInfo info, ISingleBuilder b) {
			auto ret = wrap_s (info, _context, b);
			_context = null;
			return ret;
		}

		MultiBuilder wrap_s (ClassInfo mangle, TypeInfo context, ISingleBuilder b) {
			if (mangle in _builders) {
				auto existing = _builders[mangle];
				existing.add (b, context);
				return existing;
			} else {
				MultiBuilder mb = new MultiBuilder ();
				mb.add (b, context);
				_builders[mangle] = mb;
				return mb;
			}
		}

		AbstractBuilder!(TBuilder, T) make_builder(T) () {
			return wrap (T.classinfo, make_real_builder!(T) ());
		}

		AbstractBuilder!(TBuilder, T) make_real_builder(T) () {
			static if (is (T : T[]) || is (T V : V[K])) {
				buildexception ("Cannot build an array or associative array; you have to provide it.", _parent.stack, typeid(T));
				return null;
			} else static if (is (T == struct)) {
				return new StructBuilder!(TBuilder, T);
			} else static if (is (T == class)) {
				return new ObjectBuilder!(TBuilder, T);
			} else {
				// If this is a static assert, it always gets tripped, since
				// a bound interface can't be built directly. Everything's
				// resolved at runtime.
				buildexception (
						"no bindings, not provided, and cannot create an instance. You must bind interfaces and provide primitives manually.",
						_parent.stack, typeid(T));
				return null;
			}
		}
	}
}

/**
 * The main object builder. Use it to create objects and change type bindings.
 */
class Builder (TInterceptor...) {
	/**
	 * A stack of ClassInfo objects containing the types currently being built.
	 */
	BuildStack stack;

	Config!(typeof(this)) config;

	this () {
		interceptors = new InterceptorCollection!(TInterceptor) ();
		stack = new BuildStack ();
		config = new Config!(typeof(this)) (this);
		depinjection.circular.circular = new depinjection.circular.Circular (stack);
	}

	/**
	 * Get an instance of type T. T can be an interface or class.
	 *
	 * If T is an interface and there are no bindings for it, throw a
	 * BindingException. If T is a class that was not registered, and
	 * autobuild is set to false, throw a BindingException.
	 *
	 * If T is a singleton (if it implements the Singleton interface), 
	 * or if T is not an instance class (does not implement Instance)
	 * and autobuild is set to true, build a copy if none exist, else 
	 * return the existing copy.
	 */
	T get(T) () {
		static if (!(is (T == interface) || is (T == class))) {
			assert (false, "trying to build something that is not a class or interface");
		} else {
			auto info = T.classinfo;
			debugln ("get: " ~ info.name);
			auto b = get_or_add!(T) ();
			debugln ("\tgot a builder");
			auto obj = b.build (this);
			debugln ("\tbuilt");
			return obj;
		}
	}

	Object ofType (ClassInfo type) {
		auto build = cast(ClassBuilder!(typeof(this)))config.get(type);
		if (build) {
			return build.asObject(this);
		} else {
			throw new BuildException("");
		}
	}

	/**
	 * The next call to bind, provide, etc will only apply to the given type.
	 * Subsequent calls will not apply to the given type unless you call this
	 * method again.
	 */
	typeof(this) on(T) () {
		_context = T.classinfo;
		return this;
	}

	/**
	 * When someone asks for TVisible, give them a TImpl instead.
	 */
	typeof(this) bind(TVisible, TImpl) () {
		config.bind!(TVisible, TImpl);
		return this;
	}

	/** Notify depinjection about this type so it can build it later. This is not
	 * necessary if you are using the autobuild option. */
	typeof(this) register(T) () {
		config.register!(T);
		return this;
	}

	/** 
	 * For the given type, rather than creating an object automatically, 
	 * whenever anything requires that type, return the given object.
	 * Implicit singletonization. This is required for structs, if you want to
	 * set any of the fields (since by default static opCall is not called).
	 */
	typeof(this) provide(T) (T obj) {
		config.provide!(T) (obj);
		return this;
	}

	/**
	 * Whenever anyone asks for an array of the given type, insert the given
	 * array. There is no other way to provide structs.
	 */
	typeof(this) list(TVal) (TVal[] elems) {
		config.list!(TVal) (elems);
		return this;
	}

	/**
	 * Whenever someone asks for an associative array of the given type,
	 * insert the given associative array.
	 */
	typeof(this) map(TVal, TKey) (TVal[TKey] elems) {
		config.map (elems);
		return this;
	}

	/** If set to true, depinjection will try to build any type you give it. If set to
	 * false, depinjection will only build types that have been registered. The default
	 * is false. */
	public void autobuild (bool value) {
		_autobuild = value;
	}

	/** If set to true, all types will be treated as singletons unless they inherit from
	 * depinjection.singleton.Instance. If set to false, no types will be treated as
	 * singletons unless they inherit from depinjection.singleton.Singleton. The default
	 * is true. */
	public void defaultSingleton (bool value) {
		config._defaultSingleton = value;
	}

	/** For object builder use only. */
	package InterceptorCollection!(TInterceptor) interceptors;

	private {
		//ISingleBuilder[ClassInfo] _builders;
		ClassInfo _context;
		bool _autobuild = false;

		AbstractBuilder!(typeof(this), T) get_or_add(T) () {
			auto builder = config.get (T.classinfo);
			if (!builder) {
				// If you say get!(ConcreteType), that should work.
				// TODO: I'm not sure if we should implicitly add it, though.
				if (!_autobuild && stack.targets ().length > 1) {
					buildexception ("Type " ~ T.classinfo.name ~ " was not registered.", stack, typeid(T));
				}

				static if (is (T == class)) {
					config.register!(T) ();
					builder = config.get (T.classinfo);
				} else {
					buildexception ("Type " ~ T.classinfo.name ~ " was not registered. Though you enabled autobuild, this was not a class, so I don't know how to build it.", stack, typeid(T));
					return null;
				}
			}
			return cast(AbstractBuilder!(typeof(this), T)) builder.get (stack.buildfor ());
		}
	}
}

void post_build(TBuilder, T) (TBuilder parent, T obj) {}

public class InterceptorCollection (TInterceptor...) {
	static if (TInterceptor.length > 0) {
		private alias TInterceptor[0] TMine;

		private TMine _mine;
	}

	static if (TInterceptor.length > 1) {
		private InterceptorCollection!(TInterceptor[1 .. $]) _tail;
	}

	this () {
		static if (TInterceptor.length > 0) {
			_mine = new TMine ();
			static if (TInterceptor.length > 1) {
				_tail = typeof(_tail) ();
			}
		}
	}

	public void intercept(T) (T built) {
		static if (TInterceptor.length > 0) {
			_mine.intercept!(T) (built);
		}
		static if (TInterceptor.length > 1) {
			_tail.intercept!(T) (built, buildStack);
		}
	}
}
