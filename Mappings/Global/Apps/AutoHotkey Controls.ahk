#Requires AutoHotkey v2.0

/*	Keybindings
	RAlt + F5			- Reload AutoHotkey script
	RAlt + V			- Edit Autohotkey folder
	RAlt + E			- Open AutoHotkey folder
*/

#Include ..\..\..\Data\Libraries\Sound.ahk
#Include ..\..\..\Data\Libraries\VSCode.ahk

RAlt & F5:: {							; Reload Autohotkey script
	PlaySound('beeplow')
	Sleep(250)
	Run(A_ScriptFullPath)
}

Ralt & v:: VSCode.Open(A_ScriptDir)		; Edit AutoHotkey folder

Ralt & e:: Run(A_ScriptDir)				; Open AutoHotkey folder