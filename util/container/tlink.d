module util.container.tlink;

private {
	import util.container.linkedlist;
}

enum Threading {
	none
	, inorder
	, leaves
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Provides a link for a tree structure with T shape: connection to parent,
 + fchild and next:
 		parent
 		^
		|
		+---> next
		|
		v
		fchild
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
struct Tlink( V, Threading threading = Threading.none ) {

	alias Tlink!(V) Type;
	alias Type* Ref;

	/++ Parent child of the node +/
	Ref parent = null
	/++ Next node, works as a sibling node when they share the same parent +/
		, next = null
	/++ First child of the node +/
		, fchild = null;

	V value;

	/++
	 + Set to point to next, and parent
	 +/
	final Ref set( V v, Ref p, Ref n ) {
		next = n;
		parent = p;
		value = v;
		version( D_Version2 ) {
			return &this;
		} else {
			return this;
		}
	}

	/++
	 + Set to point to parent, next and child
	 +/
	final Ref set( V v, Ref p, Ref n, Ref c ) {
		fchild = c;
		next = n;
		parent = p;
		value = v;
		version( D_Version2 ) {
			return &this;
		} else {
			return this;
		}
	}

	/++
	 + Splice in p between current cell and whatever it was previously
	 + pointing to
	 +/
	final void attachSibling( Ref p ) {
		if(p) {
			p.next = next;
			p.parent = parent;
			next = p;
		}
	}

	/++
	 + Add a child to current cell. If last is set it will add it as the last
	 + child of the parent
	 +/
	void attachChild( bool last = false )( Ref p ) {
		if(p) {
			version( D_Version2 ) {
				p.parent = &this;
			} else {
				p.parent = this;
			}
			// If it is the first child
			if( !fchild ) {
				fchild = p;
				static if(
						threading == Threading.leaves
						|| threading == Threading.inorder
						) {
					p.next = next;
				} else {
					p.next = null;
				}
			// If there are other children already
			} else {
				static if( last ) {
					fchild.lastSibling.attachSibling(p);
				} else {
					p.next = fchild;
					fchild = p;
				}
			}
		}
	}

	/++
 	 + Cause current cell to skip over the current, effectively
	 + removing the next element from the list
	 +/
	final void detachNext() {
		if(next) {
			static if(
					threading == Threading.leaves
					|| threading == Threading.inorder
					) {
				/*
				// TODO: Consider current is inner node
				// If the next is the first child of its parent then its parent
				// must remove its link to it and update it
				if( next.parent.fchild is next ) {
					// If next has a sibling, then parent relinks to it, otherwise
					// parent becomes a leaf
					if( next.next.parent is next.parent ) {
						next.parent.fchild = next.next;
					} else {
						next = next.parent;
						next.parent.fchild = null;
						return;
					}
				}
				*/
			}
			// REMEMBER! YOU MIGHT CHANGE next IN THE PREVIOUS ALGORITHM
			next = next.next;
		}
	}

	/++
	 + Cause current cell to unlink first children, effectively removing all
	 + the children
	 +/
	final void detachChildren() {
		if( fchild ) {
			static if(
					threading == Threading.leaves
					|| threading == Threading.inorder
					) {
				// TODO
			} else {
				// Asumes that there is no "next" link pointing to fchild
				fchild = null;
			}
		}
	}

	/++
	 + Cut a subtree with the next cell as root, returning it
	 +/
	final Ref cutNext() {
		auto root = next;
		next = next.next;
		if( root ) {
			static if(
					threading == Threading.leaves
					|| threading == Threading.inorder
					) {
				// TODO
			}
			root.parent = null;
			root.next = null;
		}
		return root;
	}

	/++
	 + Returns the last sibling of the current cell, returns itself if
	 + alone or last sibling
	 +/
	final Ref lastSibling() {
		version( D_Version2 ) {
			auto p = &this;
		} else {
			auto p = this;
		}
		static if(
				threading == Threading.leaves
				|| threading == Threading.inorder
				) {
			while( parent is p.next.parent ) p = p.next;
		} else {
			while( p.next ) p = p.next;
		}
		return p;
	}

	/++
	 + Find the right-most sibling at the deepest level of a subtree
	 + taking a node as the root of that subtree
	 +/
	static Ref rightmost( Ref p ) {
		auto last = p;
		static if(
				threading == Threading.leaves
				|| threading == Threading.inorder
				) {
		} else {
			// Levels: Do unless we already did the deepest level
			while( (p = last.fchild) !is null ) {
				// Save the first child of the level as the last child
				last = p;
				// Siblings: If it has a sibling, make the sibling current
				while( p.next ) {
					p = p.next;
					// Update last to the current sibling if it has children
					if( p.fchild ) {
						last = p;
					}
				}
			}
		}
		return last;
	}

	/++
	 + Find the left-most sibling at the deepest level of a subtree
	 + taking a node as the root of that subtree
	 +/
	static Ref leftmost( Ref p ) {
		while( p.fchild ) p = p.fchild;
		return p;
	}

	/++
	 + dup is shallow; i.e., just makes a copy of the current cell
	 +/
	private Ref dup( Ref delegate() alloc ) {
		auto ret = alloc();
		ret.set( value, parent, next, fchild );
		return ret;
	}

	////////////////////////////// POR AQUI
	/*
	/++
	 + Linear search traversing the tree leaves looking for element
	 +/
	final Ref findLeaf (V element) {
		for (auto p = this; p; p = p.next)
			if (element == p.value) {
				return p;
			}
		return null;
	}

	/++
	 + Return the number of leaves traversed to find first occurrence
	 + of a cell with element() element, or -1 if not present
	 +/
	final int leafIndex (V element) {
		int i;
		for (auto p = this; p; p = p.next, ++i) {
			if (element == p.value) {
				return i;
			}
		}
		return -1;
	}

	/++
	 + Count the number of occurrences of element among the tree leaves
	 +/
	final int leafCount (V element) {
		int c;
		for (auto p = this; p; p = p.next) {
			if (element == p.value) {
				++c;
			}
		}
		return c;
	}
	*/

	/++
	 + Return the number of leaf cells
	 +/
	final int countLeafs () {
		int c;
		// TODO: must traverse the whole tree
		/*
			for (auto p = this; p; p = p.next) {
				++c;
			}
			*/
			return c;
	}

	/*
	/++
	 + Return the cell representing the last of the leaves
	 +/
	final Ref lastLeaf () {
		auto p = this;
			while (p.next) {
				p = p.next;
			}
			return p;
	}

	/++
	 + Return the nth leaf, or null if no such
	 +/
	final Ref nthLeaf (int n) {
		auto p = this;
		for (int i; i < n; ++i) {
			p = p.next;
			//TODO no p is null check?
		}
		// TODO: right?
		return p;
	}
	*/
}
