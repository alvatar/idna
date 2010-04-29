#!/bin/sh

xfbuild ../application/Main.d +h +noop +full +cdmd +obin/Cyma -I../../.. -I../../ -g -w -debug -debug=verbose -L-lGL -L-lXrandr
if [[ `ls *di 2> /dev/null` ]]; then rm -R *di; fi;
