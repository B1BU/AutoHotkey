#Requires AutoHotkey v2.0

#Include ..\..\
#Include Core\Set\Apps.ahk

#HotIf (WinActive(Apps['Audacity'].title))
	#Include Binds\Common\Alt Redo.ahk
#HotIf