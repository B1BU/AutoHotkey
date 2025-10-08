#Requires AutoHotkey v2.0

#Include ..\..\Data\Apps.ahk

#HotIf (WinActive(App.Audacity.title))
	#Include ..\..\Data\Common Rebinds\Alt Redo.ahk
#HotIf