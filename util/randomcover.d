/**
An improved RandomCover struct that fixes bug 2865, adds sampling with
replacement, and uses a BitArray instead of a bool[] to track what's already
been sampled when sampling without replacement.

Authors:

$(WEB erdani.org, Andrei Alexandrescu) (Original RandomCover)
David Simcha (Modifications described above)

License:  Phobos License

Credits:

The entire random number library architecture is derived from the
excellent $(WEB
open-std.org/jtc1/sc22/wg21/docs/papers/2007/n2461.pdf, C++0X) random
number facility proposed by Jens Maurer and contributed to by
researchers at the Fermi laboratory.

Macros:

WIKI = Phobos/StdRandom
*/

import std.random, std.range, std.bitmanip;

version(unittest) {
    import std.conv, std.algorithm;
}

/**For RandomCover.*/
enum Replacement {
    /**Sample the range with replacement.  This means the RandomCover will
     * be an infinite range and elements may be repeated.*/
    With,

    /**Sample the range without replacement.  This means that the RandomCover
     * will be a finite range and elements will not be repeated.*/
    Without
}

///
struct RandomCover(Range, Random, Replacement replace)
if(replace == Replacement.Without && isRandomAccessRange!(Range))
{
    private Range _input;
    private Random _rnd;
    private BitArray _chosen;
    private uint _current;
    private uint _alreadyChosen;

    this(Range input, Random rnd)
    {
        _input = input;
        _rnd = rnd;
        _chosen.length = _input.length;
        popFront;
    }

    auto opSlice()
    {
        return this;
    }

    ref ElementType!(Range) front()
    {
        return _input[_current];
    }

    void popFront()
    {
        if (_alreadyChosen >= _input.length)
        {
            // No more elements
            ++_alreadyChosen; // means we're done
            return;
        }
        uint k = _input.length - _alreadyChosen;
        uint i;
        foreach (e; _input)
        {
            if (_chosen[i]) { ++i; continue; }
            // Roll a dice with k faces
            auto chooseMe = uniform(0, k, _rnd) == 0;
            assert(k > 1 || chooseMe);
            if (chooseMe)
            {
                _chosen[i] = true;
                _current = i;
                ++_alreadyChosen;
                return;
            }
            --k;
            ++i;
        }
        assert(false);
    }

    bool empty() { return _alreadyChosen > _input.length; }
}

///
struct RandomCover(Range, Random, Replacement replace)
if(replace == Replacement.With && isRandomAccessRange!(Range))
{
    private Range _input;
    private Random _rnd;
    private uint _current;
    enum bool empty = false;

    this(Range input, Random rnd)
    {
        _input = input;
        _rnd = rnd;
        popFront;
    }

    auto opSlice()
    {
        return this;
    }

    ref ElementType!(Range) front()
    {
        // Front should return the same thing every time it's called until
        // popFront is called again, so don't do the random selection here.
        return _input[_current];
    }

    void popFront()
    {
        _current = uniform(0U, _input.length, _rnd);
    }

}

/**
Covers a given range $(D r) in a random manner.  If replace ==
Replacement.Without (default), goes through each
element of $(D r) once and only once, just in a random order. If
replace == Replacement.With, RandomCover becomes an infinite range that
randomly selects an element from $(D r), with uniform probability, each time
popFront() is called.  $(D r) must be a random access range with length.

Examples:
----
int[] a = [ 0, 1, 2, 3, 4, 5, 6, 7, 8 ];
auto rnd = Random(unpredictableSeed);
foreach (e; randomCover(a, rnd))
{
    writeln(e);
}

// Create a bootstrap sample of 100 elements of a by sampling with
// replacement.
auto bootstrapSample = take(100, randomCover!(Replacement.With)(a));
----
*/
RandomCover!(Range, Random, replace)
randomCover(Replacement replace = Replacement.Without, Range, Random)
(Range r, Random rnd)
if(isRandomAccessRange!(Range))
{
    return typeof(return)(r, rnd);
}

unittest
{
    int[] a = [ 0, 1, 2, 3, 4, 5, 6, 7, 8 ];
    auto rnd = Random(unpredictableSeed);
    auto rc = randomCover(a, rnd);
    int[] b = new int[9];
    uint i;
    foreach (e; rc)
    {
        //writeln(e);
        b[i++] = e;
    }
    sort(b);
    assert(a == b, text(b));

    // Other than statistical tests for randomness, can't test the
    // with replacement version well.  Just make sure it instantiates
    // and compiles.
    foreach(e; take(100, randomCover!(Replacement.With)(a, rnd))) {}
}
