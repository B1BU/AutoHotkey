#Requires AutoHotkey v2.0

#Include ..\..\
#Include Core\Lib\Extensions.ahk
#Include Core\Set\Apps.ahk

#HotIf (WinActive(Apps['VSCode'].title))
	~^F1:: { ; Fix AHK help window
		if (WinWait(Apps['AHK Help'].title, , 2)) {
			WinMoveMonitor(Apps['AHK Help'].title, 1)
			WinMaximize(Apps['AHK Help'].title)
		}
	}
#HotIf