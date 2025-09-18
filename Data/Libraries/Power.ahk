#Requires AutoHotkey v2.0

#Include ..\Env.ahk

class Power {
	static Logoff()   => Shutdown(0)

	static Shutdown() => Shutdown(1)

	static Restart()  => Shutdown(2)

	static Suspend()  => DllCall('PowrProf\SetSuspendState', 'Int', 0, 'Int', 0, 'Int', 0)

	static RestartToBIOS() {
		try Run('*runas shutdown.exe /r /fw /t 0', B_System32)
	}
}