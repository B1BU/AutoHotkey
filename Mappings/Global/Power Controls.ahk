/*
	[KEYBINDINGS]
	Ctrl         + PauseBreak : Suspend
	Alt          + PauseBreak : Shut Down
	Shift        + PauseBreak : Restart
	Ctrl + Shift + PauseBreak : Restart to BIOS
*/

#Requires AutoHotkey v2.0

#Include ..\..\Data\Libraries\Power.ahk

*^CtrlBreak:: {
	SoundBeep()
	if GetKeyState('Shift') {
		; Restart to BIOS
		Power.Restart(1)
	} else {
		; Suspend
		Power.Suspend()
	}
}

!Pause:: {
	; Shut down
	SoundBeep()
	Power.Shutdown()
}

+Pause:: {
	; Restart
	SoundBeep()
	Power.Restart()
}