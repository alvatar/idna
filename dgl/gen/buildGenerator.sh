#!/bin/sh

function checked_remove
{
	if [[ -e $1 ]]; then
		rm -fR $1 || { echo "There was an error removing $1"; exit 192; }
	fi
}

checked_remove Generator
declare -rx DARGS="Main.d FreeList.d ThreadPool.d"

ldc -ofGenerator $DARGS || dmd $DARGS || $DC $DARGS || echo -e "\n\nError compiling Generator. Check that you have either ldc or dmd compilers (D1) installed. If you have a D1 compiler with a different name, please set the environment variable \$DC\n" && echo -e "\n...compilation finished\n"

checked_remove Main.o
checked_remove FreeList.o
checked_remove ThreadPool.o
