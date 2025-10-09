#Requires AutoHotkey v2.0

#Include Extensions.ahk

class AppClass {
	__New(params) {
		if (params is string) {
			params := {exe: params}
		}

		this.exe		:= ObjGet(params, 'exe')
		this.title		:= ObjGet(params, 'title', 'ahk_exe ' this.exe)
		this.target		:= ObjGet(params, 'target', this.exe)

		this.Open		:= ObjGet(params, 'Open',
			(this) {
				Run(this.target)
			}
		)

		this.Focus		:= ObjGet(params, 'Focus',
			(this) {
				try WinActivate(this.title)
			}
		)

		this.Minimize	:= ObjGet(params, 'Minimize',
			(this) {
				try WinMinimize(this.title)
			}
		)

		this.Close		:= ObjGet(params, 'Close',
			(this) {
				try WinClose(this.title)
			}
		)

		this.Kill		:= ObjGet(params, 'Kill',
			(this) {
				try ProcessClose(this.exe)
			}
		)

		this.Restart	:= ObjGet(params, 'Restart',
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