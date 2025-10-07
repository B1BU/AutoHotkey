#Requires AutoHotkey v2.0
#SingleInstance Force

SoundBeep(1000)

F4:: {
	SoundBeep(2000)
	ExitApp()
}

title := "ahk_exe Tiny Terry's Turbo Trip.exe"
state := false

SetState(value) {
	global state

	if value == 't'
		value := !state

	state := value

	SetCapsLockState(state)
}

Main() {
	if not state
		return

	if not WinActive(title)
		return SetState(false)

	Send('{Space}')
	Sleep(25)
}

#HotIf WinActive(title)
~Space:: {
	SoundBeep()
	SetState('t')
	MouseMove(1920, 1080)
}

loop
	Main()