#Requires AutoHotkey v2.0

/*
	[KEYBINDINGS]
	App + Enter        - Search or open selection
	App + Ctrl + Enter - Search or open clipboard content
*/

#Include ..\..\Data\Libraries\Text.ahk
#Include ..\..\Data\Libraries\Web.ahk

AppsKey & sc073:: {
	if GetKeyState('Control')
		return Web.SearchOrOpen(A_Clipboard)
	Web.SearchOrOpen(GetSelection())
}

/*
	[STUFF FOR TESTING]
	What is the current time
	What day is it
	Clipboard wikipedia

	https://www.omfgdogs.com/
	regex101.com
*/