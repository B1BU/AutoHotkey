#Requires AutoHotkey v2.0

/*	Fixes
	Win + E				- Open OBS Folder
*/

#Include ..\..\Data\Apps.ahk
#Include ..\..\Data\Libraries\Explorer.ahk

#HotIf (WinActive(App.OBS.title))
	#e:: Run('D:\System\Program data\OBS')
#HotIf