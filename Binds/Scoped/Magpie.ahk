#Requires AutoHotkey v2.0

#Include ..\..\
#Include Load\Apps.ahk

#HotIf (WinActive(Apps['Magpie'].title))
	F5:: Apps['Magpie'].Restart()
#HotIf