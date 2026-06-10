#Requires AutoHotkey v2.0

#Include ..\
#Include Lib\External\Yaml.ahk
#Include Lib\Path.ahk
#Include Lib\App.ahk

filepath := PathJoin(A_AhkDir, 'Data/Apps.yaml')
global Apps := AppMap(Yaml(filepath)[1])