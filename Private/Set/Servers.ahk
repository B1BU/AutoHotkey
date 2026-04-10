#Requires AutoHotkey v2.0

#Include ..\..\
#Include Core\Lib\External\Yaml.ahk
#Include Core\Lib\Utils.ahk

global Servers := Yaml(A_AhkDir . '/Private/Data/Servers.yaml')[1]