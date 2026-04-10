#Requires AutoHotkey v2.0

#Include ..\..\
#Include Core\Lib\Patches.ahk
#Include Core\Lib\Utils.ahk
#Include Core\Lib\Icon.ahk
#Include Core\Lib\Power.ahk

ShutdownMenu := Menu()
FillMenu(ShutdownMenu, [
	{
		name: 'Shutdown',
		icon: Icon('Power'),
		callback: (*) => Power.Shutdown()
	},
	{
		name: 'Suspend',
		icon: Icon('Moon'),
		callback: (*) => Power.Suspend()
	},
	{
		name: 'Restart',
		icon: Icon('RotateCCW'),
		callback: (*) => Power.Restart()
	},
	{
		name: 'BIOS',
		icon: Icon('CPU'),
		callback: (*) => Power.RestartToBIOS()
	},
])

^CtrlBreak:: ShutdownMenu.Show()