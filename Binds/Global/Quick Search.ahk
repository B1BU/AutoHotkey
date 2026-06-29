#Requires AutoHotkey v2.0

#Include ..\..\
#Include Lib\Text.ahk
#Include Lib\Web.ahk
#Include Load\Apps.ahk

PATH_STEAM_LIBRARY := 'D:\System\Program Data\Steam\Library'

AppsKey & sc073:: {
	input := GetKeyState('Control') ? A_Clipboard : GetSelection()

	if WinActive(Apps['Steam Class'].title) {
		if GetKeyState('Shift') {
			if not query := Web.ToQuery(input)
				return

			Web.Open('https://www.steamgriddb.com/search/grids?term=' query)

			out_dir := PATH_STEAM_LIBRARY '\' input
			DirCreate(out_dir)
			Run(out_dir)

			return
		}
	}

	Web.SearchOrOpen(input)
}

/*
	STUFF FOR TESTING
	What is the current time
	What day is it
	Clipboard wikipedia

	https://www.omfgdogs.com/
	regex101.com
*/