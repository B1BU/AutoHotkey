#Requires AutoHotkey v2.0

#Include ..\..\
#Include Core\Set\Apps.ahk

#HotIf WinActive(Apps['HalfLife2'].title)
	'::F1
	"::"
	!'::!'
#HotIf