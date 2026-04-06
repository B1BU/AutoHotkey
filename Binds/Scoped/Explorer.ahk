; ! ADD PASTE AS SHORTCUT
; ! ADD DUPLICATE FILE

#Requires AutoHotkey v2.0
#Include ..\..\Core\Lib\Explorer.ahk
#Include ..\..\Core\Data\Apps.ahk

#HotIf WinActive(App.Explorer.title) ; Explorer
	Home::  !Up   ; Go up
	+Home:: +Home ; Select to start
#HotIf WinActive(App.Explorer.title) or	WinActive(App.Desktop.title) ; Explorer or Desktop
	#Include ..\Common\Force Delete Word Left.ahk
	^!v:: Explorer.PasteSymlink() ; Paste as symlink
#HotIf