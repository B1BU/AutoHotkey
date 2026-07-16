#Requires AutoHotkey v2.0

; ! ADD PASTE AS SHORTCUT
; ! ADD DUPLICATE FILE

#Include ..\..\
#Include Load\Apps.ahk
#Include Lib\Explorer.ahk

#HotIf WinActive(Apps['Explorer'].title) ; Explorer
	XButton1::  !Up      ; Go up
	XButton2::  XButton1 ; Go back
#HotIf WinActive(Apps['Explorer'].title) or WinActive(Apps['Desktop'].title) ; Explorer or Desktop
	#Include Binds\Snippets\Force Delete Word Left.ahk
	^!v:: Explorer.PasteSymlink() ; Paste as symlink
#HotIf