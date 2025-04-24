#Requires AutoHotkey v2.0

/*	Fixes
	Ctrl + Shift + Z	- Re-do
*/

#Include ..\..\Data\Apps.ahk

#HotIf (WinActive(App.Audacity.title))
	#Include ..\..\Data\Common Rebinds\Alt Redo.ahk
#HotIf