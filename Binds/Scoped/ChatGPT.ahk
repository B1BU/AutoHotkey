#Requires AutoHotkey v2.0

#Include ..\..\Core\Data\Apps.ahk

#HotIf (WinActive(App.ChatGPT.title))
	^n:: ^+o
	^+n:: App.ChatGPT.Open()
#HotIf