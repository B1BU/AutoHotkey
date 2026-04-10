#Requires AutoHotkey v2.0
#SingleInstance Force
#NoTrayIcon

#Include ..\Data\Paths\Apps.ahk

GetScreens() {
	return SysGet(78) '-' SysGet(79) '-' SysGet(80)
}

CheckExplorer() {
	ProcessWaitClose(ProcessWait('explorer.exe'))
	Run(taskbarx, taskbarx_dir)
}

CheckScreens() {
	global screens
	screensNew := GetScreens()
	if (screens !== screensNew) {
		screens := screensNew
		Run(taskbarx, taskbarx_dir)
	}
}

screens := ''

SetTimer(CheckExplorer, 1)
SetTimer(CheckScreens, 1000)