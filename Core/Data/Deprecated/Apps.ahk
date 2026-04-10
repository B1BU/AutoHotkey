#Requires AutoHotkey v2.0

#Include ..\..\Lib\Extensions.ahk
#Include ..\..\Lib\Deprecated\App.ahk
#Include ..\..\Lib\Explorer.ahk
#Include ..\..\Lib\CMD.ahk
#Include ..\..\Lib\VSCode.ahk

global DeprecatedApp := {
	AHK: DeprecatedAppClass(
		{
			exe: 'AutoHotkey64.exe'
		}
	),

	TaskMgr: DeprecatedAppClass(
		{
			exe: 'Taskmgr.exe',
			title: 'ahk_class TaskManagerWindow'
		}
	),

	Explorer: DeprecatedAppClass(
		{
			exe: 'explorer.exe',
			title: 'ahk_class CabinetWClass',
			Restart: Explorer.Restart
		}
	),

	Desktop: DeprecatedAppClass(
		{
			title: 'ahk_class WorkerW'
		}
	),

	CMD: DeprecatedAppClass(
		{
			exe: 'cmd.exe',
			Open: Cmd.Open
		}
	),

	PowerShell: DeprecatedAppClass(
		{
			exe: 'powershell.exe'
		}
	),

	Calc: DeprecatedAppClass(
		{
			exe: 'calc.exe',
			title: 'Calculadora'
		}
	),

	VSCode: DeprecatedAppClass(
		{
			exe: 'Code.exe',
			target: A_AppDataLocal '\Programs\Microsoft VS Code\Code.exe',
			Open: VSCode.Open
		}
	),

	Chrome: DeprecatedAppClass(
		{
			target: A_ProgramFiles '\Google\Chrome\Application\chrome.exe'
		}
	),

	ChromeBeta: DeprecatedAppClass(
		{
			target: A_ProgramFiles '\Google\Chrome Beta\Application\chrome.exe'
		}
	),

	Gemini: DeprecatedAppClass(
		{
			title: 'Gemini ahk_class Chrome_WidgetWin_1',
			target: '"' A_ProgramFiles '\Google\Chrome\Application\chrome_proxy.exe"  --profile-directory=Default --app-id=pificchcdfpinjikejhcfjobjdhcedjj'

		}
	),

	ChatGPT: DeprecatedAppClass(
		{
			title: 'ChatGPT ahk_class Chrome_WidgetWin_1',
			target: '"' A_ProgramFiles '\Google\Chrome\Application\chrome_proxy.exe"  --profile-directory=Default --app-id=cadlkienfkclaiaibeoongdcgmdikeeg'
		}
	),

	Obsidian: DeprecatedAppClass(
		{
			exe: 'Obsidian.exe',
			target: A_ProgramFiles '\Obsidian\Obsidian.exe'
		}
	),

	Notion: DeprecatedAppClass(
		{
			exe: 'Notion.exe',
			target: A_AppDataLocal '\Programs\Notion\Notion.exe'
		}
	),

	Discord: DeprecatedAppClass(
		{
			exe: 'Discord.exe',
			target: '"' A_AppDataLocal '\Discord\Update.exe" --processStart Discord.exe'
		}
	),

	WhatsApp: DeprecatedAppClass(
		{
			title: 'WhatsApp',
			target: 'shell:AppsFolder\5319275A.WhatsAppDesktop_cv1g1gvanyjgm!App'
		}
	),

	Spotify: DeprecatedAppClass(
		{
			exe: 'Spotify.exe'
		}
	),

	Steam: DeprecatedAppClass(
		{
			exe: 'Steam.exe',
			title: 'ahk_exe steamwebhelper.exe',
			target: A_ProgramFilesx86 '\Steam\steam.exe'
		}
	),

	SteamBP: DeprecatedAppClass(
		{
			exe: 'steamwebhelper.exe',
			title: 'Big Picture ahk_exe steamwebhelper.exe',
			target: 'steam://open/bigpicture'
		}
	),

	Epic: DeprecatedAppClass(
		{
			exe: 'EpicGamesLauncher.exe',
			target: A_ProgramFilesx86 '\Epic Games\Launcher\Portal\Binaries\Win32\EpicGamesLauncher.exe'
		}
	),

	Xbox: DeprecatedAppClass(
		{
			title: 'Xbox',
			target: 'shell:AppsFolder\Microsoft.GamingApp_8wekyb3d8bbwe!Microsoft.Xbox.App'
		}
	),

	OBS: DeprecatedAppClass(
		{
			exe: 'obs64.exe'
		}
	),

	Audacity: DeprecatedAppClass(
		{
			exe: 'audacity.exe'
		}
	),

	Krita: DeprecatedAppClass(
		{
			exe: A_ProgramFiles '\Krita (x64)\bin\krita.exe'
		}
	),

	Fusion360: DeprecatedAppClass(
		{
			exe: 'fusion360.exe'
		}
	),

	Blockbench: DeprecatedAppClass(
		{
			exe: 'Blockbench.exe'
		}
	),

	SupermarketSimulator: DeprecatedAppClass(
		{
			exe: 'Supermarket Simulator.exe'
		}
	),

	Fortnite: DeprecatedAppClass(
		{
			exe: 'FortniteClient-Win64-Shipping.exe'
		}
	),

	OutlastTrials: DeprecatedAppClass(
		{
			exe: 'TOTClient-Win64-Shipping.exe'
		}
	),

	HalfLife2: DeprecatedAppClass(
		{
			exe: 'hl2.exe',
			title: 'Half-Life 2 ahk_exe hl2.exe'
		}
	),

	Modrinth: DeprecatedAppClass(
		{
			exe: 'Modrinth DeprecatedApp.exe',
			target: A_AppDataLocal '\Modrinth App\Modrinth DeprecatedApp.exe'
		}
	),

	Minecraft: DeprecatedAppClass(
		{
			title: 'Minecraft ahk_class GLFW30'
		}
	),

	Peak: DeprecatedAppClass(
		{
			title: 'PEAK ahk_class UnityWndClass'
		}
	),

	TaskBarX: DeprecatedAppClass(
		{
			target: 'D:\System\Programs\TaskbarX\TaskbarX.exe'
		}
	),

	Magpie: DeprecatedAppClass(
		{
			exe: 'Magpie.exe',
			target: 'D:\System\Programs\Magpie-v0.11.1-x64\Magpie.exe'
		}
	),
}