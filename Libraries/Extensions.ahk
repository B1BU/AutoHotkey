#Requires AutoHotkey v2.0

global A_System32        := A_WinDir '\System32'
global A_ProgramFilesx86 := A_ProgramFiles ' (x86)'
global A_UserProfile     := EnvGet('USERPROFILE')

global A_AppDataRoot     := A_UserProfile '\AppData'
global A_AppDataLocal    := A_AppDataRoot '\Local'
global A_AppDataLocalLow := A_AppDataRoot '\LocalLow'

StrSentence(str) {
	return RegExReplace(str, '^(\PL*\pL)(.*)', '$U1$L2')
}

StrSlice(str, start, length := '') {
	return ArrJoin(ArrSlice(StrSplit(str), start, length))
}

ObjGet(obj, prop, default := '') {
	for key, value in ObjOwnProps(obj)
		if key == prop
			return value
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

IsType(obj, check_types*) {
	obj_type := Type(obj)

	for check_type in check_types
		if obj_type == check_type.Prototype.__Class
			return true
	return false
}
