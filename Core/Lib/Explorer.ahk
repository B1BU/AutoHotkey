#Requires AutoHotkey v2.0

#Include Path.ahk
#Include Cmd.ahk
#Include ..\Set\Apps.ahk

class Explorer {
	static GetHwnd() => WinActive(Apps['Explorer'].title)

	static GetActivePath() {
		if (explorerHwnd := Explorer.GetHwnd()) {
			for window in ComObject('Shell.Application').Windows {
				if (window.hwnd == explorerHwnd) {
					return window.Document.Folder.Self.Path
				}
			}
		} else if (WinActive(Apps['Desktop'].title)) {
			return A_Desktop
		}
	}

	static PasteSymlink() {
		if not (activePath := Explorer.GetActivePath()) {
			return
		}

		commands := []
		loop parse A_Clipboard, '`n', '`r' {
			if not (clipPath := Path(A_LoopField)) {
				return
			}

			baseLinkPath := Path.Join(activePath, clipPath.name)

			linkPath := baseLinkPath
			loop {
				if not (FileExist(linkPath)) {
					break
				}
				linkPath := baseLinkPath ' (' A_Index ')'
			}

			isDir := DirExist(clipPath.path)

			command := 'mklink ' ((isDir) ? '/D ' : '') '"' linkPath '" "' clipPath.path '"'

			commands.Push(command)
		}

		Cmd.Run(1, commands*)
	}

	static Restart() => Apps['Explorer'].Kill()
}