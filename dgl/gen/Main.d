module gen.Main.d;

import tango.text.Regex : Regex;
import tango.io.stream.Lines;
import tango.io.stream.Iterator;
import tango.text.Util;
import tango.text.Ascii;
import tango.text.convert.Layout;
import tango.text.convert.Integer : toString;
import tango.stdc.ctype : isdigit, isupper;
import tango.net.http.HttpGet;

import tango.util.log.Trace;

import tango.io.FileScan;
import tango.io.device.Conduit;
import tango.io.stream.Format;
alias FormatOutput!(char) Print;
import tango.io.device.File;
import tango.io.FilePath;

import ThreadPool;
import tango.core.Thread;

// otherwise shit hits the fan :/
version = SingleThreaded;



Regex enumMatch, structPMatch, structMatch, structAMatch, unionPMatch, unionMatch, unionAMatch, typeMatch, handleMatch, funcMatch, xfuncMatch, linkMatch, req1Match, req2Match;
static this() {
	char[] wb = `(?<\W>\w|<\w>\W)`;
	enumMatch	= new Regex(wb~`([A-Z][0-9A-Z_]*)\s+([0-9A-Fx]+)$`);
	structPMatch	= new Regex(wb~`typedef\s+struct\s*([a-zA-Z_][a-zA-Z0-9_]*)\s+\*\s*([a-zA-Z_][a-zA-Z0-9_]*);?$`);
	structMatch	= new Regex(wb~`typedef\s+struct\s*?\{(.*)\}\s*([a-zA-Z_][a-zA-Z0-9_]*)\s*;?$`);
	structAMatch	= new Regex(wb~`typedef\s+struct\s*([a-zA-Z_][a-zA-Z0-9_]*\s*)?\{(.*)\}\s*(.*);?$`);
	unionPMatch	= new Regex(wb~`typedef\s+union\s*([a-zA-Z_][a-zA-Z0-9_]*)\s+\*\s*([a-zA-Z_][a-zA-Z0-9_]*);?$`);
	unionMatch	= new Regex(wb~`typedef\s+union\s*?\{(.*)\}\s*([a-zA-Z_][a-zA-Z0-9_]*)\s*;?$`);
	unionAMatch	= new Regex(wb~`typedef\s+union\s*([a-zA-Z_][a-zA-Z0-9_]*\s*)?\{(.*)\}\s*(.*);?$`);
	typeMatch		= new Regex(wb~`typedef\s+(unsigned\s+)?([a-zA-Z0-9_\*]+)\s+([a-zA-Z0-9_]+)\s*$`);
	handleMatch	= new Regex(wb~`DECLARE_HANDLE\(([a-zA-Z0-9_\*]+)\);\s*$`);
	xfuncMatch	= new Regex(wb~`extern\s+void\s*\(\s*\*\s*(glXGetProcAddressA?R?B?)\s*\(const\s+GLubyte\s+\*procName\)\)\s*\(void\)\s*;\s*$`);
	funcMatch		= new Regex(wb~`([a-zA-Z_][a-zA-Z0-9_]*\s*\*?)\s+([a-zA-Z0-9_]+)\s*(\(.*\))\s*$`);
	linkMatch		= new Regex(`http://.*txt`);
	req1Match		= new Regex(`^\s+([a-zA-Z_0-9]{3,})\s+is\s+required\.`);
	req2Match		= new Regex(`^\s+The\s+([a-zA-Z_0-9]{3,})\s+extension\s+is\s+required\.`);
}


char[][] extSuffixes = [
	// for extension suffixes
	`3DFX`, `APPLE`, `ARB`, `ATI`, `ATIX`, `EXT`, `GREMEDY`, `HP`, `IBM`, `INGR`,`INTEL`,
	`KTX`, `MESA`, `NV`, `OES`, `OML`, `SGI`, `SGIS`, `SGIX`, `SUN`, `SUNX`, `WIN`, `I3D`,
];

bool isExtSuffix(char[] str) {
	foreach (s; extSuffixes) {
		if (s == str) return true;
	}
	return false;
}


char[] transformEnumName(char[] name) {
	/+if (name.length > 3 && name[0..3] == `GL_`) {
		name = name[3..$];
		auto parts = name.split(`_`);
		char[] res;
		foreach (i, p; parts) {
			if (i+1 == parts.length && isExtSuffix(p)) {
			} else {			
				res ~= p[0] ~ toLower(p[1..$]);
			}
		}
		if (isdigit(res[0])) res = `_` ~ res;
		return res;
	}+/
	
	return name;
}


char[] transformFuncName(char[] name) {
	char[] res;
	
	if (name.length > 2 && name[0..2] == `gl`) {
		res = (isdigit(name[2]) ? `_` : ``) ~ name[2..$];/+toLower(name[2..3].dup) ~ name[3..$];+/
	} else {
		res = name;
	}

	foreach (s; extSuffixes) {
		if (res.length > s.length && res[$-s.length .. $] == s) res = res[0..$-s.length];
	}
	return res;
}


char[] typesToD(char[] str) {
	str = str.substitute(`const`, ``);
	str = str.substitute(`long`, `int`);
	str = Regex(`unsigned\s+`).replaceAll(str, `u`);
	
	str = str.substitute(`ref`, `ref_`);

	char[] wb = `(?<\W>\w|<\w>\W)`;
	str = Regex(wb~`in`~wb).replaceAll(str, `in_`);
	
	/+{
		char[] str2 = str;
		str = null;
		while (str2 != str) {
			str = str2;
			str2 = Regex(`unsigned\s+`).replaceAll(str, `u`);
			//str2 = str.sub(`unsigned\s+`, `u`);
		}
	}+/
	
	/+str = str.substitute(`ref`, `ref_`);

	{
		char[] str2 = str;
		str = null;
		while (str2 != str) {
			str = str2;
			char[] wb = `(?<\W>\w|<\w>\W)`;
			str2 = Regex(wb~`in`~wb).replaceAll(str, `in_`);
			//str2 = str.sub(`\bin\b`, `in_`);
		}
	}+/
	
	return str;
}


class Extension {
	this(char[] name, char[] extStr) {
		this.name = name;
		this.extStr = extStr;
		Trace.formatln(`Parsing extension {}`, name);
	}
	
	
	char[]		name;
	char[]		extStr;
	char[][]		deps;
	
	Decl[]		typesEnums;
	Function[]	functions;
}


struct Decl {
	char[]	name;
	char[]	data;
}


class Function {
	this(char[] retType, char[] name, char[] params) {
		this.retType = retType;
		this.name = name;
		this.params = params;
	}
	
	
	char[]	retType;
	char[]	name;
	char[]	params;
}


bool parseEnum(Extension ext, char[] line) {
	foreach (m; enumMatch.search(line)) {
		ext.typesEnums ~= Decl(transformEnumName(m.match(1)), `const GLenum ` ~ transformEnumName(m.match(1)) ~ ` = ` ~ m.match(2) ~ `;`);
		return true;
	}
	
	return false;
}


bool parseType(Extension ext, char[] line) {
	foreach (m; structPMatch.search(line)) {
		ext.typesEnums ~= Decl(m.match(2), `alias void* ` ~ m.match(2) ~ `;`);
		return true;
	}

	foreach (m; unionPMatch.search(line)) {
		ext.typesEnums ~= Decl(m.match(2), `alias void* ` ~ m.match(2) ~ `;`);
		return true;
	}

	foreach (m; structMatch.search(line)) {
		ext.typesEnums ~= Decl(m.match(2), `struct ` ~ m.match(2) ~ `{` ~ typesToD(m.match(1)) ~ `}`);
		return true;
	}

	foreach (m; unionMatch.search(line)) {
		ext.typesEnums ~= Decl(m.match(2), `union ` ~ m.match(2) ~ `{` ~ typesToD(m.match(1)) ~ `}`);
		return true;
	}

	foreach (m; structAMatch.search(line)) {
		ext.typesEnums ~= Decl(m.match(1), `struct ` ~ m.match(1) ~ `{` ~ typesToD(m.match(2)) ~ `}`);
		foreach (a; m.match(3).split(`,`)) {
			ext.typesEnums ~= Decl(m.match(1), `alias ` ~ m.match(1) ~ a ~ `;`);
		}
		return true;
	}

	foreach (m; unionAMatch.search(line)) {
		ext.typesEnums ~= Decl(m.match(1), `union ` ~ m.match(1) ~ `{` ~ typesToD(m.match(2)) ~ `}`);
		foreach (a; m.match(3).split(`,`)) {
			ext.typesEnums ~= Decl(m.match(1), `alias ` ~ m.match(1) ~ a ~ `;`);
		}
		return true;
	}

	foreach (m; typeMatch.search(line)) {
		switch (m.match(3)) {
			case `GLcharARB`:
			case `GLhandleARB`:
				break;
			default:
				ext.typesEnums ~= Decl(m.match(3), `alias ` ~ (m.match(1).length > 0 ? `u` : ``) ~ m.match(2) ~ ` ` ~ m.match(3) ~ `;`);
		}
		return true;
	}

	foreach (m; handleMatch.search(line)) {
		ext.typesEnums ~= Decl(m.match(1), `typedef HANDLE ` ~ m.match(1) ~ `;`);
		return true;
	}

	return false;
}


bool parseFunc(Extension ext, char[] line) {
	foreach (m; xfuncMatch.search(line)) {
		ext.functions ~= new Function(`void*`, m.match(1), `(GLubyte *procName)`);
		return true;
	}

	foreach (m; funcMatch.search(line)) {
		//Trace.formatln("line: '{}'", line);
		char[] params = m.match(3);
		params = params.substitute(`(void)`, `()`);
		params = params.substitute(`(VOID)`, `()`);
		ext.functions ~= new Function(m.match(1), m.match(2), typesToD(params));
		//Trace.formatln("Function({}, {}, {})", m.match(1), m.match(2), typesToD(params));
		return true;
	}
	
	return false;
}


bool parseLink(Extension ext, char[] line) {
	foreach (m; linkMatch.search(line)) {
		char[] data;
		FilePath specDir = new FilePath(`spec/`);
		FilePath specFilePath = new FilePath(specDir.toString ~ ext.name);
		if (!specDir.exists())
			specDir.createFolder();
		
		if (specFilePath.exists()) {
			data = cast(char[])File.get(specFilePath.toString);
		} else {
			for (int tries = 0; tries < 5; ++tries) {
				Trace.formatln("Fetching {}", line);
				bool ok = false;
				try {
					scope page = new HttpGet(line);
					data = cast(char[])page.read();
					ok = true;
				} catch (Object err) {
					Trace.formatln("... Failed: '{}'", err);
					continue;
				}
				if (ok) break;
			}
			
			if (data.length > 0) {
				File.set(specFilePath.toString, cast(void[])data);
			}
		}
		
		if (data.length > 0) {
			parseSpec(ext, data);
			Trace.formatln(`Spec parsed`);
		}

		return true;
	}
	
	return false;
}


void parseSpec(Extension ext, char[] data) {
	lineIter: foreach (lineI, line; splitLines(data)) {
		try {
			foreach (m; req1Match.search(line)) {
				ext.deps ~= m.match(1);
				Trace.formatln(`dependency: {}`, m.match(1));
				continue lineIter;
			}
		} catch {}

		try {
			foreach (m; req2Match.search(line)) {
				ext.deps ~= m.match(1);
				Trace.formatln(`dependency: {}`, m.match(1));
				continue lineIter;
			}
		} catch {}
	}
}


class ParseWorker {
	FilePath		filePath;
	Object			resMutex;
	Extension[]*	result;

	typeof(this) opCall(FilePath fp, Object m, Extension[]* r) {
		Trace.formatln("parseExtensions({})", fp);
		filePath = fp;
		resMutex = m;
		result = r;
		return this;
	}
	
	void work() {
		scope file = new File(filePath.toString);
		scope(exit) { file.close; }
		
		Extension ext;		
		foreach (i, line; new Lines!(char)(file)) {
			line = line.trim();
			if (0 == line.length)			continue;

			if (0 == i) {
				char[] extStr = line.dup;
				if (line.length > 3 && line[0..3] == `GL_`) {
					line = line[3..$];
					if (isdigit(line[0])) {
						line = `_` ~ line[0..$];
					}
				}
				ext = new Extension(line.dup, extStr);
			} else {
				line = line.dup;
				
				if (parseEnum(ext, line))	continue;
				if (parseType(ext, line))	continue;
				if (parseFunc(ext, line))	continue;
				if (parseLink(ext, line))	continue;
				
				Trace.formatln(`unrecognized line: {} : {}`, filePath, line);
			}
		}
		
		if (ext !is null) {
			synchronized (resMutex) {
				*result ~= ext;
			}
		}
	}
}


Extension[] parseExtensions(char[] extDir) {
	Extension[]	result;
	Object			resMutex = new Object;
	ThreadPool	threadPool = new ThreadPool(32);
	
	foreach (filePath_; (new FileScan)(extDir).files) {
		version (SingleThreaded) {
			(new ParseWorker)(filePath_, resMutex, &result).work;
		} else {
			threadPool.exec(&(new ParseWorker)(filePath_, resMutex, &result).work);
		}
	}
	
	Trace.formatln(`Joining threads...`);
	threadPool.dispose();
	Trace.formatln(`... Done`);
	
	return result;
}


void generateExt(int extI, Extension ext, Print p) {
	Trace.formatln(`Generating code for extension {}`, ext.name);

	auto fmt = &p.format;
	scope (exit) p();
	
	fmt(`module dgl.ext.{};`\n`import dgl.opengl;`\n`import dgl.glext;`\n, ext.name);	
	fmt(`
version( D_Version2 ) {{
	import std.string : containsPattern = count;
	import std.conv;
} else {{
	import tango.text.Util : containsPattern;
	import tango.stdc.stringz : fromStringz;
	alias char[] string;
}`\n\n\n\n);
	fmt(`private ushort extensionId__ = {};`\n, extI);
	fmt(`alias extensionId__ {};`\n, ext.name);
	
	foreach (dep; ext.deps) {
		fmt(`import dgl.ext.{};`\n, dep);
	}
	
	fmt(`
	version (DglNoExtSupportAsserts) {{
	} else {{
		version = DglExtSupportAsserts;
	}
	`);
	
	fmt(`
	static this() {{
		if (__extSupportCheckingFuncs.length <= extensionId__) {{
			__extSupportCheckingFuncs.length = extensionId__ + 1;
		}
		__extSupportCheckingFuncs[extensionId__] = &__supported;
	}`\n\n);

	switch (ext.name[0..3]) {
		case "GLX":
			fmt(`version (Posix) {{`\n);
			break;
		case "WGL":
			fmt(`version (Windows) {{`\n);
			break;
		default:
			fmt(`version (all) {{`\n);
	}
	
	//fmt(`template {}__(ushort extensionId__) {{`\n, ext.name);
	
	// types / enums / handles
	{
		p(\t`public {`\n);
		foreach (t; ext.typesEnums) {
			//fmt(\t\t`static if (!is(typeof(this.{0}))) {{`\n, t.name);
			p(\t\t\t)(t.data)(\n);
			//p(\t\t`}`\n);
		}
		p(\t`}`\n);
	}
	
	{
		p(\t`private {`\n);
		
		// function aliases
		{
			p(\t\t`extern (System) {`\n);
			foreach (f; ext.functions) {
				fmt(\t\t\t`alias {} function {}	fp_{};`\n, f.retType, f.params, f.name);
			}
			p(\t\t`}`\n);
		}
		
		p(\t`}`\n);
	}

	// functions
	{
		p(\t`public {`\n);
		foreach (i, f; ext.functions) {
			char[] transName = transformFuncName(f.name);
			//fmt(\t\t`static if (!is(typeof({}))) `, transName);
			p/+(`final `)+/(f.retType)(` `)(transName)(`(GL gl_, `)(`ParameterTypeTuple!(fp_`)(f.name)(`) params__) {`\n);
			fmt(\t\t\t`auto gl = _getGL(gl_);`\n);
			fmt(\t\t\t`version (DglExtSupportAsserts) assert (gl.extEnabled.length > extensionId__ && gl.extEnabled[extensionId__] > 0, extNotEnabledError);`\n);
			fmt(\t\t\t`auto funcPtr = cast(fp_{})(gl.extFuncs[extensionId__][{}]);`\n, f.name, i);
			fmt(\t\t\t`return checkedCall(gl_, "{}", funcPtr, params__);`\n, transName);
			p(\t\t)(`}`\n);
		}
		p(\t`}`\n);
	}
	
	{
		fmt(
`	private final bool __supported(GL gl_) {{
		auto gl = _getGL(gl_);
	
		if (extensionId__ < cast(int)gl.extFuncs.length && gl.extFuncs[extensionId__] !is null) {{
			return gl.extFuncs[extensionId__][0] !is null;
		}
		
		synchronized (gl) {{
			if (extensionId__ < cast(int)gl.extFuncs.length && gl.extFuncs[extensionId__] !is null) {{
				return gl.extFuncs[extensionId__][0] !is null;
			}

			if (gl.extFuncs.length <= extensionId__) {{
				gl.extFuncs.length = extensionId__ + 1;
				
				version (DglExtSupportAsserts) {{
					gl.extEnabled.length = extensionId__ + 1;
				}
			}
			gl.extFuncs[extensionId__] = loadFunctions__(gl_);
			
			return gl.extFuncs[extensionId__][0] !is null;
		}
	}
`);
	}

	// function loading
	{
		if (ext.extStr == `WGL_EXT_extensions_string`) {
		}
		else if (ext.extStr.length > 4 && ext.extStr[0..4] == `WGL_`) {
			fmt(`import dgl.ext.WGL_EXT_extensions_string : wglGetExtensionsString, WGL_EXT_extensions_string;`\n);
		}

		p(\t`private void*[] loadFunctions__(GL gl) {`\n);
		fmt(\t\t`void*[] funcAddr = new void*[{}];`\n, ext.functions.length > 0 ? ext.functions.length : 1);
		
		if (ext.extStr == `WGL_EXT_extensions_string`) {
		}
		else if (ext.extStr.length > 4 && ext.extStr[0..4] == `WGL_`) {
			fmt(
`		{{
			string extStr;
			gl.ext(WGL_EXT_extensions_string) in {{
				char* extP = wglGetExtensionsString(gl);
				version( D_Version2 ) {{
					if (extP !is null) extStr = to!(string)(extP);
				} else {{
					if (extP !is null) extStr = fromStringz(extP);
				}
			};
			if (!extStr.containsPattern("{0}")) {{ funcAddr[0] = null; return funcAddr; }
		}`\n, ext.extStr);
		} else if (!ext.extStr.containsPattern("GL_VERSION_")) {
			fmt(
`		{{
			char* extP = gl.GetString(GL_EXTENSIONS);
			version( D_Version2 ) {{
				string extStr = extP is null ? null : to!(string)(extP);
			} else {{
				string extStr = extP is null ? null : fromStringz(extP);
			}
			if (!extStr.containsPattern("{0}")) {{ funcAddr[0] = null; return funcAddr; }
		}`\n, ext.extStr);
		} else {
			fmt(
`		{{
			if (!isOpenGLVersionSupported("{0}", '_')) {{ funcAddr[0] = null; return funcAddr; }
		}`\n, ext.extStr["GL_VERSION_".length .. $]);
		}
		
		if (0 == ext.functions.length) {
			fmt(\t\t`funcAddr[0] = cast(void*)&gl;`\n);
		} else {
			foreach (i, f; ext.functions) {
				fmt(\t\t`if (null is (funcAddr[{}] = getExtensionFuncPtr(cast(char*)"{}"))) {{ funcAddr[0] = null; return funcAddr; }`\n, i, f.name);
			}
		}
		
		p(\t\t`return funcAddr;`\n);
		p(\t`}`\n);
	}

	fmt(`}`\n\n\n);
		fmt(
`	else {{
		private final bool __supported(GL gl_) {{
			return false;
		}
	}
`);
}


void main() {
	/+Extension[]	result;
	Object			resMutex = new Object;
	(new ParseWorker)(new FilePath("extensions/WGL_ARB_extensions_string"), resMutex, &result).work;
	return;+/

	auto extList = parseExtensions(`extensions`) ~ parseExtensions(`core`);
	
	foreach (extI, ext; extList) {
		for (int i = 0; i < ext.deps.length; null) {
			char[] dep = ext.deps[i];
			bool found = false;
			foreach (e; extList) {
				if (e.name == dep) {
					found = true;
					break;
				}
			}
			
			if (found) {
				for (int j = i+1; j < ext.deps.length; ++j) {
					if (ext.deps[j] == ext.deps[i]) {
						found = false;
						break;
					}
				}
			}
			
			if (found) {
				++i;
			} else {
				ext.deps[i] = ext.deps[$-1];
				ext.deps.length = ext.deps.length - 1;
			}
		}
		
		scope file = new File(`../ext/` ~ ext.name ~ `.d`, File.WriteCreate);
		scope(exit) { file.close; }
		
		generateExt(extI, ext, new Print(new Layout!(char), file));
	}
}
