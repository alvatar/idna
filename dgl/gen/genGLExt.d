/+import tango.text.stream.LineIterator;
import tango.text.Util;
import tango.text.convert.Integer : parse;
import tango.text.convert.Layout;
import tango.stdc.ctype : isdigit, isupper;

import tango.io.FileConduit;
import tango.io.Stdout;
import tango.io.Print;


struct Ext {
	int		id;
	char[]	name;
}


Ext processLine(char[] line, int offset) {
	auto parts = line.split(` `);

	static int prevExt = 0;
	int		extNr		= parse(parts[0]);
	if (-1 == extNr) extNr = prevExt;		
	prevExt = extNr;
	
	char[] extName = parts[1];
	
	if (`GL_` == extName[0..3]) {
		extName = extName[3..$];
	}
	
	if (isdigit(extName[0])) extName = '_'  ~ extName;
	
	return Ext(extNr+offset, extName);
}


void main() {
	Ext[] extensions;
	
	extensions ~= Ext(1, `VERSION_1_2`);
	extensions ~= Ext(2, `VERSION_1_3`);
	extensions ~= Ext(3, `VERSION_1_4`);
	extensions ~= Ext(4, `VERSION_1_5`);
	extensions ~= Ext(5, `VERSION_2_0`);
	extensions ~= Ext(6, `VERSION_2_1`);
	
	{
		auto file = new FileConduit(`arbExtensions.lst`);
		scope(exit) { file.close; }
		foreach (i, line; new LineIterator!(char)(file)) {
			char[] trimmed = line.trim();
			if (trimmed.length) {
				extensions ~= processLine(trimmed, 20);
			}
		}
	}

	{
		auto file = new FileConduit(`nonArbExtensions.lst`);
		scope(exit) { file.close; }
		foreach (i, line; new LineIterator!(char)(file)) {
			char[] trimmed = line.trim();
			if (trimmed.length) {
				extensions ~= processLine(trimmed, 200);
			}
		}
	}

	createOutput(extensions);
}


void createOutput(Ext[] extensions) {
	scope outFile = new FileConduit(`../GLExt.d`, FileConduit.WriteCreate);
	scope(exit) { outFile.close; }
	scope o = new Print!(char)(new Layout!(char), outFile);
	
	o.formatln(
`module dog.GLExt;



template MGLExt() {{
	enum : ushort {{`);
	
	foreach (e; extensions) {
		o.formatln(
`		{1} = {0},`, e.id, e.name);
	}


	o.formatln(
`	}
	
	
	class GLExt(char[] extMask__) : OpenGL {{
		const char[] glExtMask__ = extMask__;`);
	
	foreach (e; extensions) {
		if (e.name[0..4] == `WGL_`) o.formatln(`		version (Windows) `);
		if (e.name[0..4] == `GLX_`) o.formatln(`		version (GLX) `);
		o.formatln(
`		static if (extMaskTestBit__(extMask__, {0})) {{
			private static import dog.ext.{1};
			mixin dog.ext.{1}.{1}__!({0});
		}`, e.id, e.name);
	}
	
	o.formatln(
`		final private bool isSupported__() {{`);

	foreach (e; extensions) {
		if (e.name[0..4] == `WGL_`) o.formatln(`			version (Windows) `);
		if (e.name[0..4] == `GLX_`) o.formatln(`			version (GLX) `);
		o.formatln(
`			static if (extMaskTestBit__(extMask__, {0})) {{
				if (!{1}__supported()) return false;
			}`, e.id, e.name);
	}
	
	o.formatln(
`			return true;
		}
		
		
		final .GLExt!(extractExtMask__!(extMask__, T)) ext(T ...)() {{
			const char[] newExtMask = extractExtMask__!(extMask__, T);
			auto res = cast(.GLExt!(newExtMask))cast(void*)this;
			static assert (res.glExtMask__ == newExtMask);
			if (!res.isSupported__()) return null;
			return res;
		}
	}
}`);
}
+/