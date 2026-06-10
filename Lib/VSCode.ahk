#Requires AutoHotkey v2.0

#Include ..\
#Include Load\Private\Creds.ahk
#Include Load\Apps.ahk

class VSCode {
	static Open(path := '') {
		args := (path) ? ' "' path  '"' : ''
		RunAs(Creds['username'], Creds['password'])
			Run(Apps['VSCode'].path args)
		RunAs()
	}
}