#Requires AutoHotkey v2.0

#Include ..\..\Core\Data\Apps.ahk
#Include ..\..\Core\Lib\Explorer.ahk

#HotIf (WinActive(App.OBS.title))
	#e:: Run('D:\System\Program data\OBS')
#HotIf