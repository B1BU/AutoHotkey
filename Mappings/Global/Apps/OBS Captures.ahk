#Requires AutoHotkey v2.0

/*	Keybindings
	Ctrl + PrintScreen			- Save Screenshot
	Shift + PrintScreen			- Save Clip
	Ctrl + Shift + PrintScreen	- Start/Stop Recording
*/

#Include ..\..\..\Data\Libraries\Sound.ahk

^PrintScreen:: ^F21
+PrintScreen:: +F21
^+PrintScreen:: ^+F21