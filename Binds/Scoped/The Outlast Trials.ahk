#Requires AutoHotkey v2.0

#Include ..\..\Core\Data\Deprecated\Apps.ahk

#HotIf (WinActive(DeprecatedApp.OutlastTrials.title))
	!LButton:: Send('{Enter}')
	!RButton:: Send('{Escape}')
	~LAlt:: w
#HotIf