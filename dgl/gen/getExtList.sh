 wget http://www.opengl.org/registry/

sed -n \
-e 's/<li value=\([0-9]*\)>/\1/' \
-e 's/<a href=".*">\(.*\)<\/a>/\1/' \
-e 's/[ 	]*<br>/-1/' \
-e '/>ARB Extensions by number</,/<\/ol>/p' \
index.html | \
sed -n -e '/^[-0-9]\{1,\}/p' > arbExtensions.lst

sed -n \
-e 's/<li value=\([0-9]*\)>/\1/' \
-e 's/<a href=".*">\(.*\)<\/a>/\1/' \
-e 's/[ 	]*<br>/-1/' \
-e '/>Vendor and EXT Extensions by number</,/<\/ol>/p' \
index.html | \
sed -n -e '/^[-0-9]\{1,\}/p' > nonArbExtensions.lst
echo "" >> nonArbExtensions.lst
echo "" >> arbExtensions.lst

rm index.html
