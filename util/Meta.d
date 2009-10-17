module util.Meta;

version( D_Version2 ) {
	import std.traits;
	import std.typetuple;
} else {
	import tango.core.Traits;
	import tango.core.Tuple;
	alias char[] string;
}

char toLower(char c) {
	if (c >= 'A' && c <= 'Z'){
		return (cast(char)(c + ('a' - 'A')));
	} else {
		return c;
	}
}

char toUpper(char c) {
	if (c >= 'a' && c <= 'z'){
		return cast(char)(c + ('A' - 'a'));
	} else {
		return c;
	}
}


string toLower(string s) {
	string r;
	foreach (c; s) {
		if (c >= 'A' && c <= 'Z'){
			r ~= cast(char)((c + ('a' - 'A')));
		} else {
			r ~= c;
		}
	}
	return r;
}

string toUpper(string s) {
	string r;
	foreach(c; s) {
		if (c >= 'a' && c <= 'z'){
			r ~= cast(char)(c + ('A' - 'a'));
		} else {
			r ~= c;
		}
	}
	return r;
}
		

private string genPrivAndProp(string a){
	string buf1;
	int i;
	int count=0;
	
	for(i=0;i<a.length;++i){
		if(a[i]==' '){
			count++;
			buf1=a[0..i];
			i++;
			break;
		}
	}
	
	string buf2;
	int j;
	for(j=i;j<a.length;++j){
		if(a[j]==' '){
			count++;
			buf2=a[i..j];
			j++;
			break;
		}
	}
	
	string buf3;	
		
	if(j==a.length){
		count++;
		buf2=a[i..j];
	} else {
		count++;
		buf3=a[j..a.length];
	}
	
	
	bool setter=true, getter=true;
	
	if(count==3){
		if(buf1 == "inout") { 
			setter=getter=true; 
		} else if(buf1 == "out"){ 	
			getter=true; 
			setter=false;
		} else if(buf1 == "in") {	
				getter=false; 
				setter=true;
			}
		buf1=buf2;
		buf2=buf3;
	}
	
	string r;
	
	r ~= "private " ~ buf1 ~ " _" ~ buf2 ~ ";\n\n";
	
	
	if(getter){
		r~= buf1 ~ " " ~ buf2 ~ "(){\n";
		r~="return _" ~ buf2 ~ ";\n";
		r~="}\n\n";
	}
	
	if(setter){
		r~= "void " ~ buf2 ~ " (" ~ buf1 ~ " __val){\n";
		r~= "this._" ~ buf2~ "= __val;\n";
		r~="}\n\n";
	}
	
	return r;
}

public string createPrivAndProp(string a){
	string r;
	int last=0;
	foreach(ln, c; a){
		if(c==','){
			r~=genPrivAndProp(a[last..ln]);
			last=ln+1;
		}
	}
	r~=genPrivAndProp(a[last..a.length]);
	return r;
}

static assert (toLower('A')=='a');
static assert (toLower('b')=='b');
static assert (toLower('.')=='.');
static assert (toLower("aba")== "aba");
static assert (toLower("ABa")== "aba");



// ----------------------------------------------------------------------------------------------------------------
// autoOverride / resolveAutoOverride


void	FuncArgType_(Ret)			(Ret function())			{}
T0	FuncArgType_(Ret, T0)		(Ret function(T0))		{ return T0.init; }
T0	FuncArgRefType_(Ret, T0)	(Ret function(ref T0))	{ return T0.init; }

template FuncArgType(T) {
	alias typeof(FuncArgType_(T.init)) FuncArgType;
}
template FuncArgRefType(T) {
	alias typeof(FuncArgRefType_(T.init)) FuncArgRefType;
}

//version  =DebugAutoOverride;

template autoOverride(string _fname, string _paramName = "") {
	private import xf.utils.Meta : FuncArgType, FuncArgRefType;
	private alias typeof(this) ThisType;

	struct _AutoOverride {
		static if (_paramName.length > 0) {
			version (DebugAutoOverride) pragma (msg, `ok, using a custom param name`);
			//private const string _param = _paramName;
			mixin ("alias " ~ _paramName ~ " argType;");
		} else {
			version (DebugAutoOverride) pragma (msg, `no custom param name. trying to guess`);
			static if (
				mixin("is(FuncArgType!(typeof(&"~ _fname ~")) ParamType)")
				|| mixin("is(FuncArgRefType!(typeof(&"~ _fname ~")) ParamType)")
			) {
				static if (!is(ParamType == void)) {
					version (DebugAutoOverride) pragma (msg, `guessing the param to be ` ~ ParamType.stringof);
					private static ParamType _paramValInst;
					private const string _paramVal = `_paramValInst`;
				} else {
					version (DebugAutoOverride) pragma (msg, `guessing the param to be void`);
					private const string _paramVal = ``;
				}
				
				version (DebugAutoOverride) pragma (msg, "func param val: '" ~ _paramVal ~ "'");
				
				static if (mixin("is(ThisType : typeof("~_fname~"("~_paramVal~")))")) {
					version (DebugAutoOverride) pragma (msg, `func returns typeof(this)`);
					//private const string _param = ParamType.stringof;
					alias ParamType argType;
				} else {
					mixin("private alias typeof("~_fname~"("~_paramVal~")) FuncRetVal;");
					version (DebugAutoOverride) pragma (msg, `func doesnt return typeof(this), but ` ~ FuncRetVal.stringof);
					
					private static FuncRetVal _funcRetVal;
					static if (is(typeof(mixin(_fname~"(_funcRetVal)")))) {
						version (DebugAutoOverride) pragma (msg, "func appears to have a setter too");
						static if (mixin("is(ThisType : typeof("~_fname~"(_funcRetVal)))")) {
							version (DebugAutoOverride) pragma (msg, "great! the setter returns typeof(this)");
							//private const string _param = FuncRetVal.stringof;
							alias FuncRetVal argType;
						} else {
							version (DebugAutoOverride) pragma (msg, "bummer, the setter doesn't return typeof(this)");
						}
					} else {
						version (DebugAutoOverride) pragma (msg, "func doesn't seem to have a setter");
					}
				}
			}
		}
		
		static if (is(argType)) {
			static if (is(argType == void)) {
				const bool argRef = false;
			} else {
				version (DebugAutoOverride) pragma (msg, "the func has a " ~ argType.stringof ~ " param");
				
				static if (mixin("is(typeof("~_fname~"(argType.init)))")) {
					version (DebugAutoOverride) pragma (msg, "the param is passed by value");
					const bool argRef = false;
				} else {
					private static argType _paramValInst2;
					static if (mixin("is(typeof("~_fname~"(_paramValInst2)))")) {
						version (DebugAutoOverride) pragma (msg, "the param is passed by reference");
						const bool argRef = true;
					} else {
						static assert (false, _fname);
					}
				}
			}
		} else {
			version (DebugAutoOverride) pragma (msg, "damn, something went wrong. could not deduce the param type");
		}
		
		const string	_AutoOverride_fname = _fname;
	}
	
	_AutoOverride _autoOverride;
}


string resolveAutoOverrideCodegen(string thisType, T ...)() {
	string res = "";
	foreach (Field; T) {
		static if (is(typeof(Field._AutoOverride_fname) == string)) {
			const string fname = Field._AutoOverride_fname;

			/+static if (is(void == Field.argType)) {
				static if (mixin("is("~fname~"() : "~thisType~")")) {
					res ~= "pragma(msg, `* skipping override generation for "~fname~"`)";
					res ~= "static if (false) {";
				} else {
					res ~= "static if (true) {";
				}
			} else {
				mixin("alias typeof(this.init."~fname~"(("~Field.argType.stringof~").init)) zomg;");
				static if (mixin("is(typeof("~fname~"(("~Field.argType.stringof~").init)) : "~thisType~")")) {
					res ~= "pragma(msg, `* skipping override generation for "~fname~"`)";
					res ~= "static if (false) {";
				} else {
					res ~= "static if (true) {";
				}
			}+/
			
			version (DebugAutoOverride) pragma (msg, "generating an override for " ~ fname ~ " in " ~ thisType);
			
			static if (is(void == Field.argType)) {
				version (DebugAutoOverride) pragma (msg, "parameter-less func");
				res ~= "override " ~ thisType ~ " " ~ fname ~ "(){";
				res ~= "if (auto res=super." ~ fname ~ "()){if(auto res2=cast(typeof(this))res){return res2;}";
	//			res ~= "return this; }";
			} else {
				static if (Field.argRef) {
					version (DebugAutoOverride) pragma (msg, "ref-param func");
					res ~= "override " ~ thisType ~ " " ~ fname ~ "(ref "~Field.argType.stringof~" _arg){";
					res ~= "if (auto res=super." ~ fname ~ "(_arg)){if(auto res2=cast(typeof(this))res){return res2;}";
//				res ~= "return this; }";
				} else {
					version (DebugAutoOverride) pragma (msg, "value-param func");
					res ~= "override " ~ thisType ~ " " ~ fname ~ "("~Field.argType.stringof~" _arg){";
					res ~= "if (auto res=super." ~ fname ~ "(_arg)){if(auto res2=cast(typeof(this))res){return res2;}";
					//res ~= "return this; }";

				}
			}

			res ~= "else{assert(false, `autoOverride for function '"~fname~"': The result is not typeof(this)`);}}else return null;}";

			res ~= "static if (!is(typeof(this)._SuperType)) private alias typeof(super) _SuperType;";
			res ~= `alias _SuperType.`~fname~` `~fname~`;`;
			
			//res ~= "}";
		}
		res ~= "\n";
	}
	return res;
}


template resolveAutoOverride(ThisType, T) {
	static if (!is(T == Object)) {
		version (DebugAutoOverride) pragma (msg, "resolveAutoOverride " ~ T.stringof);
		static if (is(typeof(T.autoOverrideFlush_data) FlushData)) {
			version (DebugAutoOverride) pragma (msg, FlushData.TypeOfThis.stringof ~ " vs " ~ T.stringof);
			static if (is(FlushData.TypeOfThis == T)) {
				version (DebugAutoOverride) pragma(msg, `resolveAutoOverrideCodegen for ` ~ T.stringof);
				const string part = resolveAutoOverrideCodegen!(ThisType.stringof, FlushData.TypeTupleOf)();
			} else {
				const string part = "";
			}
		} else {
			const string part = "";
		}

		static if (is(T S == super)) {
			const string res = part ~ resolveAutoOverride!(ThisType, S[0]).res;
		} else {
			const string res = part;
		}
	} else {
		const string res = "";
	}
}


template resolveAutoOverride() {
	mixin(resolveAutoOverride!(typeof(this), typeof(this)).res);
	version (DebugAutoOverride) pragma (msg, "");
}


template autoOverrideFlush() {
	struct _AutoOverrideFlush(ThisType) {
		alias typeof(ThisType.tupleof)	TypeTupleOf;
		alias ThisType						TypeOfThis;
	}
	static _AutoOverrideFlush!(typeof(this)) autoOverrideFlush_data;
}


// From scrapple.tools

template isArray(T) { const bool isArray=false; }
template isArray(T: T[]) { const bool isArray=true; }

template isPointer(T) { const bool isPointer=false; }
template isPointer(T: T*) { const bool isPointer=true; }

string fmtLong(long l) {
  if (l<0) return "-"~fmtLong(-l);
  string res;
  do {
    res = "0123456789"[cast(int)(l%10)] ~ res;
    l /= 10;
  } while (l);
  return res;
}

string fmtReal(real r) {
  if (r != r) return "NaN";
  if (r > real.max) return "Inf";
  if (r<0) return "-"~fmtReal(-r);
  string res;
  auto rest = r - cast(long) r;
  for (int i=0; i<10; ++i) {
    rest *= 10;
    if (!(rest>=0 && rest<10)) return "ERROR";
    res ~= "0123456789"[cast(int) rest];
    rest -= cast(int) rest;
  }
  while (res.length && res[$-1] == 0) res = res[0..$-1];
  return fmtLong(cast(long) r) ~ "." ~ res;
}


string Format(T...)(T t) {
	string res;
	foreach (i, elem; t) {
		alias typeof(elem) E;
		static if (is(E: string)) res ~= elem; else
			//static if (isPointer!(E)) res ~= fmtPointer(cast(void*) elem); else
				static if (isArray!(E)) {
					res ~= "[";
					foreach (i2, v; elem) {
						res ~= Format(v);
						if (i2 < elem.length - 1) res ~= ", ";
					}
					res ~= "] ";
				} else static if (is(typeof(elem.keys))) {
						res ~= "[";
						bool first=true;
						foreach (key, value; elem) {
							if (first) first=false;
							else res ~= ", ";
							res ~= Format(key, ": ", value);
						}
						res ~= "] ";
					} else static if (is(typeof(elem.toString()): string)) {
							res ~= elem.toString();
						} else static if (is(E: long)) res ~= fmtLong(elem); else
								static if (is(E: real)) res ~= fmtReal(elem); else
									res ~= "[Unsupported: "~E.stringof~"] ";
	}
	return res;
}

template Unstatic(T) { alias T Unstatic; }
template Unstatic(T: T[]) { alias T[] Unstatic; }

template StupleMembers(T...) {
	static if (T.length) {
		const int id=T[0..$-1].length;
		const string str=StupleMembers!(T[0..$-1]).str~"Unstatic!(T["~id.stringof~"]) _"~id.stringof~"; ";
	} else const string str="";
}

struct Stuple(T...) {
	alias Tuple!() StupleMarker;
	mixin(StupleMembers!(T).str);
	string toString() {
		string res="stuple(";
		foreach (id, entry; this.tupleof) {
			if (id) res ~= ", ";
			res ~= Format(entry);
		}
		return res~")";
	}
	
	
	Ret opShr(Ret, Par ...)(Ret delegate(Par) dg) {
		return dg(this.tupleof);
	}
	
	Ret opShr(Ret, Par ...)(Ret function(Par) dg) {
		return dg(this.tupleof);
	}
}


template UnstaticAll(T ...) {
	static if (T.length > 1) {
		alias Tuple!(UnstaticAll!(T[0..$-1]), Unstatic!(T[$-1])) UnstaticAll;
	} else {
		alias Unstatic!(T[0]) UnstaticAll;
	}
}


Stuple!(UnstaticAll!(T)) stuple(T ...)(T t) {
	return Stuple!(UnstaticAll!(T))(t);
}


template Repeat(T, int count) {
	static if (!count) alias Tuple!() Repeat;
	else alias Tuple!(T, Repeat!(T, count-1)) Repeat;
}

Stuple!(Repeat!(T, U.length)) toTStuple(T, U...)(U u) {
	Stuple!(Repeat!(T, U.length)) res = void;
	foreach (i, v; u)
		res.tupleof[i] = cast(T) v;
	return res;
}


struct ApplyEachProxy(Arg, string sc=``) {
	Arg[] args;
	
	
	void opShr(Ret, Par ...)(Ret delegate(Par) dg) {
		static if (1 == Par.length) {
			foreach (a; args) {
				mixin(`dg(a` ~ sc ~ `);`);
			}
		} else {
			foreach (a; args) {
				mixin(`dg(a` ~ sc ~ `.tupleof);`);
			}
		}
	}
	
	ApplyEachProxy!(Arg, sc~`.`~mname) member(string mname)() {
		return ApplyEachProxy!(Arg, sc~`.`~mname)(this.args);
	}
}



/**
	---
	applyEach(input.params).member!(`semantic`) >> (string name, int idx) {
	}
	---
*/
ApplyEachProxy!(Arg) applyEach(Arg)(Arg[] args) {
	return ApplyEachProxy!(Arg)(args);
}



string cttoString(uint i) {
	string res;
	do {
		res = "0123456789"[i % 10] ~ res;
		i /= 10;
	} while (i > 0);
	return res;
}


private string indexedItemsString(string thingyName, int num) {
	string res;
	for (int i = 0; i < num; ++i) {
		if (i > 0) res ~= `,`;
		res ~= thingyName ~ `[` ~ cttoString(i) ~ `]`;
	}
	return res;
}


struct EachMemberProxy(string mname, Iterable) {
	Iterable it;
	
	static if (is(typeof(it.opApply))) {
		static assert (false, `TODO`);
	} else {
		mixin(`alias typeof(Iterable.init[0].` ~ mname ~ `) IterType;`);
	}
	alias typeof(IterType.tupleof) IterTypeTupleOf;

	mixin(`int opApply(int delegate(` ~ indexedItemsString(`ref IterTypeTupleOf`, IterTypeTupleOf.length) ~ `) dg) {
		foreach (ref i; it) {
			if (auto r = dg(i.`~mname~`.tupleof)) return r;
		}
		return 0;
	}`);
}



/**
	---
	foreach (name, idx; eachMember!(`semantic`)(input.params)) {
		
	}
	---
*/
template eachMember(string mname) {
	EachMemberProxy!(mname, Iterable) eachMember(Iterable)(Iterable it) {
		return EachMemberProxy!(mname, Iterable)(it);
	}
}


// ----------------------------------------------------------------------------------------------------------------
// delegate to function conversion without extra allocations


///
Ret delegate(Par) functionToDelegate(Ret, Par ...)(Ret function(Par) func) {
	struct Foo {
		void* _placeholder;
		static assert (Foo.sizeof == typeof(func).sizeof);
		Ret wrapper(Par p) {
			return (cast(Ret function(Par))this)(p);
		}
	}
	return &(cast(Foo*)cast(void*)func).wrapper;
}



// ----------------------------------------------------------------------------------------------------------------


template createFructIteratorImpl(string name) {
	mixin("alias ParameterTupleOf!(this._"~name~") _Params;");
	alias typeof(this) _ThisType;
	
	static int function(_Params) _getIterFunc() {
		return mixin("&_ThisType._" ~ name);
	}
	
	struct _Fruct {
		_ThisType				_this;
		_Params[0..$-1]	params;

		int opApply(_Params[$-1] dg) {
			int delegate(_Params) handler;
			handler.funcptr = _getIterFunc;
			handler.ptr = cast(void*)_this;
			return handler(params, dg);
		}
	}
}


/**
	Example:
	---
	private int _edgeHedges(HEdge* first, int delegate(ref HEdge*) dg) {
		HEdge* foo;
		dg(foo);
		dg(foo);
		return 0;
	}
	mixin createFructIterator!(`edgeHedges`);
	---
*/
template createFructIterator(string name) {
	private {
		import tango.core.Traits : ParameterTupleOf;
		import xf.utils.Meta : createFructIteratorImpl;
		
		mixin(`
			static if (!is(typeof(this._`~name~`))) {
				static assert (false, "class `~typeof(this).stringof~` does not contain a function _`~name~` required for the fruct");
			} else {
				mixin createFructIteratorImpl!(name);
			}
		`);
	}

	mixin(`_Fruct `~name~`(_Params[0..$-1] params) {
		return _Fruct(this, params);
	}`);
}
