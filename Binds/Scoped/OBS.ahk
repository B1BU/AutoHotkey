#Requires AutoHotkey v2.0

#Include ..\..\
#Include Load\Apps.ahk
#Include Lib\Explorer.ahk

#HotIf (WinActive(Apps['OBS'].title))
	#e:: Run('D:\System\Program data\OBS')
#HotIf