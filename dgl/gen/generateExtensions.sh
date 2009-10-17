#!/bin/sh

###############################################################################
# Script for automating Dog's OpenGL extensions generation
###############################################################################

function remove_directory
{
	if [[ -d $1 ]]; then
		rm -fR $1 || { echo "There was an error removing $1"; exit 192; }
	fi
}

function cleanup
{
	remove_directory glew;
	remove_directory core;
	remove_directory extensions;
	remove_directory objs;
	remove_directory spec;
	remove_directory core;
}

declare -rx GLEX_VERSION="1.5.1"

# Download and prepare
cleanup
wget http://mesh.dl.sourceforge.net/sourceforge/glew/glew-$GLEX_VERSION-src.zip
unzip glew-$GLEX_VERSION-src.zip

mv glew/auto/core ./core
mv glew/auto/extensions ./extensions
rm -Rf glew
rm glew-$GLEX_VERSION-src.zip*

if [[ -d ../ext ]]; then
	echo "../ext directory already existing!"
	rm -R ../ext/* || {
		echo "There was an error removing old extension d files in ../ext"
		exit 192
	}
else
	mkdir ../ext
fi

# Build and execute the generator
ldc -of=Generator Main.d FreeList.d ThreadPool.d || {
	echo "There was an error building the Extensions Generator"
	exit 192;
}
./Generator

# Cleanup
cleanup
