#Requires AutoHotkey v2.0

#Include ..\..\
#Include Lib\Extensions.ahk
#Include Lib\Text.ahk
#Include Load\Apps.ahk

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

CapsLock & Up:: TextProcessing.Transform(    ; Upper case
	StrUpper,
	[Apps['VSCode'].title, '^+{NumpadAdd}'],
	[Apps['Obsidian'].title, '^+{NumpadAdd}']
)

CapsLock & Down:: TextProcessing.Transform(  ; Lower case
	StrLower,
	[Apps['VSCode'].title, '^+{NumpadSub}'],
	[Apps['Obsidian'].title, '^+{NumpadSub}']
)

CapsLock & Left:: TextProcessing.Transform(  ; Sentence case
	StrSentence,
	Apps['VSCode'].title,
	Apps['Obsidian'].title
)

CapsLock & Right:: TextProcessing.Transform( ; Title case
	StrTitle,
	[Apps['VSCode'].title, '^+{NumpadDiv}'],
	[Apps['Obsidian'].title, '^+{NumpadDiv}']
)