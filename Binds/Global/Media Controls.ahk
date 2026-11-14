#Requires AutoHotkey v2.0

LWin & WheelUp::   Send('{Volume_Up}')
RWin & WheelUp::   Send('{Volume_Up}')

LWin & WheelDown:: Send('{Volume_Down}')
RWin & WheelDown:: Send('{Volume_Down}')

LWin & MButton::   Send('{Volume_Mute}')
RWin & MButton::   Send('{Volume_Mute}')

LWin & LButton::   Send('{Media_Play_Pause}')
RWin & LButton::   Send('{Media_Play_Pause}')

LWin & XButton1::  Send('{Media_Prev}')
RWin & XButton1::  Send('{Media_Prev}')

LWin & XButton2::  Send('{Media_Next}')
RWin & XButton2::  Send('{Media_Next}')