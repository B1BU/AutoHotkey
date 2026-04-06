#Requires AutoHotkey v2.0

#Include ..\..\Core\Lib\Text.ahk
#Include ..\..\Core\Lib\Web.ahk
#Include ..\..\Core\Data\Apps.ahk

path_steam_library := 'D:\System\Program Data\Steam\Core\Library'

AppsKey & sc073:: {
	input := GetKeyState('Control') ? A_Clipboard : GetSelection()

	if WinActive(App.Steam.title) {
		if GetKeyState('Shift') {
			if not query := Web.ToQuery(input)
				return
			Web.Open('https://www.steamgriddb.com/search/grids?term=' query)

			out_dir := path_steam_library '\' input
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