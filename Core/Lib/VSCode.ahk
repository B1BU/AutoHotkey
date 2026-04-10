#Requires AutoHotkey v2.0

#Include ..\..\
#Include Private\Set\Creds.ahk
#Include Core\Set\Apps.ahk

class VSCode {
	static Open(path := '') {
		args := (path) ? ' "' path  '"' : ''
		RunAs(Creds['username'], Creds['password'])
			Run(Apps['VSCode'].path args)
		RunAs()
	}
}