/*
	[KEYBINDINGS]
	Win + Shift + E    - Restart Explorer

	App + Shift + X    - Restart TaskBarX

	Win         + '    - Open Admin PowerShell
	Win + Shift + '    - Open PowerShell

	Win + F1           - Open / Close Calculator

	App + H            - SSH into Mudhorn

	Media Stop         - Open / Close Spotify
	Ctrl + Media Stop  - Minimize Spotify
	Alt  + Media Stop  - Kill Spotify

	App + C            - Open Chrome
	App + C (Hold 3s)  - Open Chrome Beta

	App + N            - Open / Close Notion
	App + Alt   + N    - Kill Notion

	App + G            - Open / Minimize ChatGPT
	App + Shift + G    - Open ChatGPT
	App + Ctrl  + G    - Close ChatGPT

	App + O            - Open / Close Obsidian

	App + V            - Open VSCode

	App + Home         - Open Steam → Open / Close Big Picture
	App + Shift + Home - Open / Close Big Picture
	App + Ctrl  + Home - Close Steam
	App + Alt   + Home - Kill Steam

	App + End          - Open / Close Epic Games
	App + Alt + End    - Kill Epic Games

	App + Del          - Open / Close Xbox App

	App + M            - Open / Close Modrinth

	App + D            - Open / Minimize Discord
	App + Ctrl + D     - Close Discord
	App + Alt  + D     - Kill Discord

	App + W            - Open / Close WhatsApp
*/

#Requires AutoHotkey v2.0

#Include ..\..\Data\Apps.ahk
#Include ..\..\Data\Private\Servers.ahk

#+e:: App.Explorer.Restart()         ; Restart Explorer

#':: App.CMD.Open(1)                 ; Open Admin Command Prompt
#+':: App.CMD.Open()                 ; Open Command Prompt

#F1:: App.Calc.Toggle(1)             ; Open / Close Calculator

AppsKey & h:: Mudhorn.SSH()          ; SSH into Mudhorn

AppsKey & x:: {
	if (GetKeyState('Shift')) {
		App.TaskBarX.Open()          ; Restart TaskBarX
	}
}

Media_Stop:: App.Spotify.Toggle(1)   ; Open / Close Spotify
^Media_Stop:: App.Spotify.Minimize() ; Minimize Spotify
!Media_Stop:: App.Spotify.Kill()     ; Kill Spotify

AppsKey & c:: {
	if !KeyWait('c', 'T2') {
		App.ChromeBeta.Open          ; Open Chrome Beta
	} else {
		App.Chrome.Open()            ; Open Chrome
	}

	KeyWait('c')
}

AppsKey & o:: App.Obsidian.Toggle(1) ; Open / Close Obsidian

AppsKey & n:: {
	if (GetKeyState('Alt')) {
		App.Notion.Kill()            ; Kill Notion
	} else {
		App.Notion.Toggle(1)         ; Open / Close Notion
	}
}

AppsKey & g:: {
	if (GetKeyState('Control')) {
		App.ChatGPT.Close()          ; Close ChatGPT
	} else if (GetKeyState('Shift')) {
		App.ChatGPT.Open()           ; Open ChatGPT
	} else {
		App.ChatGPT.Toggle()         ; Open / Minimize ChatGPT
	}
}

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

AppsKey & w:: App.WhatsApp.Toggle(1) ; Open / Close WhatsApp

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

AppsKey & End:: {
	if (GetKeyState('Alt')) {
		App.Epic.Kill()              ; Kill Epic Games
	} else {
		App.Epic.Toggle(1)           ; Open / Close Epic Games
	}
}

AppsKey & Del:: App.Xbox.Toggle(1)   ; Open / Close Xbox App

AppsKey & m:: App.Modrinth.Toggle(1) ; Open / Close Xbox App