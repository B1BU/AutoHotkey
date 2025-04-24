#Requires AutoHotkey v2.0

#Include ..\Extensions\Array.ahk
#Include ..\Env.ahk

class CMD {
	static Open(adm := false, args := '') {
		args := (args) ? ' ' args : ''

		if (adm) {
			try Run('*runas ' A_ComSpec args, B_System32)
		} else {
			Run(A_ComSpec args, B_UserProfile)
		}
	}

	static Run(adm := false, commands*) {
		if not (commands) {
			return
		}

		args := (commands) ? ' /C ' commands.Join(' & ') : ''

		CMD.Open(adm, args)
	}
}