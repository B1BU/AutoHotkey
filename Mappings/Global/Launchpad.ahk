#Requires AutoHotkey v2.0

/*	Keybindings
	Win + Shift + E		- Restart Explorer

	App + Shift + X		- Restart TaskBarX

	Win + '				- Open Admin Command Prompt
	Win + Shift + '		- Open Command Prompt

	Win + F1			- Open / Close Calculator

	App + M				- SSH into Mudhorn

	Media Stop			- Open / Minimize Spotify
	Ctrl + Media Stop	- Close Spotify
	Alt + Media Stop	- Kill Spotify

	App + C				- Open Chrome
	App + Shift + C		- Open Chrome Beta

	App + N				- Open / Close Notion
	App + Alt + N		- Kill Notion

	App + G				- Open / Minimize ChatGPT
	App + Shift + G		- Open ChatGPT
	App + Ctrl + G		- Close ChatGPT

	App + H				- Open / Minimize Gemini
	App + Shift + H		- Open Gemini
	App + Ctrl + H		- Close Gemini

	App + O				- Open / Close Obsidian

	App + V				- Open VSCode

	App + Home			- Open Steam → Open / Close Big Picture
	App + Shift + Home	- Open / Close Big Picture
	App + Ctrl + Home	- Close Steam
	App + Alt + Home	- Kill Steam

	App + End			- Open / Close Epic Games
	App + Alt + End		- Kill Epic Games

	App + Del			- Open / Close Xbox App

	App + D				- Open / Minimize Discord
	App + Ctrl + D		- Close Discord

	App + W				- Open / Close WhatsApp
*/

#Include ..\..\Data\Apps.ahk
#Include ..\..\Data\Private\Servers.ahk

#+e::				App.Explorer.Restart()		; Restart Explorer

#'::				App.CMD.Open(1)				; Open Admin Command Prompt
#+'::				App.CMD.Open()				; Open Command Prompt
#F1::				App.Calc.Toggle(1)			; Open / Close Calculator

AppsKey & m::		Mudhorn.SSH()				; SSH into Mudhorn

AppsKey & x:: {
	if (GetKeyState('Shift')) {
		App.TaskBarX.Open()						; Restart TaskBarX
	}
}

Media_Stop::		App.Spotify.Toggle()		; Open / Minimize Spotify
^Media_Stop::		App.Spotify.Close()			; Close Spotify
!Media_Stop::		App.Spotify.Kill()			; Kill Spotify

AppsKey & c:: {
	if (GetKeyState('Shift')) {
		App.ChromeBeta.Open()					; Open Chrome Beta
	} else {
		App.Chrome.Open()						; Open Chrome
	}
}

AppsKey & o::		App.Obsidian.Toggle(1)		; Open / Close Obsidian

AppsKey & n:: {
	if (GetKeyState('Alt')) {
		App.Notion.Kill()						; Kill Notion
	} else {
		App.Notion.Toggle(1)					; Open / Close Notion
	}
}

AppsKey & h:: {
	if (GetKeyState('Control')) {
		App.Gemini.Close()						; Close Gemini
	} else if (GetKeyState('Shift')) {
		App.Gemini.Open()						; Open Gemini
	} else {
		App.Gemini.Toggle()						; Open / Minimize Gemini
	}
}

AppsKey & g:: {
	if (GetKeyState('Control')) {
		App.ChatGPT.Close()						; Close ChatGPT
	} else if (GetKeyState('Shift')) {
		App.ChatGPT.Open()						; Open ChatGPT
	} else {
		App.ChatGPT.Toggle()					; Open / Minimize ChatGPT
	}
}

AppsKey & v::		App.VSCode.Open()			; Open VSCode

AppsKey & d:: {
	if (GetKeyState('Control')) {
		App.Discord.Close()						; Close Discord
	} else {
		App.Discord.Toggle()					; Open / Minimize Discord
	}
}

AppsKey & w::		App.WhatsApp.Toggle(1)		; Open / Close WhatsApp

AppsKey & Home:: {
	if (GetKeyState('Alt')) {
		App.Steam.Kill()						; Kill Steam
	} else if (GetKeyState('Control')) {
		App.Steam.Close()						; Close Steam
	} else if (GetKeyState('Shift')) {
		App.SteamBP.Toggle(1)					; Open / Close Steam Big Picture
	} else {
		if (WinActive(App.Steam.title)) {
			App.SteamBP.Toggle(1)				; Open / Close Steam Big Picture
		} else {
			App.Steam.Open()					; Open Steam
		}
	}
}

AppsKey & End:: {
	if (GetKeyState('Alt')) {
		App.Epic.Kill()							; Kill Epic Games
	} else {
		App.Epic.Toggle(1)						; Open / Close Epic Games
	}
}

AppsKey & Del::		App.Xbox.Toggle(1)			; Open / Close Xbox App