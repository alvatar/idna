module pattern.dconstructor.stack;

private import pattern.dconstructor.exception;
//import tango.util.container.HashSet;

/** A stack representing the current stack of types being built. */
class BuildStack
{
//	private HashSet!(TypeInfo) _building;

	this ()
	{
		//_building = new typeof(_building);
	}

	public
	{
		/** Adds an element to the call stack. This should only be called from 
		 * the Builder. */
		void push (TypeInfo info)
		{
			_targets ~= info;
//			_building.add (info);
		}

		/** Removes the last element from the build stack. This should only be
		 * called from the Builder. */
		void pop ()
		{
			auto info = _targets[$ - 1];
			_targets = _targets[0 .. $ - 1];
//			_building.remove (info);
		}

		/** Returns an ordered list of ClassInfo objects of the types being 
		 * built. The item that was explicitly requested is in index 0, with
		 * the most recent type to be built as the last element. */
		public TypeInfo[] targets ()
		{
			return _targets.dup;
		}

		/** You are building an object of type T. This is being built to
		 * provide to a type U. This function returns the ClassInfo object
		 * representing type U. 
		 * In the case that someone called Builder.get!(T) directly, ths
		 * returns null. */
		public TypeInfo buildfor ()
		{
			if (_targets.length >= 2)
			{
				return _targets[$ - 2];
			}
			return null;
		}
		
		public TypeInfo last ()
		{
			if (_targets.length >= 1)
			{
				return _targets[$ - 1];
			}
			return null;
		}

		package bool contains (TypeInfo type)
		{
			foreach (t; _targets)
				if (t is type) return true;
			return false;
//			return _building.contains (type);
		}
	}

	private TypeInfo[] _targets;
}
