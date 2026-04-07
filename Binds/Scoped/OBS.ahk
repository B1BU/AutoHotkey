#Requires AutoHotkey v2.0

#Include ..\..\Core\Data\Deprecated\Apps.ahk
#Include ..\..\Core\Lib\Explorer.ahk

#HotIf (WinActive(DeprecatedApp.OBS.title))
	#e:: Run('D:\System\Program data\OBS')
#HotIf