#Requires AutoHotkey v2.0

#Include ..\..\
#Include Load\Apps.ahk

#HotIf (WinActive(Apps['Blockbench'].title))
	#Include Binds\Snippets\Alt Redo.ahk
#HotIf