#Requires AutoHotkey v2.0
#SingleInstance Force

#Include ..\
#Include Lib\Extensions.ahk
#Include Lib\External\VDF.ahk

A_SteamLoginusers := A_ProgramFilesx86 '/Steam/config/loginusers.vdf'
A_SteamLoginusersHidden := A_SteamLoginusers '.hidden'
A_SteamLoginusersDefaultData := Map('users', Map())

SteamHideUser(id, hide := true) {
	if hide {
		source := A_SteamLoginusers
		target := A_SteamLoginusersHidden
	} else {
		source := A_SteamLoginusersHidden
		target := A_SteamLoginusers
	}

	if !FileExist(source)
		return

	source_data := VdfRead(source)
	target_data := FileExist(target) ? VdfRead(target) : A_SteamLoginusersDefaultData

	if !source_data['users'].Has(id)
		return

	target_data['users'][id] := source_data['users'][id]
	source_data['users'].Delete(id)

	VdfWrite(target, target_data)
	VdfWrite(source, source_data)
}