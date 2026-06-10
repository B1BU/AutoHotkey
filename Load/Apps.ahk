#Requires AutoHotkey v2.0

#Include ..\
#Include Lib\External\Yaml.ahk
#Include Lib\Utils.ahk
#Include Lib\App.ahk

global Apps := AppMap(Yaml(A_AhkDir . '/Data/Apps.yaml')[1])