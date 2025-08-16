#Requires AutoHotkey v2.0
#SingleInstance Force

input := InputHook()
input.KeyOpt("{All}", "E")
input.Start()
input.Wait()
MsgBox(input.EndKey, "CheckKey")