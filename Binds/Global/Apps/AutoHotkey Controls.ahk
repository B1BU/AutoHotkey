#Requires AutoHotkey v2.0

#Include ..\..\..\Core\Set\Apps.ahk
#Include ..\..\..\Core\Lib\Utils.ahk
#Include ..\..\..\Core\Lib\VSCode.ahk
#Include ..\..\..\Core\Lib\Sound.ahk

RAlt & F5:: {                    ; Reload Autohotkey script
	PlaySound('beeplow')
	Sleep(250)
	Run(A_ScriptFullPath)
}

RAlt & F4:: {                    ; Kill AutoHotkey
	PlaySound('beeplow')
	Sleep(250)
	Apps['AHK'].Kill()
}

RAlt & e:: Run(A_AhkDir)         ; Open AutoHotkey folder

RAlt & v:: VSCode.Open(A_AhkDir) ; Edit AutoHotkey folder

RAlt & s:: Apps['AHKSpy'].Run()   ; Open AutoHotkey Window Spy