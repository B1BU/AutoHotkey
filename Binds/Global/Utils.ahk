#Requires AutoHotkey v2.0

#Include ..\..\
#Include Lib\Text.ahk

^~:: Write(FormatTime(A_Now, 'yy.MM.dd')) ; Write current date