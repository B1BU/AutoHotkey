#Requires AutoHotkey v2.0

#Include ..\..\
#Include Load\Apps.ahk
#Include Lib\Text.ahk

class Minecraft {
	static Send(text) {
		Send('{t}')
		Sleep(100)
		Write(text)
		Send('{Enter}')
	}
}

#HotIf (GetKeyState('ScrollLock', 'T') and WinActive(Apps['Minecraft'].title))
	F5:: Minecraft.Send('/reload') ; Reload datapack
	+k:: Minecraft.Send('/kill')   ; Commit suicide
#HotIf