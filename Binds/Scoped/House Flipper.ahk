#Requires AutoHotkey v2.0

#Include ..\..\Core\Set\Apps.ahk

#HotIf (WinActive(Apps['HouseFlipper'].title))
	!LButton:: Send('{Enter}')
	!RButton:: Send('{Esc}')
#HotIf