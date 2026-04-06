#Requires AutoHotkey v2.0

PrintScreen::    PrintScreen ; Preserves default behavior
*^PrintScreen::  ^F24        ; Screenshot
*+PrintScreen::  +F24        ; Clip
*^+PrintScreen:: ^+F24       ; Recording