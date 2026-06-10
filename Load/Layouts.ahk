#Requires AutoHotkey v2.0

#Include ..\
#Include Lib\External\Yaml.ahk
#Include Lib\Path.ahk

filepath := PathJoin(A_AhkRoot, 'Data/Layouts.yaml')
global PowerToysLayouts := Yaml(filepath)[1]