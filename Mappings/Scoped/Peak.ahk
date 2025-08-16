#Requires AutoHotkey v2.0

/*	Keybinds
*/

#Include ..\..\Data\Apps.ahk

#HotIf WinActive(App.Peak.title)
	XButton1::		Tab
	Tab::			b
#HotIf