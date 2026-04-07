#Requires AutoHotkey v2.0

#Include ..\..\Core\Lib\Extensions.ahk
#Include ..\..\Core\Lib\Utils.ahk

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

	__New(exe, title, target) {
		this.exe    := exe    ? ResolvePlaceholders(exe,    AppClass.placeholders) : ''
		this.title  := title  ? ResolvePlaceholders(title,  AppClass.placeholders) : 'ahk_exe ' . this.exe
		this.target := target ? ResolvePlaceholders(target, AppClass.placeholders) : this.exe
	}

	Run(args := '', admin := false, working_dir := '') {
		run_cmd := this.target

		if args
			run_cmd .= ' ' . args

		if admin
			run_cmd := '*runas ' . run_cmd

		if working_dir
			return Run(run_cmd, working_dir)
		Run(run_cmd)
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
		result[app] := AppClass(info.Get('exe', ''), info.Get('title', ''), info.Get('target', ''))
	return result
}