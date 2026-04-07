#Requires AutoHotkey v2.0

#Include ..\Lib\External\Yaml.ahk
#Include ..\Lib\Utils.ahk
#Include ..\Lib\App2.ahk

; ! Set a variable instead of calling a function that defines a global variable
SetApps(Yaml(A_AhkDir . '/Core/Data/Apps.yaml')[1])