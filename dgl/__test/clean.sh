#!/bin/sh

if [[ -a .objs ]]; then rm -R .objs; fi;
if [[ -a .deps ]]; then rm -R .deps; fi;
if [[ `ls xfbuild* 2> /dev/null` ]]; then rm -R xfbuild*; fi;
if [[ -a bin/Cyma ]]; then rm -R bin/Cyma; fi
