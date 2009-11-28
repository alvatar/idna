/**Some extra ranges that were not included in std.range.
 *
 * Author:  David Simcha*/
 /*
 * You may use this software under your choice of either of the following
 * licenses.  YOU NEED ONLY OBEY THE TERMS OF EXACTLY ONE OF THE TWO LICENSES.
 * IF YOU CHOOSE TO USE THE PHOBOS LICENSE, YOU DO NOT NEED TO OBEY THE TERMS OF
 * THE BSD LICENSE.  IF YOU CHOOSE TO USE THE BSD LICENSE, YOU DO NOT NEED
 * TO OBEY THE TERMS OF THE PHOBOS LICENSE.  IF YOU ARE A LAWYER LOOKING FOR
 * LOOPHOLES AND RIDICULOUSLY NON-EXISTENT AMBIGUITIES IN THE PREVIOUS STATEMENT,
 * GET A LIFE.
 *
 * ---------------------Phobos License: ---------------------------------------
 *
 *  Copyright (C) 2009 by David Simcha.
 *
 *  This software is provided 'as-is', without any express or implied
 *  warranty. In no event will the authors be held liable for any damages
 *  arising from the use of this software.
 *
 *  Permission is granted to anyone to use this software for any purpose,
 *  including commercial applications, and to alter it and redistribute it
 *  freely, in both source and binary form, subject to the following
 *  restrictions:
 *
 *  o  The origin of this software must not be misrepresented; you must not
 *     claim that you wrote the original software. If you use this software
 *     in a product, an acknowledgment in the product documentation would be
 *     appreciated but is not required.
 *  o  Altered source versions must be plainly marked as such, and must not
 *     be misrepresented as being the original software.
 *  o  This notice may not be removed or altered from any source
 *     distribution.
 *
 * --------------------BSD License:  -----------------------------------------
 *
 * Copyright (c) 2009, David Simcha
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *
 *     * Redistributions in binary form must reproduce the above copyright
 *       notice, this list of conditions and the following disclaimer in the
 *       documentation and/or other materials provided with the distribution.
 *
 *     * Neither the name of the authors nor the
 *       names of its contributors may be used to endorse or promote products
 *       derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED ''AS IS'' AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
module rangeextra;

import std.range, std.traits, std.typetuple, std.typecons, core.memory,
       std.array, std.functional;

version(unittest) {
    import std.algorithm, std.conv, std.stdio;void main(){}
}

template hasLength(T) {
    enum bool hasLength = is(typeof(T.init.length)) ||
                          is(typeof(T.init.length()));
}

/**Tests whether T can be iterated over using foreach.  This is a superset
 * of isInputRange, as it also accepts things that use opApply, builtin
 * arrays, builtin associative arrays, etc.  Useful when all you need is
 * lowest common denominator iteration functionality and you don't care about
 * more advanced range features.*/
template isIterable(T)
{
    static if (is(typeof({foreach(elem; T.init) {}}))) {
        enum bool isIterable = true;
    } else {
        enum bool isIterable = false;
    }
}

unittest {
    struct Foo {  // For testing opApply.
        // For testing.

        int opApply(int delegate(ref uint) dg) { assert(0); }
    }

    static assert(isIterable!(uint[]));
    static assert(!isIterable!(uint));
    static assert(isIterable!(Foo));
    static assert(isIterable!(uint[string]));
    static assert(isIterable!(Chain!(uint[], uint[])));
}

/**Determine the iterable type of any iterable object, regardless of whether
 * it uses ranges, opApply, etc.  This is typeof(elem) if one does
 * foreach(elem; T.init) {}.*/
template IterType(T) {
    alias ReturnType!(
        {
            foreach(elem; T.init) {
                return elem;
            }
        }) IterType;
}

unittest {
    struct Foo {  // For testing opApply.
        // For testing.

        int opApply(int delegate(ref uint) dg) { assert(0); }
    }

    static assert(is(IterType!(uint[]) == uint));
    static assert(is(IterType!(Foo) == uint));
    static assert(is(IterType!(uint[string]) == uint));
    static assert(is(IterType!(Chain!(uint[], uint[])) == uint));
}

///
struct Reindex(alias lambda, T)
if(isRandomAccessRange!(T)) {
private:
    alias unaryFun!(lambda) reindexTempl;

    static if(is(ParameterTypeTuple!(reindexTempl))) {
        alias ParameterTypeTuple!(reindexTempl)[0] I;
        alias reindexTempl reindexFun;
    } else {
        alias reindexTempl!(size_t) reindexFun;
        alias size_t I;
    }

    alias ReturnType!(reindexFun) R;
    static assert(is(typeof(range[R.init])), "Cannot index a " ~ T.stringof ~
        " with a " ~ R.stringof ~ ".");
    alias ElementType!(T) E;

public:
    T range;
    alias range this;

    static if(hasAssignableElements!(T)) {
        ref E opIndex(I index) {
            return range[reindexFun(index)];
        }

        auto opIndexAssign(E val, I index) {
            return range[reindexFun(index)] = val;
        }
    } else {
        E opIndex(I index) {
            return range[reindexFun(index)];
        }
    }

    static if(is(typeof(range[R.init..R.init]) == T)) {
        typeof(this) opSlice(I index1, I index2) {
            return typeof(this)
                (range[reindexFun(index1)..reindexFun(index2)]);
        }
    }

    static if(is(typeof(range[R.init..R.init] = E.init))) {
        void opSliceAssign(E val, I index1, I index2) {
            range[reindexFun(index1)..reindexFun(index2)] = val;
        }
    }

    static if(is(typeof(range[R.init..R.init] = T.init))) {
        void opSliceAssign(T otherRange, I index1, I index2) {
            return range[reindexFun(index1)..reindexFun(index2)] = otherRange;
        }
    }
}

/**Reindex a random-access range by translating its indices via the function
 * lambda.  All properties and methods of the underlying range that do not
 * involve indexing are forwarded to the underlying range using alias this.
 *
 * Examples:
 * ---
 * // An array indexed by only even numbers.
 * auto evenArray = reindex!"a / 2"([0,2,4,6,8,10].dup);
 * for(uint i = 0; i <= 10; i += 2) {
 *     assert(evenArray[i] == i);
 * }
 *
 * // A one-indexed array.
 * auto oneArray = reindex!"a - 1"([1,2,3,4,5].dup);
 * for(uint i = 1; i <= 5; i++) {
 *     assert(oneArray[i] == i);
 * }
 * ---
 */
Reindex!(lambda, T) reindex(alias lambda, T)(T range) {
    return Reindex!(lambda, T)(range);
}

unittest {
    auto oneArray = reindex!"a - 1"([1,2,3,4,5].dup);

    for(uint i = 1; i <= 5; i++) {
        assert(oneArray[i] == i);
    }

    oneArray[1..3] = 1;
    assert(oneArray[1] == 1);
    assert(oneArray[2] == 1);
    assert(oneArray[3] == 3);

    auto last3 = oneArray[3..6];
    assert(last3[3] == 5);

    auto evenArray = reindex!"a / 2"([0,2,4,6,8,10].dup);
    for(uint i = 0; i <= 10; i += 2) {
        assert(evenArray[i] == i);
    }
    writeln("Passed Reindex test.");
}

///
struct Rotated(T)
if(isRandomAccessRange!(T) && hasLength!(T)) {
    T range;
    private size_t startFrom;
    private size_t nIter;  // For iteration.
    alias ElementType!(T) E;

    void setStart(size_t start) {
        startFrom = start;
    }

    size_t length() {
        return range.length;
    }

    static if(hasAssignableElements!(T)) {
        ref E opIndex(size_t index) {
            return range[ startFrom + index < length ?
                    startFrom + index :
                    startFrom + index - length];
        }

        auto opIndexAssign(E val, size_t index) {
            return (startFrom + index < length) ?
               (range[startFrom + index] = val) :
               (range[startFrom + index - length] = val);
        }
    } else {
        E opIndex(size_t index) {
            return range[ startFrom + index < length ?
                    startFrom + index :
                    startFrom + index - length];
        }
    }

    E front() {
        return this[0];
    }

    void popFront() {
        startFrom++;
        nIter++;
    }

    bool empty() {
        return nIter == length;
    }

    void put(E elem) {
        startFrom = (startFrom == length - 1) ? 0 : startFrom + 1;
        immutable pos = startFrom == 0 ? length - 1 : startFrom - 1;
        range[pos] = elem;
    }
}

/**Gives a rotated view of a random access range without modifying the
 * underlying range.  Also funtions as an output range.  Given an underlying
 * range of length L, a Rotated range remembers the last L elements inserted
 * via its put() interface, in the order that they were inserted.  Insertions
 * are O(1), but to the user of the API, the effect is similar to shifting
 * an array on each insertion.
 *
 * Examples:
 * ---
 * uint[] arr = [5,6,7,8,9];
 * auto rot = rotated(arr, 2);
 * assert(rot[0] == 7);
 * assert(rot[3] == 5);
 * assert(rot.length == 5);
 *
 * rot.put(0);
 * rot.put(1);
 * rot.put(2);
 * rot.put(3);
 * rot.put(4);
 * foreach(i; 0..5) {
 *     assert(rot[i] == i);
 * }
 * ---
 */
Rotated!(T) rotated(T)(T range, size_t startPos = 0)
if(isRandomAccessRange!(T) && hasLength!(T))
in {
    assert(startPos < range.length);
} body {
    alias Rotated!(T) t;
    return t(range, startPos, 0);
}

unittest {
    uint[] arr = [5,6,7,8,9];
    auto rot = rotated(arr, 2);
    assert(rot[0] == 7);
    assert(rot[1] == 8);
    assert(rot[2] == 9);
    assert(rot[3] == 5);
    assert(rot[4] == 6);
    assert(rot.length == 5);

    rot.put(0);
    rot.put(1);
    rot.put(2);
    rot.put(3);
    rot.put(4);
    foreach(i; 0..5) {
        assert(rot[i] == i);
    }

    writeln("Passed rotated unittest.");
}

/**A struct wrapper for a static array, to get around the fact that static
 * arrays can't be returned from functions.  Alias this is used to forward
 * all operations to the underlying static array.*/
struct StaticArray(E, size_t N) {
    ///
    E[N] values;
    alias values this;
}

///
struct Comb(size_t N, T)
if(isForwardRange!(T)){
private:
    alias ElementType!(T) E;
    T[N] ranges = void;
    bool _empty;

    void popAll(size_t startFrom) {
        if(startFrom == size_t.max) {
            _empty = true;
            return;
        }
        ranges[startFrom].popFront;
        if(ranges[startFrom].empty) {
            return popAll(startFrom - 1);
        }
        foreach(i; startFrom + 1..N) {
            ranges[i] = ranges[i - 1];
            ranges[i].popFront;
            if(ranges[i].empty) {
                return popAll(startFrom - 1);
            }
        }
    }


public:
    this(T range) {
        static if(N > 0) {
            ranges[0] = range;
            foreach(i; 1..N) {
                ranges[i] = ranges[i - 1];
                ranges[i].popFront;
            }
        }
    }

    StaticArray!(E, N) front() {
        StaticArray!(E, N) ret;
        foreach(i, range; ranges) {
            ret[i] = range.front;
        }
        return ret;
    }


    void popFront() {
        static if(N > 0) {
            popAll(N - 1);
        }
    }

    static if(N > 0) {
        bool empty() {
            return _empty;
        }
    } else {
        enum bool empty = true;
    }
}

/**A struct to iterate over all possible unordered combinations of elements
 * of size N, in a forward range.  This struct is itself a forward range.
 * Each call to front() returns a StaticArray of size N, containing the
 * relevant elements of the range.
 *
 * Examples:
 * ---
 * auto foo = map!(to!(uint, string))(cast(string[]) ["1", "2", "3"]);
 * auto c = comb!2(foo);
 * assert(c.front == [1,2]);
 * c.popFront;
 * assert(c.front == [1,3]);
 * c.popFront;
 * assert(c.front == [2,3]);
 * c.popFront;
 * assert(c.empty);
 * ---
 */
Comb!(N, T) comb(uint N, T)(T range)
if(isForwardRange!(T)) {
    return Comb!(N, T)(range);
}

unittest {
    auto foo = map!(to!(uint, string))(cast(string[]) ["1", "2", "3"]);
    auto c = comb!2(foo);
    assert(c.front == [1,2]);
    c.popFront;
    assert(c.front == [1,3]);
    c.popFront;
    assert(c.front == [2,3]);
    c.popFront;
    assert(c.empty);
    writeln("Passed comb unittest.");
}

template ElementsTuple(T...) {
    static if(T.length == 1) {
        alias TypeTuple!(Unqual!(ElementType!(T[0]))) ElementsTuple;
    } else {
        alias TypeTuple!(Unqual!(ElementType!(T[0])), ElementsTuple!(T[1..$]))
            ElementsTuple;
    }
}

template SameElemTypes(T...) {
    static if(T.length == 1) {
        enum bool SameElemTypes = true;
    } else {
        enum bool SameElemTypes =
            is(Unqual!(ElementType!(T[0])) == Unqual!(ElementType!(T[1]))) &&
            SameElemTypes!(T[1..$]);
    }
}

template UnqualAll(T...) {
    static if(T.length == 1) {
        alias TypeTuple!(Unqual!(T[0])) UnqualAll;
    } else {
        alias TypeTuple!(Unqual!(T[0]), UnqualAll!(T[1..$])) UnqualAll;
    }
}

///
struct Broadcast(T...)
if(allSatisfy!(isForwardRange, T)) {
private :
    UnqualAll!T starts;
    UnqualAll!T ranges;

    void popFrontImpl(uint index)() {
        ranges[index].popFront;
        if(ranges[index].empty) {
            static if(index == 0) {
                return;
            } else {
                ranges[index] = starts[index];
                return popFrontImpl!(index - 1)();
            }
        }
    }

public:
    this(T args) {
        starts = args;
        ranges = args;
    }

    void popFront() {
        popFrontImpl!(T.length - 1)();
    }

    static if(SameElemTypes!(T)) {
        StaticArray!(Unqual!(ElementType!(T[0])), T.length) front() {
            typeof(return) ret;
            foreach(ti, range; ranges) {
                ret[ti] = range.front;
            }
            return ret;
        }
    } else {
        Tuple!(ElementsTuple!(T)) front() {
            ElementsTuple!(T) ret;
            foreach(ti, range; ranges) {
                ret[ti] = range.front;
            }
            return tuple(ret);
        }
    }

    bool empty() {
        return ranges[0].empty;
    }
}

/**Given a set of forward ranges, iterate over all possible tuples composed of
 * [range1Element, range2Element, ..., rangeNElement].  Calling front()
 * returns a StaticArray if the element types of all of the ranges are
 * identical and a std.typecons.Tuple otherwise.
 *
 * Examples:
 * ---
 * // Iterate over all possible RNA codons.
 * immutable bases = "ACGU";
 * auto codonRange = broadcast(bases, bases, bases);
 * assert(codonRange.front == "AAA");
 * codonRange.popFront;
 * assert(codonRange.front == "AAC");
 * ---
 */
Broadcast!(T) broadcast(T...)(T ranges) {
    return Broadcast!(T)(ranges);
}

unittest {
    immutable letters = "AB";
    auto n = broadcast(letters, letters, letters);
    assert(n.front == "AAA");
    n.popFront;
    assert(n.front == "AAB");
    n.popFront;
    assert(n.front == "ABA");
    n.popFront;
    assert(n.front == "ABB");
    n.popFront;
    assert(n.front == "BAA");
    n.popFront;
    assert(n.front == "BAB");
    n.popFront;
    assert(n.front == "BBA");
    n.popFront;
    assert(n.front == "BBB");
    n.popFront;
    assert(n.empty);
    writeln("Passed Broadcast unittest.");
}

template AppendableImpl(T, U) {
    T[] data;
    U elem;
    enum bool ret = is(typeof(data ~= elem));
}

template Appendable(T, U) {
    enum bool Appendable = AppendableImpl!(T, U).ret;
}

/**An array with a capacity field.  It's based on D's builtin arrays and
 * forwards everything except appending and resizing to the underlying builtin
 * array using alias this.  Therefore, the compile time interface and semantics
 * of a TNew are the same as those of a builtin array, modulo a few bugs in
 * alias this.
 *
 * Examples:
 * ---
 * TNew!uint ab, ab2;
 * foreach(i; 0..5) {
 *     ab ~= i;
 *     ab2 ~= [i];
 * }
 * assert(ab == cast(uint[]) [0,1,2,3,4]);
 * assert(ab2 == cast(uint[]) [0,1,2,3,4]);
 * ---
 */
struct TNew(T) {
    /**Access underlying array directly.  Useful for getting around some
     * alias this bugs.*/
    T[] arr;
    alias arr this;
    private size_t capacity = 0;


    private void updateCapacity() {
        capacity = GC.sizeOf(cast(void*) arr.ptr) / T.sizeof;
    }

    ///
    this(T[] newData) {
        arr = newData;
    }

    /**Append a single element.*/
    typeof(this) opCatAssign(U)(U elem)
    if(Appendable!(T, U) && (Appendable!(T, U[]) || !isArray!(U))) {
        if(arr.length < capacity) {
            // Casting away const to change the last element of the array.
            // This is very dangerous, but since this struct is supposed to
            // faithfully replicate the compile time interface of builtin
            // arrays, that means replicating the bugs, too.
            *(cast(Unqual!(T)*) arr.ptr + arr.length) = elem;
            *(cast(size_t*) &arr) += 1;
        } else {
            arr ~= elem;
            updateCapacity();
        }
        return this;
    }

    /**Append an array.*/
    typeof(this) opCatAssign(U)(U elems)
    if(Appendable!(T, U) &&  !(Appendable!(T, U[]) || !isArray!(U))) {
        if((arr.length + elems.length) <= capacity) {
            // Again, casting away const to change the last element of the array.
            auto mutData = (cast(Unqual!(T)*) arr.ptr)
                           [0..arr.length + elems.length];
            mutData[arr.length..$] = cast(typeof(mutData)) elems[];
            arr = cast(typeof(arr)) mutData;
        } else {
            arr ~= elems;
            updateCapacity();
        }
        return this;
    }

    ///
    typeof(this) opAssign(T[] newData) {
        if(arr.ptr !is newData.ptr) {
            capacity = 0;
        }
        arr = newData;
        return this;
    }

    ///
    size_t length(size_t newLen) {
        if(newLen <= arr.length) {
            return arr.length = newLen;
        }
        if(newLen <= capacity) {
            auto ptr = cast(Unqual!(T)*) arr.ptr;
            ptr[arr.length..newLen] = T.init;
            *(cast(size_t*) &arr) = newLen;
        } else {
            arr.length = newLen;
            updateCapacity();
        }
        return newLen;
    }

    /**Make the capacity big enough to hold at least nElem elements
     * without further GC activity.*/
    void reserve(size_t nElem) {
        if(nElem <= arr.length || nElem <= capacity) {
            return;
        }
        updateCapacity();
        if(nElem <= capacity) {
            return;
        }
        if(typeid(T).flags & 1) {
            arr = (cast(T*) GC.realloc(cast(void*) arr.ptr, nElem * T.sizeof))
                  [0..arr.length];
        } else {
            arr = (cast(T*) GC.realloc(cast(void*) arr.ptr, nElem * T.sizeof,
                  GC.BlkAttr.NO_SCAN))[0..arr.length];
        }
        updateCapacity();
    }

    // The following is quick and dirty fixes for stuff that's really bugs in
    // DMD, specifically in alias this.  The appropriate bug reports have been
    // filed and these are just temporary kludges.  They don't need ddoc
    // b/c they should already be expected to work via alias this.

    // Bugzilla 2889
    size_t length() {
        return arr.length;
    }

    // -------------------------Bug 2778-------------------------------
    T front() {
        return arr.front;
    }

    void popFront() {
        return arr.popFront;
    }

    bool empty() {
        return arr.empty;
    }

    T back() {
        return arr.back;
    }

    void popBack() {
        return arr.popBack;
    }

    // ----------------------------------------------------------------
}

/**Array builder literals.*/
TNew!(T) tNew(T)(T[] data) {
    TNew!(T) ret;
    ret = data;
    return ret;
}

unittest {
    TNew!uint ab, ab2;
    foreach(i; 0..5) {
        ab ~= i;
        ab2 ~= [i];
    }
    assert(ab == cast(uint[]) [0,1,2,3,4]);
    assert(ab2 == cast(uint[]) [0,1,2,3,4]);
    writeln("Passed TNew unittest.");
}
