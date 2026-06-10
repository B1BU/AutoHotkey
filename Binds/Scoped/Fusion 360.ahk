#Requires AutoHotkey v2.0

#Include ..\..\
#Include Load\Apps.ahk

#HotIf (WinActive(Apps['Fusion 360'].title))
	#Include Binds\Snippets\Alt Redo.ahk
#HotIf