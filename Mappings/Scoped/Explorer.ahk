#Requires AutoHotkey v2.0

/*	Fixes
	Ctrl + Backspace	- Delete word left
*/
/*	Keybindings
	Side Button 3       - Go up

	Ctrl + Alt + V      - Paste as symlink
	Ctrl + Shift + V    - Paste as shortcut (Not yet implemented)
*/

; ! ADD PASTE AS SHORTCUT

#Include ..\..\Data\Libraries\Explorer.ahk
#Include ..\..\Data\Apps.ahk

#HotIf (WinActive(App.Explorer.title) or WinActive(App.Desktop.title))
	#Include ..\..\Data\Common Rebinds\Force Delete Word Left.ahk

	^!v:: Explorer.PasteSymlink()	; Paste as symlink
#HotIf (WinActive(App.Explorer.title))
	Home:: !Up					    ; Go up
#HotIf