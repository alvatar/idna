#!/bin/sh

declare -x CURRENTDIR=`pwd`
declare -x VISPROG=""

cd /data/projects/idna

if [[ $1 == "" ]]; then VISPROG="dot"; else VISPROG=$1; fi
redimple cyma.application.Main -xdgl | $VISPROG -Tpdf -o$CURRENTDIR/Cyma.pdf && xpdf $CURRENTDIR/Cyma.pdf && rm $CURRENTDIR/Cyma.pdf

cd -
