#/bin/sh

declare -x PROGRAM="bin/Cyma"

if [[ -f $PROGRAM ]]
then
	$PROGRAM
else
	echo "Program not found. Please build the program"
fi
