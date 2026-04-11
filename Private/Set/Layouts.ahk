#Requires AutoHotkey v2.0

#Include ..\..\
#Include Core\Lib\External\Yaml.ahk
#Include Core\Lib\Utils.ahk

global PowerToysLayouts := Yaml(A_AhkDir . '/Private/Data/Layouts.yaml')[1]