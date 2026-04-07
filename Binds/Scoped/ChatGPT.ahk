#Requires AutoHotkey v2.0

#Include ..\..\Core\Data\Deprecated\Apps.ahk

#HotIf (WinActive(DeprecatedApp.ChatGPT.title))
	^n:: ^+o
	^+n:: DeprecatedApp.ChatGPT.Open()
#HotIf