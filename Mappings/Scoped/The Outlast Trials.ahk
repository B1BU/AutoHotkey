#Requires AutoHotkey v2.0

#Include ..\..\Data\Apps.ahk

#HotIf (WinActive(App.OutlastTrials.title))
	!LButton:: Send('{Enter}')
	!RButton:: Send('{Escape}')
	~LAlt:: w
#HotIf