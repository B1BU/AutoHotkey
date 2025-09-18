/*
	[FIXES]
	Ctrl + Backspace : Delete word left

	[KEYBINDINGS]
	Esc              : Go up
	Ctrl + Alt + V   : Paste path as symlink
	Ctrl + Shift + V : Paste path as shortcut (Not implemented)
*/
; ! ADD PASTE AS SHORTCUT

#Requires AutoHotkey v2.0
#Include ..\..\Data\Libraries\Explorer.ahk
#Include ..\..\Data\Apps.ahk

#HotIf ( ; EXPLORER
	WinActive(App.Explorer.title)
)
	Home:: !Up ; Go up
#HotIf ( ; EXPLORER OR DESKTOP
	WinActive(App.Explorer.title) or
	WinActive(App.Desktop.title)
)
	#Include ..\..\Data\Common Rebinds\Force Delete Word Left.ahk
	^!v:: Explorer.PasteSymlink() ; Paste as symlink
#HotIf