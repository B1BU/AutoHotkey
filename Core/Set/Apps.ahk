#Requires AutoHotkey v2.0

#Include ..\Lib\External\Yaml.ahk
#Include ..\Lib\Utils.ahk
#Include ..\Lib\App2.ahk

; ! Set a variable instead of calling a function that defines a global variable
SetApps(Yaml(A_AhkDir . '/Core/Data/Apps.yaml')[1])

/*
	[/Core/Data/Apps.yaml]
	<APP NAME>:
	  exe:    <EXECUTABLE FILE NAME>
	  title:  <AHK STYLE APP IDENTIFIER>
	  target: <COMMAND TO START APP>
*/