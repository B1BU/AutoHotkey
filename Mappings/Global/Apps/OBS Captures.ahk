#Requires AutoHotkey v2.0

/*	Keybindings
	Ctrl + PrintScreen			- Save Screenshot
	Shift + PrintScreen			- Save Clip
	Ctrl + Shift + PrintScreen	- Start/Stop Recording
*/

#Include ..\..\..\Data\Libraries\Sound.ahk

^PrintScreen:: {				; Screenshot
	KeyWait('Control')
	KeyWait('PrintScreen')

	PlaySound('snap3')

	Send('{F13 Down}')
	Sleep(50)
	Send('{F13 Up}')
}

+PrintScreen:: {				; Clip
	KeyWait('Shift')
	KeyWait('PrintScreen')

	PlaySound('scissors2')

	Send('{F14 Down}')
	Sleep(50)
	Send('{F14 Up}')
}

^+PrintScreen:: {				; Recording
	KeyWait('Control')
	KeyWait('Shift')
	KeyWait('PrintScreen')

	PlaySound('beepbeep')

	Send('{F15 Down}')
	Sleep(50)
	Send('{F15 Up}')
}