#Requires AutoHotkey v2.0

/*	Keybindings
	Ctrl + Alt + V		- Paste as symlink
*/

global explorer_title := 'ahk_class CabinetWClass'
global desktop_title := 'ahk_class WorkerW'

Array.Prototype.Join := (this, sep := ', ') {
	if (this.Length == 1) {
		return this[1]
	}

	result := ''
	for index, value in this {
		if (index > 1) {
			result .= sep
		}
		result .= this[A_Index]
	}
	return result
}

class Explorer {
	static GetHwnd() => WinActive(explorer_title)

	static GetActivePath() {
		if (explorerHwnd := Explorer.GetHwnd()) {
			for window in ComObject('Shell.Application').Windows {
				if (window.hwnd == explorerHwnd) {
					return window.Document.Folder.Self.Path
				}
			}
		} else if (WinActive(desktop_title)) {
			return A_Desktop
		}
	}

	static PasteSymlink() {
		if not (activePath := Explorer.GetActivePath()) {
			return
		}

		commands := []
		loop parse A_Clipboard, '`n', '`r' {
			if not (clipPath := A_LoopField) {
				return
			}

			SplitPath(clipPath, &clipPathName)

			baseLinkPath := activePath '\' clipPathName

			linkPath := baseLinkPath
			loop {
				if not (FileExist(linkPath)) {
					break
				}
				linkPath := baseLinkPath ' (' A_Index ')'
			}

			isDir := DirExist(clipPath)

			command := 'mklink ' ((isDir) ? '/D ' : '') '"' linkPath '" "' clipPath '"'

			commands.Push(command)
		}

		if not commands {
			return
		}

		args := (commands) ? ' /C ' commands.Join(' & ') : ''

		try Run('*runas ' A_ComSpec args, A_WinDir '\System32')
	}
}

#HotIf (WinActive(explorer_title) or WinActive(desktop_title))
	^!v:: Explorer.PasteSymlink()	; Paste as symlink