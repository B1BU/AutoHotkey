#Requires AutoHotkey v2.0

#Include ..\Extensions\Object.ahk

class AppClass {
	__New(params) {
		if (params is string) {
			params := {exe: params}
		}

		this.exe		:= params.Get('exe')
		this.title		:= params.Get('title', 'ahk_exe ' this.exe)
		this.target		:= params.Get('target', this.exe)

		this.Open		:= params.Get('Open',
			(this) {
				Run(this.target)
			}
		)

		this.Focus		:= params.Get('Focus',
			(this) {
				try WinActivate(this.title)
			}
		)

		this.Minimize	:= params.Get('Minimize',
			(this) {
				try WinMinimize(this.title)
			}
		)

		this.Close		:= params.Get('Close',
			(this) {
				try WinClose(this.title)
			}
		)

		this.Kill		:= params.Get('Kill',
			(this) {
				try ProcessClose(this.exe)
			}
		)

		this.Restart	:= params.Get('Restart',
			(this) {
				this.Kill()
				WinWaitClose(this.title,, 3)
				this.Open()
			}
		)
	}

	Toggle(close := 0) {
		if (WinActive(this.title)) {
			if (close) {
				this.Close()
			} else {
				this.Minimize()
			}
		} else if (WinExist(this.title)) {
			this.Focus()
		} else {
			this.Open()
		}
	}
}