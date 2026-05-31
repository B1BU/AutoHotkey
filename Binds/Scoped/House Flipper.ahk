#Requires AutoHotkey v2.0

#Include ..\..\
#Include Core\Set\Apps.ahk

#HotIf (WinActive(Apps['House Flipper'].title))
	!LButton:: Send('{Enter}')
	!RButton:: Send('{Esc}')
#HotIf