#Requires AutoHotkey v2.0

#Include ..\..\..\
#Include Core\Lib\Icon.ahk
#Include Core\Lib\Utils.ahk
#Include Private\Set\Layouts.ahk

PowerToysLayoutMenuHandler(ItemName, ItemPos, MyMenu, key) {
	Send('{LWin Down}{Control Down}{LAlt Down}{' key '}{LWin Up}{Control Up}{LAlt Up}')
}

PowerToysLayoutMenu := Menu()

menu_items := []
for layout in PowerToysLayouts {
	if (!layout.Has('label')) or (!layout.Has('key'))
		continue

	item := Object()

	item.name := layout['label']

	if layout.Has('icon')
		item.icon := Icon(layout['icon'])

	item.callback := PowerToysLayoutMenuHandler.Bind(,,, layout['key'])

	menu_items.Push(item)
}

FillMenu(PowerToysLayoutMenu, menu_items)

<#F1:: PowerToysLayoutMenu.Show()