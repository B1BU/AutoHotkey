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

FillMenu(menu, items) {
	for item in items {
		menu.Add(item.name, item.callback)

		if HasProp(item, 'icon')
			menu.SetIcon(item.name, item.icon)
	}
}