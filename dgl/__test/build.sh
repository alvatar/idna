#!/bin/sh

#xfbuild -I../.. -I.. cgfxtest.d -J./ +noop +cdmd +obin/dglCgFxTest -g -L-lGL -L-lXrandr
#rm .deps && rm -R tmpObjs
#xfbuild -I../.. -I.. cgtest.d -J./ +noop +cdmd +obin/dglCgTest -g -L-lGL -L-lXrandr
#rm .deps && rm -R tmpObjs
xfbuild -I../.. -I.. test.d +noop +cdmd +obin/dglTest -g -L-lGL -L-lXrandr
rm .deps && rm -R tmpObjs
#xfbuild -I../.. -I.. testThreads.d +noop +cdmd +obin/dglTestThreads -g -L-lGL -L-lXrandr
#rm .deps && rm -R tmpObjs
#xfbuild -I../.. -I.. glsltest.d +noop +cdmd +obin/dglGlslTest -g -L-lGL -L-lXrandr
#rm .deps && rm -R tmpObjs
