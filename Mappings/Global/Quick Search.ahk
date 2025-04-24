#Requires AutoHotkey v2.0

/*	Keybindings
	App + Enter		- Search selection / Open URL
*/

#Include ..\..\Data\Libraries\Text.ahk
#Include ..\..\Data\Libraries\URL.ahk

AppsKey & Enter:: {		; Search selection / Open URL
	if not (selection := GetSelection()) {
		return
	}

	if (URL.IsValid(selection)) {
		address := (URL.HasProtocol(selection)) ? selection : 'https://' selection
	} else {
		address := 'https://www.google.com/search?q=' RegExReplace(selection, '\s+', '+')
	}

	Run(address)
}