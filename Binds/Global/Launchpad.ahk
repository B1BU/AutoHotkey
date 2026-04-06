#Requires AutoHotkey v2.0

#Include ..\..\Core\Data\Load\Apps.ahk
#Include ..\..\User\Servers.ahk

#+e:: AppKill('Explorer')              ; Restart Explorer

#esc:: AppToggle('TaskMgr')            ; Toggle Task Manager

#':: AppRun('CMD', 1)                  ; Open Admin Command Prompt
#+':: AppRun('CMD')                    ; Open Command Prompt

#F1:: AppToggle('Calc', 1)             ; Open / Close Calculator

AppsKey & h:: Mudhorn.SSH()            ; SSH into Mudhorn

AppsKey & x:: AppRun('TaskBarX')       ; Restart TaskBarX

Media_Stop:: AppToggle('Spotify', 1)   ; Open / Close Spotify
^Media_Stop:: AppMinimize('Spotify')   ; Minimize Spotify
!Media_Stop:: AppKill('Spotify')       ; Kill Spotify

AppsKey & c:: {
	if (GetKeyState('Shift') and GetKeyState('Alt')) {
		AppRun('ChromeBeta')           ; Open Chrome Beta
	} else {
		AppRun('Chrome')               ; Open Chrome
	}
}

AppsKey & o:: AppToggle('Obsidian', 1) ; Open / Close Obsidian

AppsKey & n:: {
	if (GetKeyState('Alt')) {
		AppKill('Notion')              ; Kill Notion
	} else {
		AppToggle('Notion', 1)         ; Open / Close Notion
	}
}

AppsKey & g:: {
	if (GetKeyState('Control')) {
		AppClose('ChatGPT')            ; Close ChatGPT
	} else if (GetKeyState('Shift')) {
		AppRun('ChatGPT')              ; Open ChatGPT
	} else {
		AppToggle('ChatGPT')           ; Open / Minimize ChatGPT
	}
}

AppsKey & v:: AppRun('VSCode')         ; Open VSCode

AppsKey & d:: {
	if (GetKeyState('Alt')) {
		AppKill('Discord')             ; Kill Discord
	} else if (GetKeyState('Control')) {
		AppClose('Discord')            ; Close Discord
	} else {
		AppToggle('Discord')           ; Open / Minimize Discord
	}
}

AppsKey & w:: AppToggle('WhatsApp', 1) ; Open / Close WhatsApp

AppsKey & Home:: {
	if (GetKeyState('Alt')) {
		AppKill('Steam')               ; Kill Steam
	} else if (GetKeyState('Control')) {
		AppClose('Steam')              ; Close Steam
	} else if (GetKeyState('Shift')) {
		AppToggle('SteamBP', 1)        ; Open / Close Steam Big Picture
	} else {
		if (WinActive(Apps['Steam']['title'])) {
			AppToggle('SteamBP', 1)    ; Open / Close Steam Big Picture
		} else {
			AppRun('Steam')            ; Open Steam
		}
	}
}

AppsKey & End:: {
	if (GetKeyState('Alt')) {
		AppKill('Epic')                ; Kill Epic Games
	} else {
		AppToggle('Epic', 1)           ; Open / Close Epic Games
	}
}

AppsKey & Del:: AppToggle('Xbox', 1)   ; Open / Close Xbox App

AppsKey & m:: AppToggle('Modrinth', 1) ; Open / Close Modrinth

AppsKey & k:: AppToggle('Krita')       ; Open / Close Krita