#Requires AutoHotkey v2.0

#Include ..\..\
#Include Load\Apps.ahk

#+e:: Apps['Explorer'].Kill()               ; Restart Explorer

#esc:: Apps['TaskMgr'].Toggle()             ; Toggle Task Manager

#':: Apps['Terminal PowerShell'].Run(1)     ; Start Terminal as Admin
#+':: Apps['Terminal PowerShell'].Run()     ; Start Terminal

AppsKey & =:: Apps['Calculator'].Toggle(1)  ; Start / Close Calculator

AppsKey & t:: Apps['TaskBarX'].Kill()       ; Restart TaskBarX

Media_Stop:: Apps['Spotify'].Toggle(1)      ; Start / Close Spotify
^Media_Stop:: Apps['Spotify'].Minimize()    ; Minimize Spotify
!Media_Stop:: Apps['Spotify'].Kill()        ; Kill Spotify

AppsKey & c:: Apps['Chrome'].Run()          ; Start Chrome

AppsKey & o:: Apps['Obsidian'].Toggle(1)    ; Start / Close Obsidian

AppsKey & n:: {
	if (GetKeyState('Alt')) {
		Apps['Notion'].Kill()               ; Kill Notion
	} else {
		Apps['Notion'].Toggle(1)            ; Start / Close Notion
	}
}

AppsKey & g:: {
	if (GetKeyState('Control')) {
		Apps['ChatGPT'].Close()             ; Close ChatGPT
	} else if (GetKeyState('Shift')) {
		Apps['ChatGPT'].Run()               ; Start ChatGPT
	} else {
		Apps['ChatGPT'].Toggle()            ; Start / Minimize ChatGPT
	}
}

AppsKey & l:: Apps['WLED'].Toggle(1)        ; Start / Close WLED

AppsKey & v:: Apps['VSCode'].Run()          ; Start VSCode

AppsKey & d:: {
	if (GetKeyState('Alt')) {
		Apps['Discord'].Kill()              ; Kill Discord
	} else if (GetKeyState('Control')) {
		Apps['Discord'].Close()             ; Close Discord
	} else {
		Apps['Discord'].Toggle()            ; Start / Minimize Discord
	}
}

AppsKey & w:: {
	if (GetKeyState('Alt')) {
		Apps['WhatsApp'].Kill()             ; Kill WhatsApp
	} else {
		Apps['WhatsApp'].Toggle(1)          ; Start / Close WhatsApp
	}
}

AppsKey & Home:: {
	if (GetKeyState('Alt')) {
		Apps['Steam'].Kill()                ; Kill Steam
	} else if (GetKeyState('Shift')) {
		Apps['Steam Big Picture'].Toggle(1) ; Start / Close Steam Big Picture
	} else {
		Apps['Steam'].Toggle(1)             ; Start / Close Steam
	}
}

AppsKey & End:: {
	if (GetKeyState('Alt')) {
		Apps['Epic'].Kill()                 ; Kill Epic Games
	} else {
		Apps['Epic'].Toggle(1)              ; Start / Close Epic Games
	}
}

AppsKey & Del:: Apps['Xbox'].Toggle(1)      ; Start / Close Xbox App

AppsKey & i:: {                             ; Start / Minimize Itch
	if (GetKeyState('Alt')) {
		Apps['Itch'].Kill()
	} else {
		Apps['Itch'].Toggle()
	}
}

AppsKey & m:: Apps['Modrinth'].Toggle(1)    ; Start / Close Modrinth

AppsKey & x:: Apps['XMCL'].Toggle(1, 1)     ; Start / Close X Minecraft Launcher

AppsKey & k:: Apps['Krita'].Toggle()        ; Start / Close Krita

AppsKey & p:: Apps['Photopea'].Run()        ; Start Photopea
