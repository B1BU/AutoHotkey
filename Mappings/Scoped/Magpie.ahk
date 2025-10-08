#Requires AutoHotkey v2.0

#Include ..\..\Data\Apps.ahk

#HotIf (WinActive(App.Magpie.title))
	F5:: App.Magpie.Restart()
#HotIf