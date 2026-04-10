#Requires AutoHotkey v2.0

; ! ADD PASTE AS SHORTCUT
; ! ADD DUPLICATE FILE

#Include ..\..\
#Include Core\Set\Apps.ahk
#Include Core\Lib\Explorer.ahk

#HotIf WinActive(Apps['Explorer'].title) ; Explorer
	Home::  !Up   ; Go up
	+Home:: +Home ; Select to start
#HotIf WinActive(Apps['Explorer'].title) or WinActive(Apps['Desktop'].title) ; Explorer or Desktop
	#Include Binds\Common\Force Delete Word Left.ahk
	^!v:: Explorer.PasteSymlink() ; Paste as symlink
#HotIf