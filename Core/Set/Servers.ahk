#Requires AutoHotkey v2.0

#Include ..\Lib\External\Yaml.ahk
#Include ..\Lib\Utils.ahk

global Servers := Yaml(A_AhkDir . '/User/Servers.yaml')[1]

/*
	[/User/Servers.yaml]
	<SERVER NAME>:
	  address:  <SERVER ADDRESS>
	  username: <USER NAME>
	  password: <PASSWORD>
*/