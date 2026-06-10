#Requires AutoHotkey v2.0

#Include ..\..\..\
#Include Load\Apps.ahk
#Include Lib\Extensions.ahk
#Include Lib\VSCode.ahk
#Include Lib\Sound.ahk

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

RAlt & s:: Apps['AHK Spy'].Run() ; Open AutoHotkey Window Spy