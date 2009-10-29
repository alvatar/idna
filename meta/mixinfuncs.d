/*******************************************************************************

	copyright:      Copyright (c) 2008 Matthias Walter. All rights reserved

    authors:        Matthias Walter

*******************************************************************************/

module meta.mixinfuncs;

/**
 * Escape any quotes and backslashes inside the given string,
 * prefixing them with the given escape sequence. Use `\` to escape
 * once, `\\\` to escape twice.
 * Params:
 * 		instr = given string 
 * 		escape = escape character
 * Returns:
 * 		enquoted string
 * Authors:
 * 		Don Clugston
 */

public string enquote (string instr, string escape = `\`)
{
	for (int i = 0; i < instr.length; ++i)
	{
		if (instr[i] == '"' || instr[i] == '\\')
		{
			string str = instr[0..i] ~ escape;
			int m = i;
			foreach (int k, char c; instr[i+1..$])
			{
				if (c == '"' || c == '\\')
				{
					str ~= instr[m..i+1+k] ~ escape;
					m = i+k+1;
				}
			}
			return str ~ instr[m..$];
		}
	}
	return instr;
}
