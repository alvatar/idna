#!/bin/sh

declare -x CURRENTDIR=`pwd`
declare -x OUTPUTTYPE="pdf"
declare -x GENPROG=""
declare -x VISPROG="xpdf"

cd /data/projects/idna

if [[ $1 == "" ]]; then GENPROG="dot"; else GENPROG=$1; fi
redimple cyma.application.Main -xcore -xio -xsys -xutil -xmath -xdgl | $GENPROG -T$OUTPUTTYPE -o$CURRENTDIR/Cyma.$OUTPUTTYPE && $VISPROG $CURRENTDIR/Cyma.$OUTPUTTYPE && rm $CURRENTDIR/Cyma.$OUTPUTTYPE

cd -
