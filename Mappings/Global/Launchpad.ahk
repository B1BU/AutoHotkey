#Requires AutoHotkey v2.0

#Include ..\..\Data\Apps.ahk
#Include ..\..\Data\Private\Servers.ahk

; Explorer
#+e:: App.Explorer.Restart()         ; Restart Explorer

; Task Manager
#esc:: App.TaskMgr.Open()          ; Toggle Task Manager

; CMD
#':: App.CMD.Open(1)                 ; Open Admin Command Prompt
#+':: App.CMD.Open()                 ; Open Command Prompt

; Calculator
#F1:: App.Calc.Toggle(1)             ; Open / Close Calculator

; Mudhorn
AppsKey & h:: Mudhorn.SSH()          ; SSH into Mudhorn

; TaskBarX
AppsKey & x:: App.TaskBarX.Open()    ; Restart TaskBarX

; Spotify
Media_Stop:: App.Spotify.Toggle(1)   ; Open / Close Spotify
^Media_Stop:: App.Spotify.Minimize() ; Minimize Spotify
!Media_Stop:: App.Spotify.Kill()     ; Kill Spotify

; Chrome
AppsKey & c:: {
	if !KeyWait('c', 'T2') {
		App.ChromeBeta.Open          ; Open Chrome Beta
	} else {
		App.Chrome.Open()            ; Open Chrome
	}

	KeyWait('c')
}

; Obsidian
AppsKey & o:: App.Obsidian.Toggle(1) ; Open / Close Obsidian

; Notion
AppsKey & n:: {
	if (GetKeyState('Alt')) {
		App.Notion.Kill()            ; Kill Notion
	} else {
		App.Notion.Toggle(1)         ; Open / Close Notion
	}
}

; Chat GPT
AppsKey & g:: {
	if (GetKeyState('Control')) {
		App.ChatGPT.Close()          ; Close ChatGPT
	} else if (GetKeyState('Shift')) {
		App.ChatGPT.Open()           ; Open ChatGPT
	} else {
		App.ChatGPT.Toggle()         ; Open / Minimize ChatGPT
	}
}

; VSCode
AppsKey & v:: App.VSCode.Open()      ; Open VSCode

AppsKey & d:: {
	if (GetKeyState('Alt')) {
		App.Discord.Kill()           ; Kill Discord
	} else if (GetKeyState('Control')) {
		App.Discord.Close()          ; Close Discord
	} else {
		App.Discord.Toggle()         ; Open / Minimize Discord
	}
}

; WhatsApp
AppsKey & w:: App.WhatsApp.Toggle(1) ; Open / Close WhatsApp

; Steam
AppsKey & Home:: {
	if (GetKeyState('Alt')) {
		App.Steam.Kill()             ; Kill Steam
	} else if (GetKeyState('Control')) {
		App.Steam.Close()            ; Close Steam
	} else if (GetKeyState('Shift')) {
		App.SteamBP.Toggle(1)        ; Open / Close Steam Big Picture
	} else {
		if (WinActive(App.Steam.title)) {
			App.SteamBP.Toggle(1)    ; Open / Close Steam Big Picture
		} else {
			App.Steam.Open()         ; Open Steam
		}
	}
}

; Epic Games
AppsKey & End:: {
	if (GetKeyState('Alt')) {
		App.Epic.Kill()              ; Kill Epic Games
	} else {
		App.Epic.Toggle(1)           ; Open / Close Epic Games
	}
}

; Xbox
AppsKey & Del:: App.Xbox.Toggle(1)   ; Open / Close Xbox App

; Modrinth
AppsKey & m:: App.Modrinth.Toggle(1) ; Open / Close Modrinth

; Krita
AppsKey & k:: App.Krita.Toggle()     ; Open / Close Krita