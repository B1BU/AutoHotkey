#Requires AutoHotkey v2.0

#Include ..\Extensions\Built-In.ahk
#Include ..\Extensions\Array.ahk

class Cmd {
	static Open(adm := false, args := '') {
		args := (args) ? ' ' args : ''

		if (adm) {
			try Run('*runas ' A_ComSpec args, A_System32)
		} else {
			Run(A_ComSpec args, A_UserProfile)
		}
	}

	static Run(adm := false, commands*) {
		if not (commands) {
			return
		}

		args := (commands) ? ' /C ' commands.Join(' & ') : ''

		Cmd.Open(adm, args)
	}
}