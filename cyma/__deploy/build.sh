#!/bin/sh

xfbuild ../application/Main.d +full +noop +cdmd +obin/Cyma -I../../.. -I../../ -g -debug -debug=verbose -L-lGL -L-lXrandr
