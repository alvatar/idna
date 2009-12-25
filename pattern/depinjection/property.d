module pattern.depinjection.property;

/**
 * An empty interface from which a class can inherit to mark it as a singleton.
 */
public interface Singleton {}

/**
 * An empty interface from which a class can inherit to mark it as not being a singleton.
 */
public interface Instance {}

/** Mixin to autoregister this type as implementing the given type.
 * Examples:
 * ---
 * class ServiceImpl 
 * {
 * 	mixin(Implements!(IService));
 * }
 * ---
 */
public template Implements (T) {
	const Implements =
	`
	static this ()
	{
		builder().bind!(` ~ T.stringof ~ `, typeof(this));
	}
	`;
}

/** Mixin to autoregister this type as itself.
 * Examples:
 * ---
 * class Service
 * {
 * 	mixin(Register);
 * }
 * ---
 */
public const char[] Register = `
	static this ()
	{
		builder().register!(typeof(this));
	}
	`;
