#Requires AutoHotkey v2.0

#Include ..\..\
#Include Lib\External\Yaml.ahk
#Include Lib\Utils.ahk

global Creds := Yaml(A_AhkDir . '/Data/Private/Creds.yaml')[1]