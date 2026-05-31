#Requires AutoHotkey v2.0

#Include ..\..\
#Include Core\Set\Apps.ahk

#HotIf WinActive(Apps['Half-Life 2'].title)
	'::F1
	"::"
	!'::!'
#HotIf