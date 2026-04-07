#Requires AutoHotkey v2.0

#Include ..\..\Core\Data\Deprecated\Apps.ahk

#HotIf (WinActive(DeprecatedApp.Audacity.title))
	#Include ..\Common\Alt Redo.ahk
#HotIf