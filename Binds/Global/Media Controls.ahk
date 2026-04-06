#Requires AutoHotkey v2.0

LWin & WheelUp::   Send('{Volume_Up}')
RWin & WheelUp::   Send('{Volume_Up}')

LWin & WheelDown:: Send('{Volume_Down}')
RWin & WheelDown:: Send('{Volume_Down}')

LWin & MButton::   Send('{Volume_Mute}')
RWin & MButton::   Send('{Volume_Mute}')