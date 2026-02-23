#Requires AutoHotkey v2.0

#Include ..\Libraries\Extensions.ahk
#Include ..\Libraries\App.ahk
#Include ..\Libraries\Explorer.ahk
#Include ..\Libraries\CMD.ahk
#Include ..\Libraries\VSCode.ahk

global App := {
	AHK: AppClass(
		{
			exe: 'AutoHotkey64.exe'
		}
	),

	TaskMgr: AppClass(
		{
			exe: 'Taskmgr.exe',
			title: 'ahk_class TaskManagerWindow'
		}
	),

	Explorer: AppClass(
		{
			exe: 'explorer.exe',
			title: 'ahk_class CabinetWClass',
			Restart: Explorer.Restart
		}
	),

	Desktop: AppClass(
		{
			title: 'ahk_class WorkerW'
		}
	),

	CMD: AppClass(
		{
			exe: 'cmd.exe',
			Open: Cmd.Open
		}
	),

	PowerShell: AppClass(
		{
			exe: 'powershell.exe'
		}
	),

	Calc: AppClass(
		{
			exe: 'calc.exe',
			title: 'Calculadora'
		}
	),

	VSCode: AppClass(
		{
			exe: 'Code.exe',
			target: A_AppDataLocal '\Programs\Microsoft VS Code\Code.exe',
			Open: VSCode.Open
		}
	),

	Chrome: AppClass(
		{
			target: A_ProgramFiles '\Google\Chrome\Application\chrome.exe'
		}
	),

	ChromeBeta: AppClass(
		{
			target: A_ProgramFiles '\Google\Chrome Beta\Application\chrome.exe'
		}
	),

	Gemini: AppClass(
		{
			title: 'Gemini ahk_class Chrome_WidgetWin_1',
			target: '"' A_ProgramFiles '\Google\Chrome\Application\chrome_proxy.exe"  --profile-directory=Default --app-id=pificchcdfpinjikejhcfjobjdhcedjj'

		}
	),

	ChatGPT: AppClass(
		{
			title: 'ChatGPT ahk_class Chrome_WidgetWin_1',
			target: '"' A_ProgramFiles '\Google\Chrome\Application\chrome_proxy.exe"  --profile-directory=Default --app-id=cadlkienfkclaiaibeoongdcgmdikeeg'
		}
	),

	Obsidian: AppClass(
		{
			exe: 'Obsidian.exe',
			target: A_ProgramFiles '\Obsidian\Obsidian.exe'
		}
	),

	Notion: AppClass(
		{
			exe: 'Notion.exe',
			target: A_AppDataLocal '\Programs\Notion\Notion.exe'
		}
	),

	Discord: AppClass(
		{
			exe: 'Discord.exe',
			target: '"' A_AppDataLocal '\Discord\Update.exe" --processStart Discord.exe'
		}
	),

	WhatsApp: AppClass(
		{
			title: 'WhatsApp',
			target: 'shell:AppsFolder\5319275A.WhatsAppDesktop_cv1g1gvanyjgm!App'
		}
	),

	Spotify: AppClass(
		{
			exe: 'Spotify.exe'
		}
	),

	Steam: AppClass(
		{
			exe: 'Steam.exe',
			title: 'ahk_exe steamwebhelper.exe',
			target: A_ProgramFilesx86 '\Steam\steam.exe'
		}
	),

	SteamBP: AppClass(
		{
			exe: 'steamwebhelper.exe',
			title: 'Big Picture ahk_exe steamwebhelper.exe',
			target: 'steam://open/bigpicture'
		}
	),

	Epic: AppClass(
		{
			exe: 'EpicGamesLauncher.exe',
			target: A_ProgramFilesx86 '\Epic Games\Launcher\Portal\Binaries\Win32\EpicGamesLauncher.exe'
		}
	),

	Xbox: AppClass(
		{
			title: 'Xbox',
			target: 'shell:AppsFolder\Microsoft.GamingApp_8wekyb3d8bbwe!Microsoft.Xbox.App'
		}
	),

	OBS: AppClass(
		{
			exe: 'obs64.exe'
		}
	),

	Audacity: AppClass(
		{
			exe: 'audacity.exe'
		}
	),

	Krita: AppClass(
		{
			exe: A_ProgramFiles '\Krita (x64)\bin\krita.exe'
		}
	),

	Fusion360: AppClass(
		{
			exe: 'fusion360.exe'
		}
	),

	Blockbench: AppClass(
		{
			exe: 'Blockbench.exe'
		}
	),

	SupermarketSimulator: AppClass(
		{
			exe: 'Supermarket Simulator.exe'
		}
	),

	Fortnite: AppClass(
		{
			exe: 'FortniteClient-Win64-Shipping.exe'
		}
	),

	HalfLife2: AppClass(
		{
			exe: 'hl2.exe',
			title: 'Half-Life 2 ahk_exe hl2.exe'
		}
	),

	Modrinth: AppClass(
		{
			exe: 'Modrinth App.exe',
			target: A_AppDataLocal '\Modrinth App\Modrinth App.exe'
		}
	),

	Minecraft: AppClass(
		{
			title: 'Minecraft ahk_class GLFW30'
		}
	),

	Peak: AppClass(
		{
			title: 'PEAK ahk_class UnityWndClass'
		}
	),

	TaskBarX: AppClass(
		{
			target: 'D:\System\Programs\TaskbarX\TaskbarX.exe'
		}
	),

	Magpie: AppClass(
		{
			exe: 'Magpie.exe',
			target: 'D:\System\Programs\Magpie-v0.11.1-x64\Magpie.exe'
		}
	),
}