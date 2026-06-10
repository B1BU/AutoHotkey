#Requires AutoHotkey v2.0

#Include ..\..\
#Include Load\Apps.ahk

#HotIf WinActive(Apps['Peak'].title)
	Tab:: b
#HotIf