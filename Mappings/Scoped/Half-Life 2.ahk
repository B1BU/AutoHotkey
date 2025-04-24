#Requires AutoHotkey v2.0

/*	Keybinds
	'			- Open console
	Shift + '	- Open addons?
	Alt + '		- Open ???
*/

#Include ..\..\Data\Apps.ahk

#HotIf WinActive(App.HalfLife2.title)
	'::F1
	"::"
	!'::!'
#HotIf