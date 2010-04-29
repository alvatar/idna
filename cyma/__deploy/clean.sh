#!/bin/sh

declare -x PATH_TO_SCRIPT=`dirname $0`

cd $PATH_TO_SCRIPT
if [[ -a .objs ]]; then rm -R .objs; fi;
if [[ -a .deps ]]; then rm -R .deps; fi;
if [[ -a .swp ]]; then rm .swp; fi;
if [[ `ls xfbuild* 2> /dev/null` ]]; then rm -R xfbuild*; fi;
if [[ `ls *di 2> /dev/null` ]]; then rm -R *di; fi;
if [[ -a bin/Cyma ]]; then rm -R bin/Cyma; fi

if [[ -a engine_plugin.o ]]; then rm engine_plugin.o; fi;
if [[ -a engine_plugin.so ]]; then rm engine_plugin.so; fi;
