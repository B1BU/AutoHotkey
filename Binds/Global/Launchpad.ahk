#Requires AutoHotkey v2.0

#Include ..\..\
#Include Core\Set\Apps.ahk

#+e:: Apps['Explorer'].Kill()                  ; Restart Explorer

#esc:: Apps['TaskMgr'].Toggle()                ; Toggle Task Manager

PowerShellArgs := '-NoExit -WindowStyle Maximized -Command "Clear-Host"'
#':: Apps['PowerShell'].Run(1, PowerShellArgs) ; Open PowerShell as Admin
#+':: Apps['PowerShell'].Run(, PowerShellArgs) ; Open PowerShell

AppsKey & =:: Apps['Calc'].Toggle(1)           ; Open / Close Calculator

AppsKey & x:: Apps['TaskBarX'].Kill()          ; Restart TaskBarX

Media_Stop:: Apps['Spotify'].Toggle(1)         ; Open / Close Spotify
^Media_Stop:: Apps['Spotify'].Minimize()       ; Minimize Spotify
!Media_Stop:: Apps['Spotify'].Kill()           ; Kill Spotify

AppsKey & c:: {
	Apps['Chrome'].Run()                       ; Open Chrome
}

AppsKey & o:: Apps['Obsidian'].Toggle(1)       ; Open / Close Obsidian

AppsKey & n:: {
	if (GetKeyState('Alt')) {
		Apps['Notion'].Kill()                  ; Kill Notion
	} else {
		Apps['Notion'].Toggle(1)               ; Open / Close Notion
	}
}

AppsKey & g:: {
	if (GetKeyState('Control')) {
		Apps['ChatGPT'].Close()                ; Close ChatGPT
	} else if (GetKeyState('Shift')) {
		Apps['ChatGPT'].Run()                  ; Open ChatGPT
	} else {
		Apps['ChatGPT'].Toggle()               ; Open / Minimize ChatGPT
	}
}

AppsKey & v:: Apps['VSCode'].Run()             ; Open VSCode

AppsKey & d:: {
	if (GetKeyState('Alt')) {
		Apps['Discord'].Kill()                 ; Kill Discord
	} else if (GetKeyState('Control')) {
		Apps['Discord'].Close()                ; Close Discord
	} else {
		Apps['Discord'].Toggle()               ; Open / Minimize Discord
	}
}

AppsKey & w:: Apps['WhatsApp'].Toggle(1)       ; Open / Close WhatsApp

AppsKey & Home:: {
	if (GetKeyState('Alt')) {
		Apps['Steam'].Kill()                   ; Kill Steam
	} else if (GetKeyState('Shift')) {
		Apps['SteamBP'].Toggle(1)              ; Open / Close Steam Big Picture
	} else {
		Apps['Steam'].Toggle(1)                ; Open / Close Steam
	}
}

AppsKey & End:: {
	if (GetKeyState('Alt')) {
		Apps['Epic'].Kill()                    ; Kill Epic Games
	} else {
		Apps['Epic'].Toggle(1)                 ; Open / Close Epic Games
	}
}

AppsKey & Del:: Apps['Xbox'].Toggle(1)         ; Open / Close Xbox App

AppsKey & i:: Apps['Itch'].Toggle()            ; Open / Minimize Itch

AppsKey & m:: Apps['Modrinth'].Toggle(1)       ; Open / Close Modrinth

AppsKey & k:: Apps['Krita'].Toggle()           ; Open / Close Krita