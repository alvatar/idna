/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Copyright (c) 2010 by Álvaro Castro-Castilla, All Rights Reserved.
 + Licensed under the MIT/X11 license, see LICENSE file for full description
 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/

module util.container.LinkedTree;

private {
	import util.container.IContainer;

	import util.container.Tlink;
}

public import util.container.Container;

class LinkedTree (
	V
	, alias Reap = Container.reap
	, alias Heap = Container.DefaultCollect
	) : IContainer!(V) {

	public alias Tlink!(V) Type;
	private alias Type *Ref;
	private alias Heap!(Type) Alloc;

	private {
		// number of elements contained
		uint _count;

		// configured heap manager
		Alloc _heap;

		// mutation tag updates on each change
		uint _mutation;

		// Root of the tree. Null if empty
		Ref _root;
	}

	this() {
		this( new Type, 0 );
	}

	protected this( Ref h, uint c ) {
		_root = h;
		_count = c;
	}

	~this() {
		reset;
	}

	/++
	 + Return the root of the tree
	 +/
	final Ref root() {
		return _root;
	}

	/++
	 + Return the configured allocator
	 +/
	final Alloc allocator() {
		return _heap;
	}

	/++
	 + Return a generic iterator for contained elements
	 +/
	final Iterator iterator() {
		Iterator i;
		return i;
	}

	/++
	 + opApply
	 +/
	final int opApply( int delegate(ref V value) dg ) {
		int result = 0;

		bool jump = false;
		auto current = _root;
		// Go allways as deep as possible through fchilds, as soon as there
		// are no more, then traverse its siblings. When there are no more
		// siblings go to parent, but take care of jumping over the fchild
		// case next time, otherwise we would fall in an infinite loop. Also
		// avoid executing the delegate in this case, as we are traversing
		// the parent for second time.
		while( true ) {
			if( current.fchild && !jump ) {
				current = current.fchild;
			} else if( current.next ) {
				current = current.next;
			} else if( current.parent ) {
				current = current.parent;
				jump = true;
				continue;
			} else {
				return result;		
			}
			result = dg( current.value );
		}
	}

	/++
	 + Create a Node with the allocator
	 +/
	 final Ref createNode(T)(T args...) {
		 V value = V(args);
		 Ref node = _heap.allocate.set(value, null, null);
		 increment;
		 return node;
	 }

	/++
	 + Return the number of elements contained
	 +/
	final uint size() {
		return _count;
	}

	final bool isEmpty() {
		return true;
	}

	final LinkedTree dup() {
		return null;
	}

	final LinkedTree reset() {
		return null;
	}

	final LinkedTree check() {
		return null;
	}

	final bool contains( V element ) {
		if (root) {
			//return root.find (element) !is null;
		}
		return false;
	}

	final bool take( ref V element ) {
		return true;
	}

	final V[] toArray( V[] dst = null ) {
		return null;
	}

	final uint remove( V element, bool all ) {
		return 0;
	}

	uint replace( V oldElement, V newElement, bool all ) {
		return 0;
	}

	final LinkedTree clear() {
		return null;
	}

	private LinkedTree clear(bool all) {
		mutate;

		/*
		// collect each node if we can't collect all at once
		if (heap.collect(all) is false && count)
		{
			auto p = list;
			while (p)
			{
				auto n = p.next;
				decrement (p);
				p = n;
			}
		}
		*/

		_root = new Type;
		_count = 1;
		return this;
	}

	private void increment() {
		++_mutation;
		++_count;
	}

	private void decrement(Ref p) {
		Reap(p.value);
		_heap.collect(p);
		++_mutation;
		--_count;
	}

	private void mutate() {
		++_mutation;
	}


	/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	 +
	 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
	enum TraverseMethod {
		PreOrder
		, InOrder
		, PostOrder
		, LevelOrder
	}

	private struct Iterator {

		Ref function(Ref) bump;
		Ref               cell,
						  head,
						  prior;
		LinkedTree owner;
		uint              mutation;

		/++
		 + Did the container change underneath us?
		 +/ 
		bool valid () {
			return owner._mutation is mutation;
		}               

		/***************************************************************

		  Accesses the next value, and returns false when
		  there are no further values to traverse

		 ***************************************************************/

		bool next (ref V v)	{
			auto n = next;
			return (n) ? v = *n, true : false;
		}

		/***************************************************************

		  Return a pointer to the next value, or null when
		  there are no further values to traverse

		 ***************************************************************/

		V* next () {
			V* r;
			/*
			if (cell) {
				prior = cell;
				r = &cell.value;
				cell = bump (cell);
				if (cell is head)
					cell = null;
			}
			*/
			return r;
		}

		/***************************************************************

		  Foreach support

		 ***************************************************************/

		int opApply (int delegate(ref V value) dg) {
			int result;
			auto c = cell;
			while (c) {
				prior = c;
				if ((c = bump(c)) is head)
					c = null;
				if ((result = dg(prior.value)) != 0)
					break;
			}
			cell = c;
			return result;
		}                               

		/***************************************************************

		  Remove value that was just iterated.

		 ***************************************************************/

		bool remove () {
			/*
			if (prior) {
				auto next = bump (prior);
				if (prior is head) {
					if (prior is next)
						owner.root = null;
					else
						head = owner.root = next;
				}

				prior.unlink;
				owner.decrement (prior);
				prior = null;

				// ignore this change
				++mutation;
				return true;
			}
			*/
			return false;
		}

		/***************************************************************

		  Insert a new value before the node about to be
		  iterated (or after the node that was just iterated).

Returns: a copy of this iterator for chaining.

		 ***************************************************************/

		Iterator insert(V value) {
			/*
			// Note: this needs some attention, not sure how
			// to handle when iterator is in reverse.
			if(cell is null)
				prior.addNext(value, &owner.heap.allocate);
			else
				cell.addPrev(value, &owner.heap.allocate);
			owner.increment;

			//
			// ignore this change
			//
			mutation++;
			*/
			version( D_Version2 ) {
				return this;
			} else {
				return *this;
			}
		}

		/***************************************************************

		 ***************************************************************/

		Iterator traversal( TraverseMethod method ) {
			switch( method ) {
				case TraverseMethod.PreOrder:
					bump = &nextPreOrder;
				break;
				case TraverseMethod.InOrder:
					bump = &nextInOrder;
				break;
				case TraverseMethod.PostOrder:
					bump = &nextPostOrder;
				break;
				case TraverseMethod.LevelOrder:
					bump = &nextLevelOrder;
				break;
				default: break;
			}
			version( D_Version2 ) {
				return this;
			} else {
				return *this;
			}
		}

		private static Ref nextPreOrder(Ref p) {
			return p.next;
		}

		private static Ref nextInOrder(Ref p) {
			return p.next;
		}

		private static Ref nextPostOrder(Ref p) {
			return p.next;
		}

		private static Ref nextLevelOrder(Ref p) {
			return p.next;
		}
	}
}
