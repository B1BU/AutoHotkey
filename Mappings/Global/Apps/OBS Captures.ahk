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

	Send('{F13 Down}')
	Sleep(50)
	Send('{F13 Up}')

	PlaySound('snap3')
}

+PrintScreen:: {				; Clip
	KeyWait('Shift')
	KeyWait('PrintScreen')

	Send('{F14 Down}')
	Sleep(50)
	Send('{F14 Up}')

	PlaySound('scissors2')
}

^!PrintScreen:: {				; Recording
	KeyWait('Control')
	KeyWait('Alt')
	KeyWait('PrintScreen')

	Send('{F15 Down}')
	Sleep(50)
	Send('{F15 Up}')

	PlaySound('beepbeep')
}