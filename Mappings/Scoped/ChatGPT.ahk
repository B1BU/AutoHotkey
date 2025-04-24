#Requires AutoHotkey v2.0

/*	Keybindings
	Ctrl + N			- Start new chat
	Ctrl + Shift + N	- Open new window
*/

#Include ..\..\Data\Apps.ahk

#HotIf (WinActive(App.ChatGPT.title))
	^n:: ^+o
	^+n:: App.ChatGPT.Open()
#HotIf