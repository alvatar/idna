#!/bin/sh

xfbuild -I../.. -I.. cgfxtest.d -J./ +noop +cdmd +obin/dogCgFxTest -g -L-lGL -L-lXrandr
rm .deps && rm -R tmpObjs
xfbuild -I../.. -I.. cgtest.d -J./ +noop +cdmd +obin/dogCgTest -g -L-lGL -L-lXrandr
rm .deps && rm -R tmpObjs
xfbuild -I../.. -I.. test.d +noop +cdmd +obin/dogTest -g -L-lGL -L-lXrandr
rm .deps && rm -R tmpObjs
xfbuild -I../.. -I.. testThreads.d +noop +cdmd +obin/dogTestThreads -g -L-lGL -L-lXrandr
rm .deps && rm -R tmpObjs
xfbuild -I../.. -I.. glsltest.d +noop +cdmd +obin/dogGlslTest -g -L-lGL -L-lXrandr
rm .deps && rm -R tmpObjs
