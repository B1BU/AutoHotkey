#Requires AutoHotkey v2.0

#Include ..\..\
#Include Lib\External\Yaml.ahk
#Include Lib\Extensions.ahk
#Include Lib\Path.ahk

filepath := PathJoin(A_AhkRoot, 'Data/Private/Creds.yaml')
Creds := Yaml(filepath)[1]