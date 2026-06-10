#Requires AutoHotkey v2.0

#Include ..\
#Include Lib\Extensions.ahk
#Include Lib\Utils.ahk
#Include Lib\Files.ahk

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
		'AhkRoot',         A_AhkRoot
	)

	__New(path, args, exe, title, data) {
		path  := ResolvePlaceholders(path, AppClass.placeholders)
		args  := ResolvePlaceholders(args, AppClass.placeholders)
		exe   := ResolvePlaceholders(exe, AppClass.placeholders)
		title := ResolvePlaceholders(title, AppClass.placeholders)
		data  := ResolvePlaceholders(data, AppClass.placeholders)

		if (!path and exe) {
			path := exe
		} else if (!exe and path) {
			SplitPath(path, &exe)
		}

		if (!title and exe) {
			title := 'ahk_exe ' . exe
		}

		SplitPath(data,,,, &data_name)

		this.path      := path
		this.args      := args
		this.exe       := exe
		this.title     := title
		this.data      := data
		this.data_name := data_name
	}

	Run(
		admin := false,
		args := '',
		working_dir := '',
		profile := 'default'
	) {
		this.SetProfile(profile)

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

	Restart(
		admin := false,
		args := '',
		working_dir := '',
		profile := 'default'
	) {
		this.Kill()
		WinWaitClose(this.title)
		this.Run(admin, args, working_dir, profile)
	}

	Toggle(
		close := false,
		admin := false,
		args := '',
		working_dir := '',
		profile := 'default'
	) {
		if WinActive(this.title) {
			if close
				this.Close()
			else
				this.Minimize()
		} else if WinExist(this.title) {
			this.Focus()
		} else {
			this.Run(admin, args, working_dir, profile)
		}
	}

	SetProfile(profile := 'default') {
		if (!data_path := this.data)
			return

		profile_denominator := '.profile.'

		profile_path := data_path profile_denominator profile

		if (data_path_attrs := DirExist(data_path)) {
			if (!InStr(data_path_attrs, 'D'))
				return

			if (InStr(data_path_attrs, 'L')) {
				symlink_target := GetSymlinkTarget(data_path)
				if (symlink_target == profile_path)
					return
			} else {
				if (profile == 'default')
					return
				DirMove(data_path, data_path profile_denominator 'default')
			}
		}

		if (!DirExist(profile_path)) {
			DirCreate(profile_path)
		}

		this.Kill()
		while true {
			try {
				SymLink(data_path, profile_path, true)
				break
			}
		}
	}
}

/**
 * @returns {Map<String, AppClass>}
 */
GetAppMap(app_map) {
	result := Map()

	for app, data in app_map {
		path  := data.Get('path', '')
		args  := data.Get('args', '')
		exe   := data.Get('exe', '')
		title := data.Get('title', '')
		data  := data.Get('data', '')
		result[app] := AppClass(path, args, exe, title, data)
	}

	return result
}