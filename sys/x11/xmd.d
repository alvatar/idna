module sys.x11.xmd;

alias long INT64;
alias ulong CARD64;
alias int INT32;
alias short INT16;
alias byte INT8;
alias int CARD32;
alias ushort CARD16;
alias ubyte CARD8;
alias CARD32 BITS32;
alias CARD16 BITS16;
alias CARD8 BYTE;
alias CARD8 BOOL;
// NOTE: bitfield expanders are not implemented.



struct MWMHints {
  CARD32 flags;         /* window hints */
  CARD32 functions;     /* requested functions */
  CARD32 decorations;   /* requested decorations */
  INT32  inputMode;     /* input mode */
  CARD32 status;        /* status (ignored) */
}


enum : int {
	MWM_DECOR_ALL           = (1L << 0),
	MWM_DECOR_BORDER        = (1L << 1),
	MWM_DECOR_RESIZEH       = (1L << 2),
	MWM_DECOR_TITLE         = (1L << 3),
	MWM_DECOR_MENU          = (1L << 4),
	MWM_DECOR_MINIMIZE      = (1L << 5),
	MWM_DECOR_MAXIMIZE      = (1L << 6),

	MWM_HINTS_DECORATIONS   = (1L << 1),
	PROP_MWM_HINTS_ELEMENTS = 5
}
