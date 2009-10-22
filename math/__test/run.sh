#/bin/sh

declare -x PROGRAM="bin/test"

if [[ -f $PROGRAM ]]
then
	$PROGRAM
else
	echo "Program not found. Please build the program"
fi
