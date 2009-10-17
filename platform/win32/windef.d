/***********************************************************************\
*                                windef.d                               *
*                                                                       *
*                       Windows API header module                       *
*                                                                       *
*                 Translated from MinGW Windows headers                 *
*                           by Stewart Gordon                           *
*                                                                       *
*                       Placed into public domain                       *
\***********************************************************************/
module platform.win32.windef;

import platform.win32.w32api;

const size_t MAX_PATH = 260;

ushort MAKEWORD(ubyte a, ubyte b) {
	return cast(ushort) ((b << 8) | a);
}

uint MAKELONG(ushort a, ushort b) {
	return cast(uint) ((b << 16) | a);
}

ushort LOWORD(uint l) {
	return cast(ushort) l;
}

ushort HIWORD(uint l) {
	return cast(ushort) (l >>> 16);
}

ubyte LOBYTE(ushort w) {
	return cast(ubyte) w;
}

ubyte HIBYTE(ushort w) {
	return cast(ubyte) (w >>> 8);
}

template max(T) {
	T max(T a, T b) {
		return a > b ? a : b;
	}
}

template min(T) {
	T min(T a, T b) {
		return a < b ? a : b;
	}
}

typedef void* HANDLE;


alias void VOID;
alias char CHAR;
alias short SHORT;
alias char CCHAR;
alias CCHAR* PCCHAR;
alias ubyte UCHAR;
alias UCHAR* PUCHAR;
alias char* PSZ;
alias void* PVOID, LPVOID;

/* FIXME(MinGW) for __WIN64 */
alias void* PVOID64;

alias wchar WCHAR;
alias WCHAR* PWCHAR, LPWCH, PWCH, LPWSTR, PWSTR;
alias CHAR* PCHAR, LPCH, PCH, LPSTR, PSTR;

// const versions
alias WCHAR* LPCWCH, PCWCH, LPCWSTR, PCWSTR;
alias CHAR* LPCCH, PCSTR, LPCSTR;

version(Unicode) {
	alias WCHAR TCHAR, _TCHAR;
} else {
	alias CHAR TCHAR, _TCHAR;
}

alias TCHAR TBYTE;
alias TCHAR* PTCH, PTBYTE, LPTCH, PTSTR, LPTSTR, LP, PTCHAR, LPCTSTR;

alias SHORT* PSHORT;
alias LONG* PLONG;


alias HANDLE* PHANDLE, LPHANDLE;
alias DWORD LCID;
alias PDWORD PLCID;
alias WORD LANGID;

alias long LONGLONG;
alias ulong DWORDLONG;

alias DWORDLONG ULONGLONG;
alias LONGLONG* PLONGLONG;
alias DWORDLONG* PDWORDLONG, PULONGLONG;
alias LONGLONG USN;

const char ANSI_NULL = '\0';
const wchar UNICODE_NULL = '\0';
alias bool BOOLEAN;
alias bool* PBOOLEAN;

alias BYTE FCHAR;
alias WORD FSHORT;
alias DWORD FLONG;

alias ubyte   BYTE;
alias ubyte*  PBYTE, LPBYTE;
alias ushort  USHORT, WORD, ATOM;
alias ushort* PUSHORT, PWORD, LPWORD;
alias uint    ULONG, DWORD, UINT, COLORREF;
alias uint*   PULONG, PDWORD, LPDWORD, PUINT, LPUINT;
alias int     WINBOOL, BOOL, INT, LONG, HFILE;
alias int*    PWINBOOL, LPWINBOOL, PBOOL, LPBOOL, PINT, LPINT, LPLONG;
alias float   FLOAT;
alias float*  PFLOAT;
alias void*   PCVOID, LPCVOID;

alias UINT_PTR WPARAM;
alias LONG_PTR LPARAM, LRESULT;

alias LONG HRESULT;

alias HANDLE HGLOBAL, HLOCAL, GLOBALHANDLE, LOCALHANDLE, HGDIOBJ, HACCEL,
  HBITMAP, HBRUSH, HCOLORSPACE, HDC, HGLRC, HDESK, HENHMETAFILE, HFONT,
  HICON, HKEY, HMENU, HMETAFILE, HINSTANCE, HMODULE, HPALETTE, HPEN, HRGN,
  HRSRC, HSTR, HTASK, HWND, HWINSTA, HKL, HCURSOR;
alias HANDLE* PHKEY;

static if (WINVER >= 0x410) {
	alias HANDLE HMONITOR;
}

static if (WINVER >= 0x500) {
	alias HANDLE HTERMINAL, HWINEVENTHOOK;
}

alias extern (Windows) int function() FARPROC, NEARPROC, PROC;

struct RECT {
	LONG left;
	LONG top;
	LONG right;
	LONG bottom;
}
alias RECT RECTL;
alias RECT* PRECT, LPRECT, LPCRECT, PRECTL, LPRECTL, LPCRECTL;

struct POINT {
	LONG x;
	LONG y;
}
alias POINT POINTL;
alias POINT* PPOINT, LPPOINT, PPOINTL, LPPOINTL;

struct SIZE {
	LONG cx;
	LONG cy;
}
alias SIZE SIZEL;
alias SIZE* PSIZE, LPSIZE, PSIZEL, LPSIZEL;

struct POINTS {
	SHORT x;
	SHORT y;
}
alias POINTS* PPOINTS, LPPOINTS;

enum : BOOL {
	FALSE = 0,
	TRUE = 1,
}



// basetsd

version (Win64) {
	alias long __int3264;
	enum : ulong { ADDRESS_TAG_BIT = 0x40000000000 }

	alias long INT_PTR, LONG_PTR;
	alias long* PINT_PTR, PLONG_PTR;
	alias ulong UINT_PTR, ULONG_PTR, HANDLE_PTR;
	alias ulong* PUINT_PTR, PULONG_PTR;
	alias int HALF_PTR;
	alias int* PHALF_PTR;
	alias uint UHALF_PTR;
	alias uint* PUHALF_PTR;
	// LATER: translate *To* functions once Win64 is here
} else {
	alias int __int3264;
	enum : uint { ADDRESS_TAG_BIT = 0x80000000 }

	alias int INT_PTR, LONG_PTR;
	alias int* PINT_PTR, PLONG_PTR;
	alias uint UINT_PTR, ULONG_PTR, HANDLE_PTR;
	alias uint* PUINT_PTR, PULONG_PTR;
	alias short HALF_PTR;
	alias short* PHALF_PTR;
	alias ushort UHALF_PTR;
	alias ushort* PUHALF_PTR;

	uint HandleToUlong(HANDLE h)    { return cast(uint) h; }
	int HandleToLong(HANDLE h)      { return cast(int) h; }
	HANDLE LongToHandle(LONG_PTR h) { return cast(HANDLE) h; }
	uint PtrToUlong(void* p)        { return cast(uint) p; }
	uint PtrToUint(void* p)         { return cast(uint) p; }
	int PtrToInt(void* p)           { return cast(int) p; }
	ushort PtrToUshort(void* p)     { return cast(ushort) p; }
	short PtrToShort(void* p)       { return cast(short) p; }
	void* IntToPtr(int i)           { return cast(void*) i; }
	void* UIntToPtr(uint ui)        { return cast(void*) ui; }
	alias IntToPtr LongToPtr;
	alias UIntToPtr ULongToPtr;
}

alias UIntToPtr UintToPtr, UlongToPtr;

enum : UINT_PTR {
	MAXUINT_PTR = UINT_PTR.max
}

enum : INT_PTR {
	MAXINT_PTR = INT_PTR.max,
	MININT_PTR = INT_PTR.min
}

enum : ULONG_PTR {
	MAXULONG_PTR = ULONG_PTR.max
}

enum : LONG_PTR {
	MAXLONG_PTR = LONG_PTR.max,
	MINLONG_PTR = LONG_PTR.min
}

enum : UHALF_PTR {
	MAXUHALF_PTR = UHALF_PTR.max
}

enum : HALF_PTR {
	MAXHALF_PTR = HALF_PTR.max,
	MINHALF_PTR = HALF_PTR.min
}

alias int LONG32, INT32;
alias int* PLONG32, PINT32;
alias uint ULONG32, DWORD32, UINT32;
alias uint* PULONG32, PDWORD32, PUINT32;

alias ULONG_PTR SIZE_T, DWORD_PTR;
alias ULONG_PTR* PSIZE_T, PDWORD_PTR;
alias LONG_PTR SSIZE_T;
alias LONG_PTR* PSSIZE_T;

alias long LONG64, INT64;
alias long* PLONG64, PINT64;
alias ulong ULONG64, DWORD64, UINT64;
alias ulong* PULONG64, PDWORD64, PUINT64;

// end of basetsd
