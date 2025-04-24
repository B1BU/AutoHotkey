#Requires AutoHotkey v2.0

/*	Keybindings
	Caps Lock + Up		- Convert selection to upper case
	Caps Lock + Right	- Convert selection to title case
	Caps Lock + Left	- Convert selection to sentence case
	Caps Lock + Down	- Convert selection to lower case
*/

#Include ..\..\Data\Libraries\Text.ahk

#Include ..\..\Data\Apps.ahk

class TextProcessing {
	static Transform(transformation, exceptions*) {
		for exception in exceptions {
			title := (exception is Array and exception.Length >= 1) ? exception[1] : exception

			if (WinActive(title)) {
				keybind := (exception is Array and exception.Length >= 2) ? exception[2] : ''
				if (keybind) {
					Send(keybind)
				}
				return
			}
		}

		if (not (selection := GetSelection()) or ((result := transformation(selection)) == selection)) {
			return
		}

		Write(result)
	}
}

CapsLock & Up::		TextProcessing.Transform(	; Upper case
	StrUpper,
	[App.VSCode.title, '^+{NumpadAdd}'],
	[App.Obsidian.title, '^+{NumpadAdd}']
)

CapsLock & Down::	TextProcessing.Transform(	; lower case
	StrLower,
	[App.VSCode.title, '^+{NumpadSub}'],
	[App.Obsidian.title, '^+{NumpadSub}']
)

CapsLock & Left::	TextProcessing.Transform(	; Sentence case
	StrSentence,
	App.VSCode.title,
	App.Obsidian.title
)

CapsLock & Right::	TextProcessing.Transform(	; Title case
	StrTitle,
	[App.VSCode.title, '^+{NumpadDiv}'],
	[App.Obsidian.title, '^+{NumpadDiv}']
)