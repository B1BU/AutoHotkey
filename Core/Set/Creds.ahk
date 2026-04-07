#Requires AutoHotkey v2.0

#Include ..\Lib\External\Yaml.ahk
#Include ..\Lib\Utils.ahk

global Creds := Yaml(A_AhkDir . '/User/Creds.yaml')[1]

/*
	[/User/Creds.yaml]
	username: <USER NAME>
	password: <PASSWORD>
*/