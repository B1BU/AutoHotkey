#Requires AutoHotkey v2.0

#Include ..\..\..\
#Include Core\Lib\External\Yaml.ahk
#Include Core\Lib\Utils.ahk
#Include Core\Lib\App.ahk

global PrivateApps := AppMap(Yaml(A_AhkDir . '/Private/Core/Data/Apps.yaml')[1])