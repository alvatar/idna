module zomg;
import std.stdio;
int beginFuncs;
void function(int) someFunc;
void function(int) someFunc2;
void function(int) someFunc3;
int endFuncs;

string toStr(int i) {
	string res;
	do {
		res = cast(char)((i % 10) + '0') ~ res;
		i /= 10;
	} while (i != 0);
	return res;
}

int codegenFrom(string aggr)() {
	mixin(`foreach (i, m; `~aggr~`)
			if ("beginFuncs" == m)
			return i+1;
			`);
}
int codegenTo(string aggr)() {
	mixin(`foreach (i, m; `~aggr~`)
			if ("endFuncs" == m)
			return i;
			`);
}
string codegen(string aggr)() {
	string result;
	enum cdFrom = codegenFrom!aggr;
	mixin (`enum int from = `~cdFrom.stringof~";");
	enum cdTo = codegenTo!aggr;
	mixin (`enum int to = `~cdTo.stringof~";");
	for (int i = from; i < to; ++i) {
		result ~=
			`writeln("TODO: insert code to dynamically load funcptr for " ~ `~aggr~`[`~toStr(i)~`]);`;
	}
	return result;
}

void main() {
	enum string code = codegen!"__traits(allMembers, zomg)";
	//    writeln(code);
	mixin(code);
}
