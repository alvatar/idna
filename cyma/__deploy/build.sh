#!/bin/sh

xfbuild ../application/main.d +full +noop +cdmd +obin/Cyma -I../../.. -I../../ -gc -debug -debug=verbose -L-lGL -L-lXrandr
