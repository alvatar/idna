#!/bin/sh
gcc -c -fPIC engine_plugin.c -o engine_plugin.o -m32
gcc -m32 -shared -Wl,-soname,engine_plugin.so -o engine_plugin.so  engine_plugin.o
