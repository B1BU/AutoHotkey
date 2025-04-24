#Requires AutoHotkey v2.0

/*	Keybindings
	LWin + Wheel Up		- Volume Up
	LWin + Wheel Down	- Volume Down
*/

LWin & WheelUp::	Send('{Volume_Up}')
LWin & WheelDown::	Send('{Volume_Down}')