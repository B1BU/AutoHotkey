#Requires AutoHotkey v2.0

#Include ..\
#Include Lib\PowerShell.ahk

SymLink(path, target, force := false) {
	cmd :=
		(force ? 'if (Test-Path "' path '") { (Get-Item "' path '").Delete() }; ' : '')
		. 'New-Item -ItemType SymbolicLink -Path "' path '" -Target "' target '"'
	PSRun(cmd, true, true, true, true)
}

GetSymlinkTarget(symlink) {
	if !InStr(FileGetAttrib(symlink), "L")
		return ""

	tmp := A_Temp "\ahk_symlink_target.txt"

	symlink := StrReplace(symlink, "'", "''")

	cmd := Format(
		'powershell -NoProfile -Command "(Get-Item -LiteralPath `'{1}`').Target" > "{2}"',
		symlink,
		tmp
	)

	RunWait(A_ComSpec ' /c ' cmd,, "Hide")

	target := Trim(FileRead(tmp), '`r`n`t ')
	FileDelete(tmp)

	return target
}