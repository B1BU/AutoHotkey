#Requires AutoHotkey v2.0

#Include ..\..\
#Include Lib\External\Yaml.ahk
#Include Lib\Extensions.ahk
#Include Lib\Path.ahk

filepath := PathJoin(A_AhkRoot, 'Data/Private/Servers.yaml')
Servers := Yaml(filepath)[1]