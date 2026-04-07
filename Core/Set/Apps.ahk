#Requires AutoHotkey v2.0

#Include ..\Lib\External\Yaml.ahk
#Include ..\Lib\Utils.ahk
#Include ..\Lib\App.ahk

global Apps := AppMap(Yaml(A_AhkDir . '/Core/Data/Apps.yaml')[1])

/*
	[/Core/Data/Apps.yaml]
	<APP NAME>:
	  exe:    <EXECUTABLE FILE NAME>
	  title:  <AHK STYLE APP IDENTIFIER>
	  target: <COMMAND TO START APP>
*/