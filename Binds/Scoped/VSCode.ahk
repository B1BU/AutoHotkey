#Requires AutoHotkey v2.0

#Include ..\..\
#Include Core\Lib\Extensions.ahk
#Include Core\Set\Apps.ahk

#HotIf (WinActive(Apps['VSCode'].title))
	~^F1:: { ; Fix AHK help window
		if (WinWait(Apps['AHKHelp'].title,, 2)) {
			WinMoveMonitor(Apps['AHKHelp'].title, 1)
			WinMaximize(Apps['AHKHelp'].title)
		}
	}
#HotIf