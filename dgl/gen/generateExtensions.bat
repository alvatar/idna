wget http://mesh.dl.sourceforge.net/sourceforge/glew/glew-1.4.0-src.zip
unzip glew-1.4.0-src.zip
mv glew/auto/core ./core
mv glew/auto/extensions ./extensions
rm -Rf glew
mkdir ..\ext
mkdir spec
build -full -clean -exec Main.d

rem sh getExtList.sh
rem build -full -clean -exec genGLExt

rm Main.exe
rem rm genGLExt.exe
