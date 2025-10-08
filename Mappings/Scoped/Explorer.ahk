; ! ADD PASTE AS SHORTCUT

#Requires AutoHotkey v2.0
#Include ..\..\Data\Libraries\Explorer.ahk
#Include ..\..\Data\Apps.ahk

#HotIf WinActive(App.Explorer.title) ; Explorer
	Home::  !Up   ; Go up
	+Home:: +Home ; Select to start
#HotIf WinActive(App.Explorer.title) or	WinActive(App.Desktop.title) ; Explorer or Desktop
	#Include ..\..\Data\Common Rebinds\Force Delete Word Left.ahk
	^!v:: Explorer.PasteSymlink() ; Paste as symlink
#HotIf