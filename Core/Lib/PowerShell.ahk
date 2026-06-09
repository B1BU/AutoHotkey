#Requires AutoHotkey v2.0

PSRun(cmd, adm := false, hidden := true, exit := true, wait := true) {
	cmd := StrReplace(cmd, '"', '"""')

	target :=
		(adm ? '*RunAs ' : '')
		. 'powershell.exe'
		. (!exit ? ' -NoExit' : '')
		. ' -Command ' cmd

	if wait
		return RunWait(target,, hidden ? 'Hide' : unset)

	Run(target,, hidden ? 'Hide' : unset)
}