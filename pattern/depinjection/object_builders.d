module pattern.depinjection.object_builders;

private {
	import pattern.depinjection.property;
	import pattern.depinjection.build_utils;
	import pattern.depinjection.circular;
}

debug (trace) import tango.io.Stdout;

/// Internal usage.
abstract class ISingleBuilder {}

abstract class ClassBuilder (TBuilder) : ISingleBuilder {
	abstract Object asObject (TBuilder parent);
}

/** This is the base class for all builders. The generic parameters are
 * TBuilder, which represents the type of the builder that they are
 * associated with, and T, which represents the type they build, or at least
 * claim to build in case they build an object of another type.
 */
abstract class AbstractBuilder (TBuilder, T) : ClassBuilder!(TBuilder) {

	Object asObject (TBuilder parent) {
		static if (is (T == class) || is (T == interface)) {
			return cast(Object) build (parent);
		} else {
			return null;
		}
	}

	/** Returns an Entity containing the object built. */
	T build (TBuilder parent);
}

/** The default builder for Singletons. */
class SingletonBuilder (TBuilder, T) : AbstractBuilder!(TBuilder, T) {

	private T _singleton;

	T build (TBuilder parent) {
		if (_singleton is null) {
			debug (trace)
				Stdout.formatln ("Building singleton: " ~ T.classinfo.name);
			// I might have just built something that has a dependency on me,
			// if I also have a dependency on it and its dependency was with
			// setter injection. Kind of odd, but it can happen.
			circular.push (typeid(T));
			auto object = get (parent);
			circular.endCtor (typeid(T));
			if (_singleton is null) {
				_singleton = object;
				static if (is (typeof(T.inject) == function)) {
					mixin (`object.inject(` ~ get_deps_impl!(T, 0, "inject") ~ `);`);
				}
				parent.interceptors.intercept!(T) (object);
			}
		}
		return _singleton;
	}

	T get (TBuilder parent) {
		static assert (is (T == class), "Tried to build something that wasn't a class with an ObjectBuilder. Maybe you're missing a binding? Sorry.");
		mixin (get_deps!(T) ());
	}
}

/** The default builder for non-singleton objects. */
class ObjectBuilder (TBuilder, T) : AbstractBuilder!(TBuilder, T) {

	T build (TBuilder parent) {
		// I can only manage to satisfy circular dependencies for a
		// singleton. Therefore, I push but do not pop.
		circular.push (typeid(T));
		auto object = get (parent);
		circular.endCtor (typeid(T));
		static if (is (typeof(T.inject) == function)) {
			mixin (`object.inject(` ~ get_deps_impl!(T, 0, "inject") ~ `);`);
		}
		parent.interceptors.intercept!(T) (object);
		return object;
	}

	T get (TBuilder parent) {
		static assert (is (T == class), "Tried to build something that wasn't a class with an ObjectBuilder. Maybe you're missing a binding? Sorry.");
		mixin (get_deps!(T) ());
	}
}

/** Unused. */
class StructBuilder (TBuilder, T) : AbstractBuilder!(TBuilder, T) {
	T build (TBuilder parent) {
		return T.init;
	}
}

/** Used when you provide an object rather than letting it be built for you. */
class StaticBuilder (TBuilder, T) : SingletonBuilder!(TBuilder, T) {
	private T _provided;

	this (T t) {
		_provided = t;
	}

	override T get (TBuilder parent) {
		return _provided;
	}
}

/** Used when you bind a visible type to an implementation type. */
class DelegatingBuilder (TBuilder, T, TImpl) : AbstractBuilder!(TBuilder, T) {
	private AbstractBuilder!(TBuilder, TImpl) _builder;

	this (bool singleton) {
		if (singleton) {
			_builder = new SingletonBuilder!(TBuilder, TImpl) ();
		} else {
			_builder = new ObjectBuilder!(TBuilder, TImpl) ();
		}
	}

	T build (TBuilder parent) {
		auto actual = _builder.build (parent);
		return actual;
	}
}
