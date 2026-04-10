#Requires AutoHotkey v2.0

#Include ..\..\
#Include Core\Set\Apps.ahk

#HotIf (WinActive(Apps['Magpie'].title))
	F5:: Apps['Magpie'].Restart()
#HotIf