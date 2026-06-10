#Requires AutoHotkey v2.0

#Include ..\..\
#Include Lib\External\Yaml.ahk
#Include Lib\Utils.ahk

global Servers := Yaml(A_AhkDir . '/Data/Private/Servers.yaml')[1]