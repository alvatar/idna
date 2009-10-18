module sys.x11.randr;

version( D_Version2 ) {
} else {
	import tango.stdc.config;
}

import sys.x11.X;
import sys.x11.Xlib;
alias sys.x11.X.Window Window;

version(build) pragma(link, "Xrandr");


extern (C):

version( Windows )
{
    alias int   c_long;
    alias uint  c_ulong;
}
else
{
  static if( (void*).sizeof > int.sizeof )
  {
    alias long  c_long;
    alias ulong c_ulong;
  }
  else
  {
    alias int   c_long;
    alias uint  c_ulong;
  }
}

version( solaris )
{
	alias ulong	upad64_t;
}


extern(C):

// randr.h
alias ushort	Rotation;
alias ushort	SizeID;
alias ushort	SubpixelOrder;
alias ushort	Connection;
alias ushort	XRandrRotation;
alias ushort	XRandrSizeID;
alias ushort	XRandrSubpixelOrder;
alias c_ulong	XRandrModeFlags;

const char[] RANDR_NAME = "RANDR";

enum {
	RANDR_MAJOR = 1,
	RANDR_MINOR	= 2,
}

enum {
	RRNumberErrors = 3,
	RRNumberEvents = 2,
	RRNumberRequests = 25,
}

enum {
	X_RRQueryVersion = 0,
/* we skip 1 to make old clients fail pretty immediately */
	X_RROldGetScreenInfo = 1,
	X_RR1_0SetScreenConfig = 2,
/* V1.0 apps share the same set screen config request id */
	X_RRSetScreenConfig = 2,
	X_RROldScreenChangeSelectInput = 3,
/* 3 used to be ScreenChangeSelectInput; deprecated */
	X_RRSelectInput = 4,
	X_RRGetScreenInfo = 5,

/* V1.2 additions */
	X_RRGetScreenSizeRange = 6,
	X_RRSetScreenSize = 7,
	X_RRGetScreenResources = 8,
	X_RRGetOutputInfo = 9,
	X_RRListOutputProperties = 10,
	X_RRQueryOutputProperty = 11,
	X_RRConfigureOutputProperty = 12,
	X_RRChangeOutputProperty = 13,
	X_RRDeleteOutputProperty = 14,
	X_RRGetOutputProperty = 15,
	X_RRCreateMode = 16,
	X_RRDestroyMode = 17,
	X_RRAddOutputMode = 18,
	X_RRDeleteOutputMode = 19,
	X_RRGetCrtcInfo = 20,
	X_RRSetCrtcConfig = 21,
	X_RRGetCrtcGammaSize = 22,
	X_RRGetCrtcGamma = 23,
	X_RRSetCrtcGamma = 24,
}

enum : c_long {
/* Event selection bits */
	RRScreenChangeNotifyMask = (1 << 0),
	
/* V1.2 additions */
	RRCrtcChangeNotifyMask = (1L << 1),
	RROutputChangeNotifyMask = (1L << 2),
	RROutputPropertyNotifyMask = (1L << 3),
}

enum {
/* Event codes */
	RRScreenChangeNotify = 0,
/* V1.2 additions */
	RRNotify = 1,
}

enum {
/* RRNotify Subcodes */
	RRNotify_CrtcChange = 0,
	RRNotify_OutputChange = 1,
	RRNotify_OutputProperty = 2,
}

enum {
/* used in the rotation field; rotation and reflection in 0.1 proto. */
	RR_Rotate_0 = 1,
	RR_Rotate_90 = 2,
	RR_Rotate_180 = 4,
	RR_Rotate_270 = 8,

/* new in 1.0 protocol, to allow reflection of screen */
	RR_Reflect_X = 16,
	RR_Reflect_Y = 32,
}

enum {
	RRSetConfigSuccess = 0,
	RRSetConfigInvalidConfigTime = 1,
	RRSetConfigInvalidTime = 2,
	RRSetConfigFailed = 3,
}

/* new in 1.2 protocol */
enum {
	RR_HSyncPositive = 0x00000001,
	RR_HSyncNegative = 0x00000002,
	RR_VSyncPositive = 0x00000004,
	RR_VSyncNegative = 0x00000008,
	RR_Interlace = 0x00000010,
	RR_DoubleScan = 0x00000020,
	RR_CSync = 0x00000040,
	RR_CSyncPositive = 0x00000080,
	RR_CSyncNegative = 0x00000100,
	RR_HSkewPresent = 0x00000200,
	RR_BCast = 0x00000400,
	RR_PixelMultiplex = 0x00000800,
	RR_DoubleClock = 0x00001000,
	RR_ClockDivideBy2 = 0x00002000,
}

enum {
	RR_Connected = 0,
	RR_Disconnected = 1,
	RR_UnknownConnection = 2,
}

enum {
	BadRROutput = 0,
	BadRRCrtc = 1,
	BadRRMode = 2,
}

/* Conventional RandR output properties */

const char[] RR_PROPERTY_RANDR_EDID = "RANDR_EDID";

// randrproto.h
//alias size_t Window;
alias size_t Drawable;
alias size_t Font;
alias size_t Colormap;
alias size_t GContext;
alias size_t Time;
alias ubyte KeyCode;
alias size_t KeySym;
alias size_t RROutput;
alias size_t RRMode;
alias size_t RRCrtc;
alias size_t RRModeFlags;

/*
 * data structures
 */

struct xScreenSizes {
    ushort widthInPixels;
    ushort heightInPixels;
    ushort widthInMillimeters;
    ushort heightInMillimeters;
}
const sz_xScreenSizes = 8;

/* 
 * requests and replies
 */

struct xRRQueryVersionReq {
    ubyte   reqType;
    ubyte   randrReqType;
    ushort  length;
    size_t  majorVersion;
    size_t  minorVersion;
}
const sz_xRRQueryVersionReq = 12;

struct xRRQueryVersionReply {
    byte    type;   /* X_Reply */
    byte    pad1;
    ushort  sequenceNumber;
    size_t  length;
    size_t  majorVersion;
    size_t  minorVersion;
    size_t  pad2;
    size_t  pad3;
    size_t  pad4;
    size_t  pad5;
}
const sz_xRRQueryVersionReply = 32;

struct xRRGetScreenInfoReq {
    ubyte   reqType;
    ubyte   randrReqType;
    ushort  length;
    Window  window;
}
const sz_xRRGetScreenInfoReq = 8;

/* 
 * the xRRScreenInfoReply structure is followed by:
 *
 * the size information
 */


struct xRRGetScreenInfoReply {
    byte    type;   /* X_Reply */
    byte    setOfRotations;
    ushort  sequenceNumber;
    size_t  length;
    Window  root;
    Time    timestamp;
    Time    configTimestamp;
    ushort  nSizes;
    SizeID  sizeID;
    Rotation  rotation;
    ushort  rate;
    ushort  nrateEnts;
    ushort  pad;
}
const sz_xRRGetScreenInfoReply = 32;

struct xRR1_0SetScreenConfigReq {
    ubyte    reqType;
    ubyte    randrReqType;
    ushort   length;
    Drawable drawable;
    Time     timestamp;
    Time     configTimestamp;
    SizeID   sizeID;
    Rotation rotation;
}
const sz_xRR1_0SetScreenConfigReq = 20;

struct xRRSetScreenConfigReq {
    ubyte    reqType;
    ubyte    randrReqType;
    ushort   length;
    Drawable drawable;
    Time     timestamp;
    Time     configTimestamp;
    SizeID   sizeID;
    Rotation rotation;
    ushort   rate;
    ushort   pad;
}
const sz_xRRSetScreenConfigReq = 24;

struct xRRSetScreenConfigReply {
    byte    type;   /* X_Reply */
    ubyte   status;
    ushort  sequenceNumber;
    size_t  length;
    Time    newTimestamp;  
    Time    newConfigTimestamp;
    Window  root;
    ushort  subpixelOrder;
    ushort  pad4;
    size_t  pad5;
    size_t  pad6;
}
const sz_xRRSetScreenConfigReply = 32;

struct xRRSelectInputReq {
    ubyte   reqType;
    ubyte   randrReqType;
    ushort  length;
    Window  window;
    ushort  enable;
    ushort  pad2;
}
const sz_xRRSelectInputReq = 12;

/*
 * Additions for version 1.2
 */

struct xRRModeInfo {
    RRMode		id;
    ushort		width;
    ushort		height;
    size_t		dotClock;
    ushort		hSyncStart;
    ushort		hSyncEnd;
    ushort		hTotal;
    ushort		hSkew;
    ushort		vSyncStart;
    ushort		vSyncEnd;
    ushort		vTotal;
    ushort		nameLength;
    RRModeFlags		modeFlags;
}
const sz_xRRModeInfo = 32;

struct xRRGetScreenSizeRangeReq {
    ubyte   reqType;
    ubyte   randrReqType;
    ushort  length;
    Window  window;
}
const sz_xRRGetScreenSizeRangeReq = 8;

struct xRRGetScreenSizeRangeReply {
    byte    type;   /* X_Reply */
    ubyte   pad;
    ushort  sequenceNumber;
    size_t  length;
    ushort  minWidth;
    ushort  minHeight;
    ushort  maxWidth;
    ushort  maxHeight;
    size_t  pad0;
    size_t  pad1;
    size_t  pad2;
    size_t  pad3;
}
const sz_xRRGetScreenSizeRangeReply = 32;

struct xRRSetScreenSizeReq {
    ubyte   reqType;
    ubyte   randrReqType;
    ushort  length;
    Window  window;
    ushort  width;
    ushort  height;
    size_t  widthInMillimeters;
    size_t  heightInMillimeters;
}
const sz_xRRSetScreenSizeReq = 20;

struct xRRGetScreenResourcesReq {
    ubyte   reqType;
    ubyte   randrReqType;
    ushort  length;
    Window  window;
}
const sz_xRRGetScreenResourcesReq = 8;

struct xRRGetScreenResourcesReply {
    byte	type;
    ubyte	pad;
    ushort	sequenceNumber;
    size_t	length;
    Time	timestamp;
    Time	configTimestamp;
    ushort	nCrtcs;
    ushort	nOutputs;
    ushort	nModes;
    ushort	nbytesNames;
    size_t	pad1;
    size_t	pad2;
}
const sz_xRRGetScreenResourcesReply = 32;

struct xRRGetOutputInfoReq {
    ubyte	reqType;
    ubyte	randrReqType;
    ushort	length;
    RROutput	output;
    Time	configTimestamp;
}
const sz_xRRGetOutputInfoReq = 12;

struct xRRGetOutputInfoReply {
    byte	type;
    ubyte	status;
    ushort	sequenceNumber;
    size_t	length;
    Time	timestamp;
    RRCrtc	crtc;
    size_t	mmWidth;
    size_t	mmHeight;
    ubyte	connection;
    ubyte	subpixelOrder;
    ushort	nCrtcs;
    ushort	nModes;
    ushort	nPreferred;
    ushort	nClones;
    ushort	nameLength;
} 
const sz_xRRGetOutputInfoReply = 36;

struct xRRListOutputPropertiesReq {
    ubyte	reqType;
    ubyte	randrReqType;
    ushort	length;
    RROutput	output;
}
const sz_xRRListOutputPropertiesReq = 8;

struct xRRListOutputPropertiesReply {
    byte	type;
    ubyte	pad0;
    ushort	sequenceNumber;
    size_t	length;
    ushort	nAtoms;
    ushort	pad1;
    size_t	pad2;
    size_t	pad3;
    size_t	pad4;
    size_t	pad5;
    size_t	pad6;
}
const sz_xRRListOutputPropertiesReply = 32;

struct xRRQueryOutputPropertyReq {
    ubyte	reqType;
    ubyte	randrReqType;
    ushort	length;
    RROutput	output;
    Atom	property;
}
const sz_xRRQueryOutputPropertyReq = 12;

struct xRRQueryOutputPropertyReply {
    byte	type;
    byte	pad0;
    ushort	sequenceNumber;
    size_t	length;
    bool	pending;
    bool	range;
    bool	immutab;
    byte	pad1;
    size_t	pad2;
    size_t	pad3;
    size_t	pad4;
    size_t	pad5;
    size_t	pad6;
}
const sz_xRRQueryOutputPropertyReply = 32;

struct xRRConfigureOutputPropertyReq {
    ubyte	reqType;
    ubyte	randrReqType;
    ushort	length;
    RROutput	output;
    Atom	property;
    bool	pending;
    bool	range;
    ushort	pad;
}
const sz_xRRConfigureOutputPropertyReq = 16;

struct xRRChangeOutputPropertyReq {
    ubyte	reqType;
    ubyte	randrReqType;
    ushort	length;
    RROutput	output;
    Atom	property;
    Atom	type;
    ubyte	format;
    ubyte	mode;
    ushort	pad;
    size_t	nUnits;
}
const sz_xRRChangeOutputPropertyReq	= 24;

struct xRRDeleteOutputPropertyReq {
    ubyte	reqType;
    ubyte	randrReqType;
    ushort	length;
    RROutput	output;
    Atom	property;
}
const sz_xRRDeleteOutputPropertyReq = 12;

struct xRRGetOutputPropertyReq {
    ubyte	reqType;
    ubyte	randrReqType;
    ushort	length;
    RROutput	output;
    Atom	property;
    Atom	type;
    size_t	longOffset;
    size_t	longLength;
    bool	delete_;
    bool	pending;
    ushort	pad1;
}
const sz_xRRGetOutputPropertyReq = 28;

struct xRRGetOutputPropertyReply {
    byte	type;
    ubyte	format;
    ushort	sequenceNumber;
    size_t	length;
    Atom	propertyType;
    size_t	bytesAfter;
    size_t	nItems;
    size_t	pad1;
    size_t	pad2;
    size_t	pad3;
}
const sz_xRRGetOutputPropertyReply = 32;

struct xRRCreateModeReq {
    ubyte	reqType;
    ubyte	randrReqType;
    ushort	length;
    Window	window;
    xRRModeInfo	modeInfo;
}
const sz_xRRCreateModeReq = 40;

struct xRRCreateModeReply {
    byte	type;
    ubyte	pad0;
    ushort	sequenceNumber;
    size_t	length;
    RRMode	mode;
    size_t	pad1;
    size_t	pad2;
    size_t	pad3;
    size_t	pad4;
    size_t	pad5;
}
const sz_xRRCreateModeReply = 32;

struct xRRDestroyModeReq {
    ubyte	reqType;
    ubyte	randrReqType;
    ushort	length;
    RRMode	mode;
}
const sz_xRRDestroyModeReq = 8;

struct xRRAddOutputModeReq {
    ubyte	reqType;
    ubyte	randrReqType;
    ushort	length;
    RROutput	output;
    RRMode	mode;
}
const sz_xRRAddOutputModeReq = 12;

struct xRRDeleteOutputModeReq {
    ubyte	reqType;
    ubyte	randrReqType;
    ushort	length;
    RROutput	output;
    RRMode	mode;
}
const sz_xRRDeleteOutputModeReq = 12;

struct xRRGetCrtcInfoReq {
    ubyte	reqType;
    ubyte	randrReqType;
    ushort	length;
    RRCrtc	crtc;
    Time	configTimestamp;
}
const sz_xRRGetCrtcInfoReq = 12;

struct xRRGetCrtcInfoReply {
    byte	type;
    ubyte	status;
    ushort	sequenceNumber;
    size_t	length;
    Time	timestamp;
    short	x;
    short	y;
    ushort	width;
    ushort	height;
    RRMode	mode;
    Rotation	rotation;
    Rotation	rotations;
    ushort	nOutput;
    ushort	nPossibleOutput;
}
const sz_xRRGetCrtcInfoReply = 32;

struct xRRSetCrtcConfigReq {
    ubyte	reqType;
    ubyte	randrReqType;
    ushort	length;
    RRCrtc	crtc;
    Time	timestamp;
    Time    	configTimestamp;
    short	x;
    short	y;
    RRMode	mode;
    Rotation	rotation;
    ushort	pad;
}
const sz_xRRSetCrtcConfigReq = 28;

struct xRRSetCrtcConfigReply {
    byte	type;
    ubyte	status;
    ushort	sequenceNumber;
    size_t	length;
    Time	newTimestamp;
    size_t	pad1;
    size_t	pad2;
    size_t	pad3;
    size_t	pad4;
    size_t	pad5;
}
const sz_xRRSetCrtcConfigReply = 32;

struct xRRGetCrtcGammaSizeReq {
    ubyte	reqType;
    ubyte	randrReqType;
    ushort	length;
    RRCrtc	crtc;
}
const sz_xRRGetCrtcGammaSizeReq = 8;

struct xRRGetCrtcGammaSizeReply {
    byte	type;
    ubyte	status;
    ushort	sequenceNumber;
    size_t	length;
    ushort	size;
    ushort	pad1;
    size_t	pad2;
    size_t	pad3;
    size_t	pad4;
    size_t	pad5;
    size_t	pad6;
}
const sz_xRRGetCrtcGammaSizeReply = 32;

struct xRRGetCrtcGammaReq {
    ubyte	reqType;
    ubyte	randrReqType;
    ushort	length;
    RRCrtc	crtc;
} 
const sz_xRRGetCrtcGammaReq = 8;

struct xRRGetCrtcGammaReply {
    byte	type;
    ubyte	status;
    ushort	sequenceNumber;
    size_t	length;
    ushort	size;
    ushort	pad1;
    size_t	pad2;
    size_t	pad3;
    size_t	pad4;
    size_t	pad5;
    size_t	pad6;
}
const sz_xRRGetCrtcGammaReply = 32;

struct xRRSetCrtcGammaReq {
    ubyte	reqType;
    ubyte	randrReqType;
    ushort	length;
    RRCrtc	crtc;
    ushort	size;
    ushort	pad1;
};
const sz_xRRSetCrtcGammaReq = 12;

/*
 * event
 */
struct xRRScreenChangeNotifyEvent {
    ubyte type;				/* always evBase + ScreenChangeNotify */
    ubyte rotation;			/* new rotation */
    ushort sequenceNumber;
    Time timestamp;;			/* time screen was changed */
    Time configTimestamp;;		/* time config data was changed */
    Window root;			/* root window */
    Window window;			/* window requesting notification */
    SizeID sizeID;			/* new size ID */
    ushort subpixelOrder;		/* subpixel order */
    ushort widthInPixels;		/* new size */
    ushort heightInPixels;
    ushort widthInMillimeters;
    ushort heightInMillimeters;
}
const sz_xRRScreenChangeNotifyEvent = 32;

struct xRRCrtcChangeNotifyEvent {
    ubyte type;				/* always evBase + RRNotify */
    ubyte subCode;			/* RRNotify_CrtcChange */
    ushort sequenceNumber;
    Time timestamp;			/* time crtc was changed */
    Window window;			/* window requesting notification */
    RRCrtc crtc;			/* affected CRTC */
    RRMode mode;			/* current mode */
    ushort rotation;		/* rotation and reflection */
    ushort pad1;			/* unused */
    short x;			/* new location */
    short y;
    ushort width;			/* new size */
    ushort height;
}
const sz_xRRCrtcChangeNotifyEvent = 32;

struct  xRROutputChangeNotifyEvent {
    ubyte type;				/* always evBase + RRNotify */
    ubyte subCode;			/* RRNotify_OutputChange */
    ushort sequenceNumber;
    Time timestamp;			/* time crtc was changed */
    Time configTimestamp;		/* time crtc was changed */
    Window window;			/* window requesting notification */
    RROutput output;		/* affected output */
    RRCrtc crtc;			/* current crtc */
    RRMode mode;			/* current mode */
    ushort rotation;		/* rotation and reflection */
    ubyte connection;			/* connection status */
    ubyte subpixelOrder;		/* subpixel order */
}
const sz_xRROutputChangeNotifyEvent = 32;

struct xRROutputPropertyNotifyEvent {
    ubyte type;				/* always evBase + RRNotify */
    ubyte subCode;			/* RRNotify_OutputProperty */
    ushort sequenceNumber;
    Window window;			/* window requesting notification */
    RROutput output;		/* affected output */
    Atom atom;			/* property name */
    Time timestamp;			/* time crtc was changed */
    ubyte state;			/* NewValue or Deleted */
    ubyte pad1;
    ushort pad2;
    size_t pad3;
    size_t pad4;
}
const sz_xRROutputPropertyNotifyEvent = 32;

// Xrandr.h

struct XRRScreenSize {
    int	width, height;
    int	mwidth, mheight;
}

/*
 *  Events.
 */

struct XRRScreenChangeNotifyEvent {
    int type;			/* event base */
    c_ulong serial;	/* # of last request processed by server */
    bool send_event;		/* true if this came from a SendEvent request */
    Display *display;		/* Display the event was read from */
    Window window;		/* window which selected for this event */
    Window root;		/* Root window for changed screen */
    Time timestamp;		/* when the screen change occurred */
    Time config_timestamp;	/* when the last configuration change */
    SizeID size_index;
    SubpixelOrder subpixel_order;
    Rotation rotation;
    int width;
    int height;
    int mwidth;
    int mheight;
}

struct XRRNotifyEvent {
    int type;			/* event base */
    c_ulong serial;	/* # of last request processed by server */
    bool send_event;		/* true if this came from a SendEvent request */
    Display *display;		/* Display the event was read from */
    Window window;		/* window which selected for this event */
    int subtype;		/* RRNotify_ subtype */
}

struct XRROutputChangeNotifyEvent {
    int type;			/* event base */
    c_ulong serial;	/* # of last request processed by server */
    bool send_event;		/* true if this came from a SendEvent request */
    Display *display;		/* Display the event was read from */
    Window window;		/* window which selected for this event */
    int subtype;		/* RRNotify_OutputChange */
    RROutput output;		/* affected output */
    RRCrtc crtc;	    	/* current crtc (or None) */
    RRMode mode;	    	/* current mode (or None) */
    Rotation rotation;		/* current rotation of associated crtc */
    Connection connection;	/* current connection status */
    SubpixelOrder subpixel_order;
}

struct XRRCrtcChangeNotifyEvent {
    int type;			/* event base */
    c_ulong serial;	/* # of last request processed by server */
    bool send_event;		/* true if this came from a SendEvent request */
    Display *display;		/* Display the event was read from */
    Window window;		/* window which selected for this event */
    int subtype;		/* RRNotify_CrtcChange */
    RRCrtc crtc;    		/* current crtc (or None) */
    RRMode mode;	    	/* current mode (or None) */
    Rotation rotation;		/* current rotation of associated crtc */
    int x, y;			/* position */
    size_t width, height;	/* size */
}

struct XRROutputPropertyNotifyEvent {
    int type;			/* event base */
    c_ulong serial;	/* # of last request processed by server */
    bool send_event;		/* true if this came from a SendEvent request */
    Display *display;		/* Display the event was read from */
    Window window;		/* window which selected for this event */
    int subtype;		/* RRNotify_OutputProperty */
    RROutput output;		/* related output */
    Atom property;		/* changed property */
    Time timestamp;		/* time of change */
    int state;			/* NewValue, Deleted */
}

/* internal representation is private to the library */
struct XRRScreenConfiguration {
  Screen *screen;	/* the root window in GetScreenInfo */
  XRRScreenSize *sizes;
  Rotation rotations;
  Rotation current_rotation;
  int nsizes;
  int current_size;
  short current_rate;
  Time timestamp;
  Time config_timestamp;
  int subpixel_order;	/* introduced in randr v0.1 */
  short *rates;		/* introduced in randr v1.1 */
  int nrates;
}

bool XRRQueryExtension (Display *dpy, int *event_basep, int *error_basep);
int XRRQueryVersion (Display *dpy,
			    int     *major_versionp,
			    int     *minor_versionp);

XRRScreenConfiguration *XRRGetScreenInfo (Display *dpy,
					  Window window);
    
void XRRFreeScreenConfigInfo (XRRScreenConfiguration *config);

/* 
 * Note that screen configuration changes are only permitted if the client can
 * prove it has up to date configuration information.  We are trying to
 * insist that it become possible for screens to change dynamically, so
 * we want to ensure the client knows what it is talking about when requesting
 * changes.
 */
int XRRSetScreenConfig (Display *dpy, 
			   XRRScreenConfiguration *config,
			   Drawable draw,
			   int size_index,
			   Rotation rotation,
			   Time timestamp);

/* added in v1.1, sorry for the lame name */
int XRRSetScreenConfigAndRate (Display *dpy, 
				  XRRScreenConfiguration *config,
				  Drawable draw,
				  int size_index,
				  Rotation rotation,
				  short rate,
				  Time timestamp);


Rotation XRRConfigRotations(XRRScreenConfiguration *config, Rotation *current_rotation);

Time XRRConfigTimes (XRRScreenConfiguration *config, Time *config_timestamp);

XRRScreenSize *XRRConfigSizes(XRRScreenConfiguration *config, int *nsizes);

short *XRRConfigRates (XRRScreenConfiguration *config, int sizeID, int *nrates);

SizeID XRRConfigCurrentConfiguration (XRRScreenConfiguration *config, 
			      Rotation *rotation);
    
short XRRConfigCurrentRate (XRRScreenConfiguration *config);

int XRRRootToScreen(Display *dpy, Window root);

/* 
 * returns the screen configuration for the specified screen; does a lazy
 * evalution to delay getting the information, and caches the result.
 * These routines should be used in preference to XRRGetScreenInfo
 * to avoid unneeded round trips to the X server.  These are new
 * in protocol version 0.1.
 */


XRRScreenConfiguration *XRRScreenConfig(Display *dpy, int screen);
XRRScreenConfiguration *XRRConfig(Screen *screen);
void XRRSelectInput(Display *dpy, Window window, int mask);

/* 
 * the following are always safe to call, even if RandR is not implemented 
 * on a screen 
 */


Rotation XRRRotations(Display *dpy, int screen, Rotation *current_rotation);
XRRScreenSize *XRRSizes(Display *dpy, int screen, int *nsizes);
short *XRRRates (Display *dpy, int screen, int sizeID, int *nrates);
Time XRRTimes (Display *dpy, int screen, Time *config_timestamp);


/* Version 1.2 additions */

int
XRRGetScreenSizeRange (Display *dpy, Window window,
		       int *minWidth, int *minHeight,
		       int *maxWidth, int *maxHeight);

void
XRRSetScreenSize (Display *dpy, Window window,
		  int width, int height,
		  int mmWidth, int mmHeight);

alias c_ulong XRRModeFlags;

struct XRRModeInfo {
    RRMode		id;
    size_t	width;
    size_t	height;
    c_ulong	dotClock;
    size_t	hSyncStart;
    size_t	hSyncEnd;
    size_t	hTotal;
    size_t	hSkew;
    size_t	vSyncStart;
    size_t	vSyncEnd;
    size_t	vTotal;
    char		*name;
    size_t	nameLength;
    XRRModeFlags	modeFlags;
}

struct XRRScreenResources {
    Time	timestamp;
    Time	configTimestamp;
    int		ncrtc;
    RRCrtc	*crtcs;
    int		noutput;
    RROutput	*outputs;
    int		nmode;
    XRRModeInfo	*modes;
}
    
XRRScreenResources *
XRRGetScreenResources (Display *dpy, Window window);

void
XRRFreeScreenResources (XRRScreenResources *resources);

struct XRROutputInfo {
    Time	    timestamp;
    RRCrtc	    crtc;
    char	    *name;
    int		    nameLen;
    c_ulong   mm_width;
    c_ulong   mm_height;
    Connection	    connection;
    SubpixelOrder   subpixel_order;
    int		    ncrtc;
    RRCrtc	    *crtcs;
    int		    nclone;
    RROutput	    *clones;
    int		    nmode;
    int		    npreferred;
    RRMode	    *modes;
}

XRROutputInfo *
XRRGetOutputInfo (Display *dpy, XRRScreenResources *resources, RROutput output);

void
XRRFreeOutputInfo (XRROutputInfo *outputInfo);

Atom *
XRRListOutputProperties (Display *dpy, RROutput output, int *nprop);

struct  XRRPropertyInfo {
    bool    pending;
    bool    range;
    bool    immutab;
    int	    num_values;
    c_long    *values;
}

XRRPropertyInfo *
XRRQueryOutputProperty (Display *dpy, RROutput output, Atom property);

void
XRRConfigureOutputProperty (Display *dpy, RROutput output, Atom property,
			    bool pending, bool range, int num_values,
			    c_long *values);
			
void
XRRChangeOutputProperty (Display *dpy, RROutput output,
						 Atom property, Atom type,
						 int format, int mode,
						 ubyte *data, int nelements);

void
XRRDeleteOutputProperty (Display *dpy, RROutput output, Atom property);

int
XRRGetOutputProperty (Display *dpy, RROutput output,
		      Atom property, c_long offset, c_long length,
		      bool _delete, bool pending, Atom req_type,
		      Atom *actual_type, int *actual_format,
		      c_ulong *nitems, c_ulong *bytes_after,
		      ubyte **prop);

XRRModeInfo *
XRRAllocModeInfo (char *name, int nameLength);

RRMode
XRRCreateMode (Display *dpy, Window window, XRRModeInfo *modeInfo);

void
XRRDestroyMode (Display *dpy, RRMode mode);

void
XRRAddOutputMode (Display *dpy, RROutput output, RRMode mode);

void
XRRDeleteOutputMode (Display *dpy, RROutput output, RRMode mode);

void
XRRFreeModeInfo (XRRModeInfo *modeInfo);
		      
struct XRRCrtcInfo {
    Time	    timestamp;
    int		    x, y;
    size_t    width, height;
    RRMode	    mode;
    Rotation	    rotation;
    int		    noutput;
    RROutput	    *outputs;
    Rotation	    rotations;
    int		    npossible;
    RROutput	    *possible;
}

XRRCrtcInfo* XRRGetCrtcInfo (Display *dpy, XRRScreenResources *resources, RRCrtc crtc);

void XRRFreeCrtcInfo (XRRCrtcInfo *crtcInfo);

int XRRSetCrtcConfig (Display *dpy,
		  XRRScreenResources *resources,
		  RRCrtc crtc,
		  Time timestamp,
		  int x, int y,
		  RRMode mode,
		  Rotation rotation,
		  RROutput *outputs,
		  int noutputs);

int XRRGetCrtcGammaSize (Display *dpy, RRCrtc crtc);

struct XRRCrtcGamma {
    int		    size;
    ushort  *red;
    ushort  *green;
    ushort  *blue;
}

XRRCrtcGamma* XRRGetCrtcGamma (Display *dpy, RRCrtc crtc);

XRRCrtcGamma* XRRAllocGamma (int size);

void XRRSetCrtcGamma (Display *dpy, RRCrtc crtc, XRRCrtcGamma *gamma);

void XRRFreeGamma (XRRCrtcGamma *gamma);

/* 
 * intended to take RRScreenChangeNotify,  or 
 * ConfigureNotify (on the root window)
 * returns 1 if it is an event type it understands, 0 if not
 */
int XRRUpdateConfiguration(XEvent *event);
