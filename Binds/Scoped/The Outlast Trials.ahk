#Requires AutoHotkey v2.0

#Include ..\..\
#Include Load\Apps.ahk

#HotIf (WinActive(Apps['The Outlast Trials'].title))
	!LButton:: Send('{Enter}')
	!RButton:: Send('{Escape}')
	~LAlt:: w
#HotIf