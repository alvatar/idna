module pattern.dconstructor.lifecycle;

/** A Lifecycle is used to determine when to create a new object
  * versus returning an existing one. 
  * Two extreme examples are SingletonLifecycle and InstanceLifecycle.
  * During a lifecycle, building a type will always return the same
  * instance. When that lifecycle finishes, any further build will
  * create a new instance.
  * 
  * This does not protect you from holding a reference to an object
  * from a prior lifecycle.
  */
interface ILifecycle
{
	ulong key();
	bool current(ulong key);
}

/** A LifecycleProvider gets a lifecycle appropriate for a type. */
interface ILifecycleProvider
{
	/** Get the appropriate ILifecycle for the given type.
	  * Returns null to indicate that this provider does not
	  * make any judgment about the type. */
	ILifecycle get(TypeInfo type);
}

/** Example implementation -- manually advance the lifecycle when necessary. */
class Lifecycle : ILifecycle
{
	ulong id;

	ulong key()
	{
		return id;
	}

	void advance()
	{
		id++;
	}

	bool current(ulong id)
	{
		return this.id == id;
	}
}

