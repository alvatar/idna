#!/bin/sh

xfbuild test.d +full +xstd +noop +cdmd +obin/test -I../../.. -I../../ -g -unittest -debug -debug=verbose -L-lGL -L-lXrandr
