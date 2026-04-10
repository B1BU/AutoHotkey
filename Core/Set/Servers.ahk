#Requires AutoHotkey v2.0

#Include ..\Lib\External\Yaml.ahk
#Include ..\Lib\Utils.ahk

global Servers := Yaml(A_AhkDir . '/Private/Data/Servers.yaml')[1]