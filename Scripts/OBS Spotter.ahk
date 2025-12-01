#Requires AutoHotkey v2.0
#SingleInstance Force
#NoTrayIcon

obs_exe := 'obs64.exe'

obs_title := 'ahk_exe ' obs_exe

obs_dir := A_ProgramFiles '\obs-studio\bin\64bit'
obs_exe_path := obs_dir '\' obs_exe

obs_cmd := '"' obs_exe_path '" --disable-shutdown-check  --minimize-to-tray --startreplaybuffer'

obs_sentinel_dir := A_AppData '\obs-studio\.sentinel'

obs_crash_title := 'OBS has crashed! ahk_exe obs64.exe'

StartOBS() {
	Run(obs_cmd, obs_dir)
	DirDelete(obs_sentinel_dir, true)
}

loop {
	if WinExist(obs_crash_title) {
		WinWaitClose(obs_crash_title)
		Sleep(10000)
		StartOBS()
	}
	Sleep(3000)
}