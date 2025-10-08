#Requires AutoHotkey v2.0

#Include ..\..\Data\Apps.ahk
#Include ..\..\Libraries\Explorer.ahk

#HotIf (WinActive(App.OBS.title))
	#e:: Run('D:\System\Program data\OBS')
#HotIf