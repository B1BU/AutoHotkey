#Requires AutoHotkey v2.0

/*	Fixes
	Ctrl + Backspace	- Delete word left
*/
/*	Keybindings
	XButton1			- Go up
	XButton2			- Go back
	Shift + XButton2	- Go foward

	Ctrl + Alt + V		- Paste as symlink
*/

#Include ..\..\Data\Libraries\Explorer.ahk
#Include ..\..\Data\Apps.ahk

#HotIf (WinActive(App.Explorer.title) or WinActive(App.Desktop.title))
	#Include ..\..\Data\Common Rebinds\Force Delete Word Left.ahk

	^!v:: Explorer.PasteSymlink()	; Paste as symlink
#HotIf (WinActive(App.Explorer.title))
	XButton1:: !Up					; Go up
	XButton2:: XButton1				; Go back
	+XButton2:: XButton2			; Go foward
#HotIf