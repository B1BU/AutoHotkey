#Requires AutoHotkey v2.0

#Include Extensions.ahk

; From https://www.reddit.com/r/AutoHotkey/comments/1e9bjlv/comment/led86ap
SetPreferredAppMode(option := ''){
	static options := Map()
	if !options.Count {
		options.CaseSense := false
		options.Set(
			'Default', 0,
			'AllowDark', 1,
			'ForceDark', 2,
			'ForceLight', 3,
			'Max', 4
		)
		options.Default := A_DarkMode
	}
	hModule := DllCall('kernel32.dll\GetModuleHandle', 'str', 'uxtheme.dll', 'ptr')
	; These are undocumented functions. They must be called via ordinal.
	SetPreferredAppMode := DllCall('kernel32.dll\GetProcAddress', 'ptr', hModule, 'ptr', 135, 'ptr')
	DllCall(SetPreferredAppMode, 'int', options.Get(option))
	DllCall('kernel32.dll\FreeLibrary', 'ptr', hModule)
}

FlushMenuThemes() {
	hModule := DllCall('kernel32.dll\GetModuleHandle', 'str', 'uxtheme.dll', 'ptr')
	; Undocumented functions must be called via ordinal.
	FlushMenuThemes := DllCall('kernel32.dll\GetProcAddress', 'ptr', hModule, 'ptr', 136, 'ptr')
	DllCall(FlushMenuThemes)
	DllCall('kernel32.dll\FreeLibrary', 'ptr', hModule)
}

; Allows for dark mode ui
SetPreferredAppMode()
FlushMenuThemes()