#Requires AutoHotkey v2.0

#Include ..\..\Core\Data\Apps.ahk

#HotIf (WinActive(App.Fusion360.title))
	#Include ..\Common\Alt Redo.ahk
#HotIf