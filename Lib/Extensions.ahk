#Requires AutoHotkey v2.0

A_System32        := A_WinDir '\System32'
A_ProgramFilesx86 := A_ProgramFiles ' (x86)'
A_UserProfile     := EnvGet('USERPROFILE')

A_AppDataRoot     := A_UserProfile '\AppData'
A_AppDataLocal    := A_AppDataRoot '\Local'
A_AppDataLocalLow := A_AppDataRoot '\LocalLow'

A_DarkMode        := !RegRead('HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize', 'AppsUseLightTheme')

A_AhkRoot         := DirUp(A_LineFile, 1 + 1)

DirUp(path, levels := 1) {
    Loop levels
        path := RegExReplace(path, "[\\/][^\\/]+$")
    return path
}

StrSentence(str) {
	return RegExReplace(str, '^(\PL*\pL)(.*)', '$U1$L2')
}

StrSlice(str, start, length := '') {
	return ArrJoin(ArrSlice(StrSplit(str), start, length))
}

ObjGet(obj, prop, default := unset) {
	for key, value in ObjOwnProps(obj)
		if key == prop
			return value

	if IsSet(default)
		return default
}

ArrSlice(arr, start, length := '') {
	if start > arr.Length
		return []

	if start < 0
		start += arr.Length

	if length == ''
		length := arr.Length - start
	else if length < 0
		length += arr.Length - start

	length := Min(length, arr.Length - start)

	result := []
	loop length
		result.Push(arr[start + A_Index])

	return result
}

ArrJoin(arr, sep := '') {
	if !arr.Length
		return ''

	for i, value in arr
		arr[i] := String(value)

	result := ''
	if sep {
		result .= arr[1]
		loop arr.Length - 1
			result .= sep arr[A_Index + 1]
	} else {
		loop arr.Length
			result .= arr[A_Index]
	}

	return result
}

InArray(value, arr) {
	for _value in arr
		if _value == value
			return true
	return false
}

WinMoveMonitor(title := "A", monitor := 1) {
	MonitorGetWorkArea(monitor, &left, &top)
	WinMove(left, top, , , title)
}