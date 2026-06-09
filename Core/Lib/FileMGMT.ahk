#Requires AutoHotkey v2.0

#Include ..\..\Core\Lib\PowerShell.ahk

SymLink(path, target, force := false) {
	cmd :=
		(force ? 'if (Test-Path "' path '") { (Get-Item "' path '").Delete() }; ' : '')
		. 'New-Item -ItemType SymbolicLink -Path "' path '" -Target "' target '"'
	PSRun(cmd, true, true, true, true)
}