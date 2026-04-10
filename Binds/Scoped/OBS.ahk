#Requires AutoHotkey v2.0

#Include ..\..\
#Include Core\Set\Apps.ahk
#Include Core\Lib\Explorer.ahk

#HotIf (WinActive(Apps['OBS'].title))
	#e:: Run('D:\System\Program data\OBS')
#HotIf