#Requires AutoHotkey v2.0

#Include ..\..\Data\Libraries\Power.ahk

*^CtrlBreak:: {
	SoundBeep()
	if GetKeyState('Shift') {
		Power.RestartToBIOS()
	} else {
		Power.Suspend()
	}
}

!Pause:: {
	SoundBeep()
	Power.Shutdown()
}

+Pause:: {
	SoundBeep()
	Power.Restart()
}