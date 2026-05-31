#Requires AutoHotkey v2.0

#Include ..\..\
#Include Core\Set\Apps.ahk

#HotIf (WinActive(Apps['The Outlast Trials'].title))
	!LButton:: Send('{Enter}')
	!RButton:: Send('{Escape}')
	~LAlt:: w
#HotIf