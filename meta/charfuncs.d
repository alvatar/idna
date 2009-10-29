/*******************************************************************************

	copyright:      Copyright (c) 2008 Matthias Walter. All rights reserved

    authors:        Matthias Walter

*******************************************************************************/

module meta.charfuncs;

/++ Returns true if the given char is an alpha char +/
pure bool isAlphaChar (char c)
{
	return (c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z');
}

/++ Returns true if the given char is an alpha-numeric char +/
pure bool isAlphaNumericChar (char c)
{
	return (c >= '0' && c <= '9') || (c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z');
}

/++ Returns true if the given char is a control char +/
pure bool isControlChar (char c)
{
	return c < 0x20 || c == 0x7f;
}

/++ Returns true if the given char is a decimal digit +/
pure bool isDecDigit (char c)
{
	return c >= '0' && c <= '9';
}

/++ Returns true if the given char is a hexadecimal digit +/
pure bool isHexDigit (char c)
{
	return (c >= '0' && c <= '9') || (c >= 'A' && c <= 'F') || (c >= 'a' && c <= 'f');
}

/++ Returns true if the given char is whitespace +/
pure bool isSpace (char c)
{
	return (c == ' ') || (c>=0xA && c<=0xD);
}

/++ Returns true if the given char is an upper-case alpha char +/
pure bool isUpperChar (char c)
{
	return (c >= 'A' && c <= 'Z');
}

/++ Returns true if the given char is a lower-case alpha char +/
pure bool isLowerChar (char c)
{
	return (c >= 'a' && c <= 'z');
}

/++ Returns true if the given char is a punctuation char +/
pure bool isPunctuationChar (char c)
{
	return c > ' ' && c < 0x7f && !isAlphaNumericChar (c);
}

/++ Returns true if the given char is a printable char +/
pure bool isPrintableChar (char c)
{
	return c > ' ' && c < 0x7f;
}

/++ Returns true if the given char is an ASCII char +/
pure bool isAsciiChar (char c)
{
	return c <= 0x7f;
}

/++
 + If the given char is lower-case, returns the corresponding upper case one.
 + Else return the given char
 +/
pure char toUpperChar (char c)
{
	if (isLowerChar (c))
		return cast(char)(c + 'A' - 'a');
	else
		return c;
}

/++
 + If the given char is upper-case, returns the corresponding lower case one.
 + Else return the given char
 +/
pure char toLowerChar (char c)
{
	if (isUpperChar (c))
		return cast(char)(c + 'a' - 'A');
	else
		return c;
}

/++ Converts a given hexadecimal digit to its integer value +/
pure long hexDigitToInt (char c)
{
	if (c >= '0' && c <= '9')
		return c - '0';
	else if (c >= 'A' && c <= 'F')
		return c - 'A' + 10;
	else if (c >= 'a' && c <= 'f')
		return c - 'a' + 10;
	else
		return -1;
}

/++ Converts a given decimal digit to its integer value +/
pure long decDigitToInt (char c)
{
	if (c >= '0' && c <= '9')
		return c - '0';
	else
		return -1;
}

/++ Converts a given integer to its hexadecimal digit +/
pure char intToHexDigit (long i)
{
	assert (i >= 0 && i < 16);

	if (i >= 0 && i < 10)
		return cast(char)('0' + i);
	else if (i >= 10 && i < 16)
		return cast(char)('A' + i - 10);
	else
		return ' ';
}

/++ Converts a given integer to its decimal digit +/
pure char intToDecDigit (long i)
{
	assert (i >= 0 && i < 10);

	if (i >= 0 && i < 10)
		return cast(char)('0' + i);
	else
		return ' ';
}

/++ Strips a decimal digit from a given string and returns it +/
pure string consumeDecDigit (string s)
{
	if (s.length > 0 && isDecDigit (s[0]))
		return s[1..$];
	else
		return s;
}

/++ Strips a hexadecimal digit from a given string and returns it +/
pure string consumeHexDigit (string s)
{
	if (s.length > 0 && isHexDigit (s[0]))
		return s[1..$];
	else
		return s;
}

unittest
{
	static assert (hexDigitToInt ('a') == 10);
	static assert (decDigitToInt ('a') == -1);
	static assert (hexDigitToInt ('5') == 5);
	static assert (decDigitToInt ('5') == 5);
}
