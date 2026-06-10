#Requires AutoHotkey v2.0

; ! ADD PASTE AS SHORTCUT
; ! ADD DUPLICATE FILE

#Include ..\..\
#Include Load\Apps.ahk
#Include Lib\Explorer.ahk

#HotIf WinActive(Apps['Explorer'].title) ; Explorer
	Home::  !Up   ; Go up
	+Home:: +Home ; Select to start
#HotIf WinActive(Apps['Explorer'].title) or WinActive(Apps['Desktop'].title) ; Explorer or Desktop
	#Include Binds\Snippets\Force Delete Word Left.ahk
	^!v:: Explorer.PasteSymlink() ; Paste as symlink
#HotIf