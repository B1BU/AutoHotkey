#Requires AutoHotkey v2.0

#Include ..\..\Lib\External\Yaml.ahk
#Include ..\..\Lib\Utils.ahk
#Include ..\..\Lib\App2.ahk

SetApps(Yaml(A_AhkDir . '/Core/Data/Apps.yml')[1])