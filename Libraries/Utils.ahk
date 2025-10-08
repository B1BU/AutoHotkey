#Requires AutoHotkey v2.0

Spam(time, func, params*) {
	loop {
		func(params*)
		Sleep(25)
		if (A_Index * 50 >= time)
			break
	}
}