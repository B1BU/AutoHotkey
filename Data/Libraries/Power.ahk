#Requires AutoHotkey v2.0

#Include ..\Env.ahk

class Power {
	static Shutdown() => Shutdown(1)

	static Suspend() => DllCall('PowrProf\SetSuspendState', 'Int', 0, 'Int', 0, 'Int', 0)

	static Restart(mode := 0) {
		if (mode == 1) {
			try Run('*runas shutdown /r /fw /t 0', B_System32)
		} else {
			Shutdown(2)
		}
	}
}