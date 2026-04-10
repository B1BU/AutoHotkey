#Requires AutoHotkey v2.0

#Include ..\..\Core\Lib\External\Yaml.ahk
#Include ..\..\Core\Lib\Utils.ahk

global Creds := Yaml(A_AhkDir . '/Private/Data/Creds.yaml')[1]