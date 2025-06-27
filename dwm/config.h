#include <X11/XF86keysym.h>

/* appearance */
static const char *fonts[]          = { "JetBrainsMono Nerd Font:size=12" };
static const unsigned int borderpx  = 2;        /* border pixel of windows */
static const unsigned int snap      = 16;       /* snap pixel */

/* BAR */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
// Bar Padding
static const int vertpad            = 4;       /* vertical padding of bar */
static const int sidepad            = 4;       /* horizontal padding of bar */
// Tag Underline
static const unsigned int ulinepad	= 5;	/* horizontal padding between the underline and tag */
static const unsigned int ulinestroke	= 2;	/* thickness / height of the underline */
static const unsigned int ulinevoffset	= 0;	/* how far above the bottom of the bar the line should appear */
// Systray
static const unsigned int systraypinning = 1;   /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayonleft = 1;    /* 0: systray in the right corner, >0: systray on left of status text */
static const unsigned int systrayspacing = 4;   /* systray spacing */
static const int systraypinningfailfirst = 1;   /* 1: if pinning fails, display systray on the first monitor, False: display systray on the last monitor*/
static const int showsystray        = 1;        /* 0 means no systray */
static const int systraychange	= 8;
// Hide Layout Symbol
static const int hideltsymbol		= 1;
// Clock
static const unsigned int enable_clock = 1;
static const char *clock_format = " %H:%M  %Y-%m-%d";

/* Vanity Gaps */
static const unsigned int gappih    = 4;       /* horiz inner gap between windows */
static const unsigned int gappiv    = 4;       /* vert inner gap between windows */
static const unsigned int gappoh    = 4;       /* horiz outer gap between windows and screen edge */
static const unsigned int gappov    = 4;       /* vert outer gap between windows and screen edge */
static int smartgaps				= 0;        /* 1 means no outer gap when there is only one window */
#include "vanitygaps.c"

/* Color Scheme */
static const char *colors[][3]      = {
	/*					 fg         bg         border   */
	[SchemeNorm]	= { "#a9b1d6", "#1a1b26", "#32344a" },
	[SchemeSel]		= { "#a9b1d6", "#1a1b26", "#7aa2f7"  },
	
	[SchemeTag]		= { "#a9b1d6", "#1a1b26", "#32344a" },
	[SchemeTagSel]  = { "#1a1b26", "#7aa2f7", "#32344a"  },
};

/* Autostart */
static const char *const autostart[] = {
	"slstatus", NULL,
	"clipmenud", NULL,
	"picom", NULL,

	"displayctl", "auto", NULL,
	"xset", "-dpms", "s", "off", NULL,
	"setxkbmap", "-option", "altwin:swap_lalt_lwin", "-layout", "'us,tr'", NULL,
	NULL
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Weston Compositor", NULL, NULL, 0, 1, -1 },
	{ "PacketTracer", NULL, NULL, 0, 1, -1 },
	{ "pavucontrol", NULL, NULL, 0, 1, -1 },
	{ "imv", NULL, NULL, 0, 1, -1 },
	{ "org.remmina.Remmina", NULL, "Remmina Remote Desktop Client", 0, 1, -1 },
};

/* layouts */
static const float mfact     = 0.65; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 2;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol   arrange function */
	{ "[]",		dwindle },
	// { "<>",		NULL },
	// { "{}",		monocle },
};

/* helper to run sh commands */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* key definitions */
#define Super Mod4Mask
#define Shift ShiftMask

/* tag bindings */
#define TAGKEYS(KEY,TAG) \
	{ Super,						KEY,      view,           {.ui = 1 << TAG} }, \
	{ Super|Shift,					KEY,      tag,            {.ui = 1 << TAG} },

static const Key keys[] = {
	/* modifier,		key,		function,		argument */
	// Apps
	{ Super,			XK_t,		spawn,			SHCMD("alacritty")},
	{ Super|Shift,		XK_t,		spawn,			SHCMD("kitty")},

	{ Super,			XK_b,		spawn,			SHCMD("librewolf-bin")},
	{ Super|Shift,		XK_b,		spawn,			SHCMD("brave-bin")},

	{ Super,			XK_v,		spawn,			SHCMD("mpv --player-operation-mode=pseudo-gui --keep-open")},

	// System Apps
	{ Super,			XK_space,	spawn,			SHCMD("rofi -show drun")},
	{ Super,			XK_Escape,	spawn,			SHCMD("power_menu")},
	{ Super,			XK_d,		spawn,			SHCMD("display_menu")},
	{ Super,			XK_c,		spawn,			SHCMD("CM_LAUNCHER=rofi clipmenu")},

	{ Super,			XK_l,		spawn,			SHCMD("betterlockscreen -l")},
	{ Super,			XK_s,		spawn,			SHCMD("flameshot gui") },

	// Window Modes
	{ Super,			XK_f,		togglefullscr,	{0} },
	{ Super|Shift,		XK_f,		togglefloating, {0} },
	{ Super,			XK_p,		togglepin,		{0} },
	{ Super,			XK_Return,	zoom,           {0} },
	
	// System
	{ Super,			XK_x,		killclient,     {0} },

	{ Super|Shift,		XK_q,		quit,			{0} },

	{ Super,			XK_Up,		focusstack,     {.i = -1 } },
	{ Super,			XK_Down,	focusstack,     {.i = +1 } },
	{ Super|Shift,		XK_Up,		pushup,			{0} },
	{ Super|Shift,		XK_Down,	pushdown,		{0} },

	{ Super,			XK_Tab,		focusmon,       {.i = +1 } },
	{ Super|Shift,		XK_Tab,		tagmon,			{.i = +1 } },

	{ Super,			XK_Right,	setmfact,       {.f = +0.05} },
	{ Super,			XK_Left,	setmfact,       {.f = -0.05} },

	// Keyboard
	{ Super,			XK_k,		setxkbgroup,	{.ui = 0 } },
	{ Super|Shift,		XK_k,		setxkbgroup,	{.ui = 1 } },

	// Tags
	TAGKEYS(			XK_1,		0)
	TAGKEYS(            XK_2,       1)
	TAGKEYS(            XK_3,       2)
	TAGKEYS(            XK_4,       3)
	TAGKEYS(            XK_5,       4)
	TAGKEYS(            XK_6,       5)
	TAGKEYS(            XK_7,       6)
	TAGKEYS(            XK_8,       7)
	TAGKEYS(            XK_9,       8)
	TAGKEYS(            XK_0,       9)

	// Brightness
	{ 0, XF86XK_MonBrightnessUp,	spawn,			SHCMD("brightnessctl s 5%+") },
	{ 0, XF86XK_MonBrightnessDown,	spawn,			SHCMD("brightnessctl s 5%-") },
	// Volume
	{ 0, XF86XK_AudioRaiseVolume,	spawn,			SHCMD("pamixer --allow-boost -i 5") },
	{ 0, XF86XK_AudioLowerVolume,	spawn,			SHCMD("pamixer --allow-boost -d 5") },
	{ 0, XF86XK_AudioMute,			spawn,			SHCMD("pamixer -t") },
	// Player
	{ 0, XF86XK_AudioPause,			spawn,			SHCMD("playerctl pause") },
	{ 0, XF86XK_AudioPlay,			spawn,			SHCMD("playerctl play-pause") },
	{ 0, XF86XK_AudioNext,			spawn,			SHCMD("playerctl next") },
	{ 0, XF86XK_AudioPrev,			spawn,			SHCMD("playerctl previous") },
	{ 0, XF86XK_AudioStop,			spawn,			SHCMD("playerctl stop") },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */

	// Tag Bar
	{ ClkTagBar,			0,				Button1,        view,			{0} },
	{ ClkTagBar,			0,				Button3,        tag,			{0} },

	// Status Text
	// { ClkStatusText,			0,				Button1,        spawn,			SHCMD("notify-send 1") },
	// { ClkStatusText,			0,				Button2,        spawn,			SHCMD("notify-send 2") },
	// { ClkStatusText,			0,				Button3,        spawn,			SHCMD("notify-send 3") },
	
	// Window
	{ ClkClientWin,         Super,			Button1,        movemouse,      {0} },
	{ ClkClientWin,         Super,			Button2,        zoom,			{0} },
	{ ClkClientWin,         Super,			Button3,        resizemouse,    {0} },

	// Root Window
	// { ClkRootWin,			0,				Button1,        spawn,			SHCMD("notify-send 1") },
	// { ClkRootWin,			0,				Button2,        spawn,			SHCMD("notify-send 2") },
	// { ClkRootWin,			0,				Button3,        spawn,			SHCMD("notify-send 3") },
};
