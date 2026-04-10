#Requires AutoHotkey v2.0

#Include ..\..\Private\Set\Creds.ahk
#Include ..\Set\Apps.ahk

class VSCode {
	static Open(path := '') {
		args := (path) ? ' "' path  '"' : ''
		RunAs(Creds['username'], Creds['password'])
			Run(Apps['VSCode'].path args)
		RunAs()
	}
}