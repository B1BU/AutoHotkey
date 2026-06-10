#Requires AutoHotkey v2.0

#Include Extensions.ahk

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

		args := (commands) ? ' /C ' ArrJoin(commands, ' & ') : ''

		Cmd.Open(adm, args)
	}
}