#Requires AutoHotkey v2.0

#Include ..\..\Core\Lib\Extensions.ahk
#Include ..\..\Core\Lib\Utils.ahk

global AppPlaceholders := Map(
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

ParseAppsMap(apps_map) {
	new_apps_map := apps_map
	for app, data in apps_map {
		new_apps_map[app]['exe']    := data.Has('exe')    ? ResolvePlaceholders(new_apps_map[app]['exe'],    AppPlaceholders) : ''
		new_apps_map[app]['title']  := data.Has('title')  ? ResolvePlaceholders(new_apps_map[app]['title'],  AppPlaceholders) : 'ahk_exe ' . data['exe']
		new_apps_map[app]['target'] := data.Has('target') ? ResolvePlaceholders(new_apps_map[app]['target'], AppPlaceholders) : data['exe']
	}
	return apps_map
}

AppCheck(app) {
	if !Apps.Has(app)
		Throw('App ' . app . ' is not defined.')
}

AppRun(app, admin := false, args := '', working_dir := '') {
	AppCheck(app)

	run_cmd := Apps[app]['target']

	if (args)
		run_cmd .= ' ' . args

	if (admin)
		run_cmd := '*runas ' run_cmd

	if (working_dir) {
		Run(run_cmd, working_dir)
		return
	}

	Run(run_cmd)
}

AppFocus(app) {
	AppCheck(app)

	try WinActivate(Apps[app]['title'])
}

AppMinimize(app) {
	AppCheck(app)

	try WinMinimize(Apps[app]['title'])

	WinActivate('ahk_class WorkerW')
}

AppClose(app) {
	AppCheck(app)

	try WinClose(Apps[app]['title'])
}

AppKill(app) {
	AppCheck(app)

	try ProcessClose(Apps[app]['exe'])
}

AppRestart(app) {
	AppCheck(app)

	AppKill(app)
	WinWaitClose(Apps[app]['title'],, 3)
	AppRun(app)
}

AppToggle(app, close := 0) {
	AppCheck(app)

	app_title := Apps[app]['title']
	if WinActive(app_title) {
		if (close) {
			AppClose(app)
		} else {
			AppMinimize(app)
		}
	} else if (WinExist(app_title)) {
		AppFocus(app)
	} else {
		AppRun(app)
	}
}

Apps := Map()