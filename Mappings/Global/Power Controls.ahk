#Requires AutoHotkey v2.0

/*	Keybindings
	Alt + PauseBreak			- Shut Down
	Ctrl + PauseBreak			- Suspend
	Shift + PauseBreak			- Restart
	Shift + Alt + PauseBreak	- Restart to BIOS
*/

#Include ..\..\Data\Libraries\Power.ahk

!Pause:: {		; Shut down
	if !KeyWait('Pause', 'T0.5') {
		SoundBeep()
		Power.Shutdown()
		KeyWait('Pause')
	}
}

^CtrlBreak:: {	; Suspend
	if !KeyWait('CtrlBreak', 'T0.5') {
		SoundBeep()
		Power.Suspend()
		KeyWait('CtrlBreak')
	}
}

+Pause:: {		; Restart
	if !KeyWait('Pause', 'T0.5') {
		SoundBeep()
		Power.Restart()
		KeyWait('Pause')
	}
}

+!Pause:: {		; Restart to BIOS
	if !KeyWait('Pause', 'T0.5') {
		SoundBeep()
		Power.Restart(1)
		KeyWait('Pause')
	}
}