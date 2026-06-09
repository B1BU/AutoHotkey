#Requires AutoHotkey v2.0

#Include ..\..\
#Include Core\Lib\Extensions.ahk
#Include Core\Lib\Utils.ahk

class AppClass {
	static placeholders := Map(
		'ProgramFiles',    A_ProgramFiles,
		'ProgramFilesx86', A_ProgramFilesx86,
		'AppData',         A_AppData,
		'AppDataRoot',     A_AppDataRoot,
		'AppDataCommon',   A_AppDataCommon,
		'AppDataLocal',    A_AppDataLocal,
		'AppDataLocalLow', A_AppDataLocalLow,
		'AppComSpec',      A_ComSpec,
		'AhkDir',          A_AhkDir
	)

	__New(path, args, exe, title) {
		path  := ResolvePlaceholders(path, AppClass.placeholders)
		args  := ResolvePlaceholders(args, AppClass.placeholders)
		exe   := ResolvePlaceholders(exe, AppClass.placeholders)
		title := ResolvePlaceholders(title, AppClass.placeholders)

		if (!path and exe) {
			path := exe
		} else if (!exe and path) {
			SplitPath(path, &exe)
		}

		if (!title and exe) {
			title := 'ahk_exe ' . exe
		}

		this.path  := path
		this.args  := args
		this.exe   := exe
		this.title := title
	}

	Run(admin := false, args := '', working_dir := '') {
		target := (admin ? '*runas "' : '"') . this.path . '"'

		if (this.args)
			target .= ' ' . this.args

		if (args)
			target .= ' ' . args

		if (working_dir) {
			try Run(target, working_dir)
			return
		}

		try Run(target)
	}

	Focus() {
		try WinActivate(this.title)
	}

	Minimize() {
		try WinMinimize(this.title)
		WinActivate('ahk_class WorkerW')
	}

	Close() {
		try WinClose(this.title)
	}

	Kill() {
		try ProcessClose(this.exe)
	}

	Restart() {
		this.Kill()
		WinWaitClose(this.title)
		this.Run()
	}

	Toggle(close := false) {
		if WinActive(this.title) {
			if close
				this.Close()
			else
				this.Minimize()
		} else if WinExist(this.title) {
			this.Focus()
		} else {
			this.Run()
		}
	}
}

AppMap(app_map) {
	result := Map()
	for app, info in app_map
		result[app] := AppClass(info.Get('path', ''), info.Get('args', ''), info.Get('exe', ''), info.Get('title', ''))
	return result
}