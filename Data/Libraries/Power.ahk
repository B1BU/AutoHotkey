#Requires AutoHotkey v2.0

#Include ..\Extensions\Built-In.ahk

class Power {
	static Logoff()   => Shutdown(0)

	static Shutdown() => Shutdown(1)

	static Restart()  => Shutdown(2)

	static Suspend()  => DllCall('PowrProf\SetSuspendState', 'Int', 0, 'Int', 0, 'Int', 0)

	static RestartToBIOS() {
		try Run('*runas shutdown.exe /r /fw /t 0', A_System32)
	}
}