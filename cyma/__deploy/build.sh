#!/bin/sh

declare -x PATH_TO_SCRIPT=`dirname $0`

cd $PATH_TO_SCRIPT
xfbuild ../application/Main.d +h +noop +full +cdmd +obin/Cyma -I../../.. -I../../ -g -w -debug -debug=verbose -L-lGL -L-lXrandr
if [[ `ls *di 2> /dev/null` ]]; then rm -R *di; fi;
