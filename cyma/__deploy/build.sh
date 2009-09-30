#!/bin/sh

xfbuild ../application/Main.d +full +noop +cdmd +obin/Cyma -I../../.. -I../../../xf/ext -I../../../xf -g -debug -debug=verbose -L-lGL -L-lXrandr
