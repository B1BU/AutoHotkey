#Requires AutoHotkey v2.0

#Include ..\
#Include Lib\External\Yaml.ahk
#Include Lib\Utils.ahk

global PowerToysLayouts := Yaml(A_AhkDir . '/Data/Layouts.yaml')[1]