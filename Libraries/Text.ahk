#Requires AutoHotkey v2.0

Write(str) {
	prev_clipboard := ClipboardAll()
		A_Clipboard := str
		Send('^v')
		Sleep(20)
	A_Clipboard := prev_clipboard
}

GetSelection() {
	prev_clipboard := ClipboardAll()
		A_Clipboard := ''
		Send('^c')
		ClipWait(1)
		selection := A_Clipboard
	A_Clipboard := prev_clipboard

	return selection
}