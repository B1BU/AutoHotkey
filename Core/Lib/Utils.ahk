#Requires AutoHotkey v2.0

#Include Extensions.ahk

global A_AhkDir := DirUp(A_LineFile, 1 + 2)

Spam(time, func, args*) {
	loop {
		func(args*)
		Sleep(25)
		if (A_Index * 50 >= time)
			break
	}
}

Profile(function, args := '', calls := 1) {
	if calls < 1
		return

	start := A_TickCount

	if args == ''
		args := []

	loop calls - 1
		function(args*)
	result := function(args*)
	if result is not String or result is not Integer
		result := ''

	miliseconds := A_TickCount - start

	MsgBox(result, function.Name ': ' calls ' function calls in ' miliseconds 'ms')
}