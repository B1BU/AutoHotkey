/*
	[KEYBINDINGS]
	Ctrl         + PrintScreen : Screenshot
	Shift        + PrintScreen : Clip
	Ctrl + Shift + PrintScreen : Recording
*/

#Requires AutoHotkey v2.0

PrintScreen::     PrintScreen ; Preserves default behavior
^PrintScreen::   ^F24         ; Screenshot
+PrintScreen::   +F24         ; Clip
^+PrintScreen:: ^+F24         ; Recording