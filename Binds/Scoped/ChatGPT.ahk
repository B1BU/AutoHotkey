#Requires AutoHotkey v2.0

#Include ..\..\
#Include Core\Set\Apps.ahk

#HotIf (WinActive(Apps['ChatGPT'].title))
	^n:: ^+o
	^+n:: Apps['ChatGPT'].Run()
#HotIf