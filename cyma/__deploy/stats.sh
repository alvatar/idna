#!/bin/sh

declare -x PATH_TO_SCRIPT=`dirname $0`

cd $PATH_TO_SCRIPT
cloc ..
