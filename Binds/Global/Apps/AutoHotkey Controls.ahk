#Requires AutoHotkey v2.0

#Include ..\..\..\Core\Lib\Utils.ahk
#Include ..\..\..\Core\Data\Load\Apps.ahk
#Include ..\..\..\Core\Lib\VSCode.ahk
#Include ..\..\..\Core\Lib\Sound.ahk

RAlt & F5:: {                       ; Reload Autohotkey script
	PlaySound('beeplow')
	Sleep(250)
	Run(A_ScriptFullPath)
}

RAlt & F4:: {                       ; Kill AutoHotkey
	PlaySound('beeplow')
	Sleep(250)
	AppKill('AHK')
}

RAlt & e:: Run(A_AhkDir)            ; Open AutoHotkey folder

RAlt & v:: VSCode.Open(A_AhkDir)    ; Edit AutoHotkey folder

RAlt & s:: AppRun('AHKSpy')         ; Open AutoHotkey Window Spy