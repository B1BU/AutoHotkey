#Requires AutoHotkey v2.0

StrSentence(str) => RegExReplace(str, '^(\PL*\pL)(.*)', '$U1$L2')

Write(str) {
	prevClipboard := ClipboardAll()
		A_Clipboard := str
		Send('^v')
		Sleep(20)
	A_Clipboard := prevClipboard
}

GetSelection() {
	prevClipboard := ClipboardAll()
		A_Clipboard := ''
		Send('^c')
		ClipWait(1)
		selection := A_Clipboard
	A_Clipboard := prevClipboard

	return selection
}