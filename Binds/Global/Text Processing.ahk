#Requires AutoHotkey v2.0

#Include ..\..\
#Include Core\Lib\Extensions.ahk
#Include Core\Lib\Text.ahk
#Include Core\Data\Deprecated\Apps.ahk

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
	[DeprecatedApp.VSCode.title, '^+{NumpadAdd}'],
	[DeprecatedApp.Obsidian.title, '^+{NumpadAdd}']
)

CapsLock & Down:: TextProcessing.Transform(  ; Lower case
	StrLower,
	[DeprecatedApp.VSCode.title, '^+{NumpadSub}'],
	[DeprecatedApp.Obsidian.title, '^+{NumpadSub}']
)

CapsLock & Left:: TextProcessing.Transform(  ; Sentence case
	StrSentence,
	DeprecatedApp.VSCode.title,
	DeprecatedApp.Obsidian.title
)

CapsLock & Right:: TextProcessing.Transform( ; Title case
	StrTitle,
	[DeprecatedApp.VSCode.title, '^+{NumpadDiv}'],
	[DeprecatedApp.Obsidian.title, '^+{NumpadDiv}']
)