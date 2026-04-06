; #Requires AutoHotkey v2.0

; /*
; This script is pointless, the setting is for mac only

; Presented here for reference purposes, do not run
; */

; SoundPlay('*16')
; ExitApp()

; FortniteMouseAccelerationLoop() {
; 	if (WinActive('ahk_exe FortniteClient-Win64-Shipping.exe')) {
; 		filePath := A_AppData . '\FortniteGame\Saved\Config\WindowsClient\GameUserSettings.ini'

; 		settings := [
; 			['/Script/FortniteGame.FortGameUserSettings', 'bDisableMouseAcceleration', 'True']
; 		]

; 		for setting in settings {
; 			section := setting[1]
; 			key := setting[2]
; 			value := setting[3]

; 			if (IniRead(filePath, section, key) !== value) {
; 				; FileSetAttrib('-R', filePath)
; 				IniWrite(value, filePath, section, key)
; 				; FileSetAttrib('+R', filePath)
; 			}
; 		}
; 	}
; }

; SetTimer(FortniteMouseAccelerationLoop, 10000)