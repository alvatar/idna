#!/bin/sh

declare -x CURRENTDIR=`pwd`
declare -x VISPROG=""

cd /data/projects

if [[ $1 == "" ]]; then VISPROG="dot"; else VISPROG=$1; fi
redimple idna.cyma.application.Main -xCompat -xCurry -xdog | $VISPROG -Tpdf -o$CURRENTDIR/Cyma.pdf && xpdf $CURRENTDIR/Cyma.pdf && rm $CURRENTDIR/Cyma.pdf

cd -
