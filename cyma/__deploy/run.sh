#/bin/sh

declare -x PROGRAM="bin/Cyma"
declare -x PATH_TO_SCRIPT=`dirname $0`

cd $PATH_TO_SCRIPT

if [[ -f $PROGRAM ]]
then
	$PROGRAM
else
	echo "Program not found. Please build the program"
fi
