#!/bin/sh

if [[ -a .objs ]]; then rm -R .objs; fi;
if [[ -a .deps ]]; then rm -R .deps; fi;
if [[ `ls xfbuild* 2> /dev/null` ]]; then rm -R xfbuild*; fi;
if [[ -e bin ]]; then rm -R bin; fi
