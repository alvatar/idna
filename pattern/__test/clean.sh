#!/bin/sh

if [[ -a .objs ]]; then rm -R .objs; fi;
if [[ -a .deps ]]; then rm -R .deps; fi;
if [[ `ls xfbuild* 2> /dev/null` ]]; then rm -R xfbuild*; fi;
if [[ -a bin/test ]]; then rm -R bin/test; fi
if [[ -a bin/simple ]]; then rm -R bin/simple; fi
