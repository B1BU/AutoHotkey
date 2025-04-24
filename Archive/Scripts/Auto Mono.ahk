; #Requires AutoHotkey v2.0
; #SingleInstance Force

; #Include ..\Data\Functions\Text.ahk
; #Include ..\Data\Functions\Utilities.ahk

; GetMono() {
; 	return RegRead('HKCU\Software\Microsoft\Multimedia\Audio', 'AccessibilityMonoMixState')
; }

; GetSoundDevice() {
; 	return Trim(StrSplit(SoundGetName(), '(')[1])
; }

; CheckMono() {
; 	device := GetSoundDevice()

; 	state := GetMono()
; 	intendedState := Present(device, monoDevices)

; 	if (state !== intendedState) {
; 		while state !== intendedState {
; 			Sleep(1000)
; 			RunWait('ms-settings:easeofaccess-audio')
; 			Sleep(200)
; 			Send('{Tab}{Tab}{Space}')
; 			Sleep(200)
; 			state := GetMono()
; 		}

; 		WinClose('Configurações')
; 	}
; }

; ; monoDevices := ['SONY TV', 'CABLE Input']
; monoDevices := ['SONY TV']

; SetTimer(CheckMono, 1000)