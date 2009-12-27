#!/bin/sh

xfbuild test.d +full +xstd +noop +cdmd +obin/test +O.objs -I../../.. -I../.. -g -unittest -debug -debug=verbose
if [[ -a .objs ]]; then rm -R .objs; fi;
if [[ -a .deps ]]; then rm -R .deps; fi;
xfbuild simple.d +full +xstd +noop +cdmd +obin/simple +O.objs -I../../.. -I../.. -g -unittest -debug -debug=verbose
