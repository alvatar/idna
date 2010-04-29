#!/bin/sh

declare -x CURRENTDIR=`pwd`
declare -x OUTPUTTYPE="ps"
declare -x GENPROG=""
declare -x VISPROG="gv"
declare -x PATH_TO_SCRIPT=`dirname $0`

cd $PATH_TO_SCRIPT/../..

if [[ $1 == "" ]]; then GENPROG="dot"; else GENPROG=$1; fi
redimple cyma.application.Main -xcore -xio -xsys -xutil -xmath -xdgl | $GENPROG -T$OUTPUTTYPE -o$CURRENTDIR/Cyma.$OUTPUTTYPE && $VISPROG $CURRENTDIR/Cyma.$OUTPUTTYPE && rm $CURRENTDIR/Cyma.$OUTPUTTYPE

cd -
