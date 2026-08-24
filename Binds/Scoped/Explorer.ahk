#Requires AutoHotkey v2.0

; ! ADD PASTE AS SHORTCUT

#Include ..\..\
#Include Load\Apps.ahk
#Include Lib\Explorer.ahk

#HotIf WinActive(Apps['Explorer'].title) or WinActive(Apps['Desktop'].title)
	#Include Binds\Snippets\Force Delete Word Left.ahk

	XButton1:: !Up ; Go up
	XButton2:: XButton1 ; Go back

	^J:: Send('^c^v') ; Duplicate file

	^!v:: Explorer.PasteSymlink()
#HotIf