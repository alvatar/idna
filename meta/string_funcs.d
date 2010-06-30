/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Copyright:      Copyright (c) 2008 Matthias Walter. All rights reserved
 + Copyright (c) 2010 by Álvaro Castro-Castilla, All Rights Reserved.
 + Licensed under the MIT/X11 license, see LICENSE file for full description
 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/

module meta.string_funcs;

import meta.char_funcs;

/++
 + Changes case of string to upper
 +/
pure string toLower(string s) {
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

/++
 + Changes case of string to upper
 +/
pure string toUpper(string s) {
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

/++
 + Strips the given character from the end of the string, until not possible anymore
 +/
pure T[] chomp (T) (T[] str, T c) {
	int last = str.length-1;
	while (last >= 0 && str[last] == c)
		last--;
	return str[0 .. last+1];
}

/++
 + Returns the given string repeated multiple times
 +/
pure T[] repeat (T) (T[] str, uint times) {
	if (times == 0)
		return [];
	else if (times == 1)
		return str;
	else
		return repeat !(T) (str, times-1) ~ str;
}

/++
 + Returns true, if the given string starts with the given substring
 +/
pure bool startsWith (T) (T[] str, T[] sub) {
	return sub.length <= str.length && sub == str[0 .. sub.length];
}

/++
 + Returns true, if the given string is empty
 +/
pure bool isEmpty (T) (T[] str) {
	return str.length == 0;
}

/++
 + Returns true, if the given string contains the given character
 +/
pure bool contains (T) (T[] str, T c) {
	return cfind !(T) (str, c) >= 0;
}

/++
 + Returns the left-most position of the given character in the given string,
 + or -1 if the character is not found
 +/
pure int cfind (T) (T[] str, T c) {
	foreach (i, s; str) {
		if (s == c) return i;
	}
	return -1;
}

/++
 + Returns the right-most position of the given character in the given string,
 + or -1 if the character is not found
 +/
pure int rcfind (T) (T[] str, T c) {
	foreach_reverse (i, s; str) {
		if (s == c) return i;
	}
	return -1;
}

/++
 + Returns the left-most position of the given substring in the given string,
 + or -1 if the substring is not found
 +/
pure int find (T) (T[] str, T sub[]) {
	// TODO: choose a better algorithm, but how to manage the temporary table with bug #1382
	for (int i = 0; i < str.length - sub.length+1; i++) {
		bool flag = true;
		foreach (j, c; sub) {
			if (str[i+j] != c) {
				flag = false;
				break;
			}
		}
		if (flag) return i;
	}
	return -1;
}

/++
 + Returns the right-most position of the given substring in the given string,
 + or -1 if the substring is not found
 +/
pure int rfind (T) (T[] str, T sub[]) {
	// TODO: choose a better algorithm, but how to manage the temporary table with bug #1382
	for (int i = str.length-sub.length; i>=0; i--) {
		bool flag = true;
		foreach (j, c; sub) {
			if (str[i+j] != c) {
				flag = false;
				break;
			}
		}
		if (flag) return i;
	}
	return -1;
}

/++ Returns a string replacing a substring by another +/
pure string replace( string _source, string subfrom, string subto ) {
	int i = 0;
	string source = _source;
	string res;
	if( source.length < subfrom.length )
		return source;
	while(i <= source.length - subfrom.length) {
		if (source[i .. i+subfrom.length] == subfrom) {
			res ~= source[0 .. i];
			res ~= subto;
			source = source[i + subfrom.length .. $];
			// TODO: REVIEW: No debería comenzar desde i la próxima vez sin reiniciar??
			i = 0;
		} else {
			i++;
		}
		if (source.length < subfrom.length)
			break;
	}
	res ~= source;
	return res;
}


/++
 + Removes the characters from the left of the given string,
 + as long as they are in the given set of characters
 +/
pure public static string ltrim (string str, string chars) {
	foreach (i, c; str) {
		bool match = false;
		foreach (t; chars) {
			if (c == t) {
				match = true;
				break;
			}
		}
		if (!match) {
			return str[i .. $];
		}
	}
	return [];
}

/++
 + Removes the left-most element from a given array and returns it
 +/
pure public static T lremove (T) (ref T[] array) {
	assert (array.length > 0);

	T result = array[0];
	array = array[1 .. $];
	return result;
}

/++ 
 + Removes a given amount of left-most elements from a given array and returns them
 +/
pure public static T[] lremove (T) (ref T[] array, uint amount) {
	assert (amount <= array.length);

	T[] result = array[0 .. amount];
	array = array[amount .. $];
	return result;
}

/++
 + Joins an array of strings to one, putting a given split-string between each of them
 +/
pure public static T[] join (T) (T[] split, T[][] array) {
	T[] result;
	foreach (i, a; array) {
		if (i > 0)
			result ~= split ~ a;
		else
			result = a;
	}
	return result;
}

pure string hexToString8 (string hex) {
	if (hex.length < 2)
		return "";
	return cast (char) (hexDigitToInt(hex[0]) * 16 + hexDigitToInt(hex[1])) ~ hexToString8(hex[2..$]);
}

pure wstring hexToString16 (string hex) {
	if (hex.length < 4)
		return "";
	return cast (wchar) (
			hexDigitToInt(hex[0]) * 4096 + 
			hexDigitToInt(hex[1]) * 256 +
			hexDigitToInt(hex[2]) * 16 + 
			hexDigitToInt(hex[3])
			) ~ hexToString16 (hex[4..$]);
}

pure dstring hexToString32 (string hex) {
	if (hex.length < 8)
		return "";
	return cast (dchar) (
			hexDigitToInt(hex[0]) * 268435456 + 
			hexDigitToInt(hex[1]) * 16777216 +
			hexDigitToInt(hex[2]) * 1048576 + 
			hexDigitToInt(hex[3]) * 65536+
			hexDigitToInt(hex[4]) * 4096 + 
			hexDigitToInt(hex[5]) * 256 +
			hexDigitToInt(hex[6]) * 16 + 
			hexDigitToInt(hex[7])
			) ~ hexToString32 (hex[8..$]);
}

unittest {
	//TODO!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	//static assert (chomp ("abcxx", 'x') == "abc");
	//static assert (chomp ("abcxy", 'x') == "abcxy");
	static assert (repeat ("abc", 3u) == "abcabcabc");
	static assert (startsWith ("abc", "ab"));
	static assert (!startsWith ("abc", "bc"));
	static assert (!startsWith ("abc", "abcd"));
	static assert (isEmpty (""));
	static assert (isEmpty ([]));
	static assert (!isEmpty ("a"));
	//static assert (contains ("abc", 'b'));
	//static assert (!contains ("abc", 'd'));
	//static assert (cfind ("abc", 'b') == 1);
	//static assert (cfind ("abc", 'd') == -1);
	//static assert (rcfind ("abcbc", 'c') == 4);
	//static assert (rcfind ("abcbc", 'd') == -1);
	static assert (find ("abcdefcdef", "cd") == 2);
	static assert (rfind ("abcdefcdef", "cd") == 6);
	static assert (find ("abcdefcdef", "cdf") == -1);
}
