/*******************************************************************************

        copyright:      Copyright (c) 2008 Kris Bell. All rights reserved

        license:        BSD style: $(LICENSE)

        version:        Apr 2008: Initial release

        authors:        Kris

        Since:          0.99.7

*******************************************************************************/

module util.container.model.IContainer;

/*******************************************************************************

        Generic container
        
*******************************************************************************/

interface IContainer (V)
{
        uint size ();

        bool isEmpty ();

        IContainer dup ();

        IContainer clear ();                          

        IContainer reset ();                          

        IContainer check ();

        bool contains (V value);

        bool take (ref V element);

        V[] toArray (V[] dst = null);

        uint remove (V element, bool all);

        int opApply (int delegate(ref V value) dg);

        uint replace (V oldElement, V newElement, bool all);
}


/*******************************************************************************

        Comparator function
        
*******************************************************************************/

template Compare (V)
{
        alias int function (ref V a, ref V b) Compare;
}

