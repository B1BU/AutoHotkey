#Requires AutoHotkey v2.0

#Include ..\Data\Private\Creds.ahk
#Include ..\Data\Apps.ahk

class VSCode {
	static Open(path := '') {
		args := (path) ? ' "' path  '"' : ''
		RunAs(Creds.username, Creds.password)
			Run(App.VSCode.target args)
		RunAs()
	}
}