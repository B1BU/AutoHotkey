#Requires AutoHotkey v2.0

#Include ..\..\Libraries\Text.ahk
#Include ..\..\Libraries\Web.ahk

AppsKey & sc073:: {
	if GetKeyState('Control')
		return Web.SearchOrOpen(A_Clipboard)
	Web.SearchOrOpen(GetSelection())
}

/*
	STUFF FOR TESTING
	What is the current time
	What day is it
	Clipboard wikipedia

	https://www.omfgdogs.com/
	regex101.com
*/