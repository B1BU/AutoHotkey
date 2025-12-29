#Requires AutoHotkey v2.0

#Include ..\..\Libraries\Power.ahk

^CtrlBreak:: {
	if KeyWait('CtrlBreak', 'T0.5')
		return
	SoundBeep()

	if GetKeyState('Shift') {
		Power.RestartToBIOS()
	} else {
		Power.Suspend()
	}
}

!Pause:: {
	if KeyWait('Pause', 'T0.5')
		return
	SoundBeep()

	Power.Shutdown()
}

+Pause:: {
	if KeyWait('Pause', 'T0.5')
		return
	SoundBeep()

	Power.Restart()
}