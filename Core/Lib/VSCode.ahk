#Requires AutoHotkey v2.0

#Include ..\Set\Creds.ahk
#Include ..\Set\Apps.ahk

class VSCode {
	static Open(path := '') {
		args := (path) ? ' "' path  '"' : ''
		RunAs(Creds['username'], Creds['password'])
			Run(Apps['VSCode']['target'] args)
		RunAs()
	}
}