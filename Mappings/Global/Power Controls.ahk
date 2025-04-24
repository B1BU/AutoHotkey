#Requires AutoHotkey v2.0

/*	Keybindings
	Alt + PauseBreak			- Shut Down
	Ctrl + PauseBreak			- Suspend
	Shift + PauseBreak			- Restart
	Shift + Alt + PauseBreak	- Restart to BIOS
*/

#Include ..\..\Data\Libraries\Power.ahk

!Pause::		Power.Shutdown()	; Shut down
^CtrlBreak::	Power.Suspend()		; Suspend
+Pause::		Power.Restart()		; Restart
+!Pause::		Power.Restart(1)	; Restart to BIOS