#Requires AutoHotkey v2.0

#Include ..\..\Core\Data\Deprecated\Apps.ahk

#HotIf (WinActive(DeprecatedApp.Magpie.title))
	F5:: DeprecatedApp.Magpie.Restart()
#HotIf