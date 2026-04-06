#Requires AutoHotkey v2.0

#Include ..\..\..\Core\Lib\Sound.ahk
#Include ..\..\..\Core\Lib\VSCode.ahk
#Include ..\..\..\Core\Data\Apps.ahk

Ralt & v:: VSCode.Open(A_ScriptDir) ; Edit AutoHotkey folder

Ralt & e:: Run(A_ScriptDir)         ; Open AutoHotkey folder

RAlt & F5:: {                       ; Reload Autohotkey script
	PlaySound('beeplow')
	Sleep(250)
	Run(A_ScriptFullPath)
}

RAlt & F4:: {                       ; Kill AutoHotkey
	PlaySound('beeplow')
	Sleep(250)
	App.AHK.kill()
}