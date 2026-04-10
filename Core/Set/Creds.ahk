#Requires AutoHotkey v2.0

#Include ..\Lib\External\Yaml.ahk
#Include ..\Lib\Utils.ahk

global Creds := Yaml(A_AhkDir . '/Private/Data/Creds.yaml')[1]