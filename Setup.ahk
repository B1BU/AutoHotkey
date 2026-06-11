#Requires AutoHotkey v2.0
#SingleInstance Force

#Include Load\Apps.ahk
#Include Lib\Extensions.ahk
#Include Lib\Path.ahk

Install(*) {
	FileCreateShortcut(
		shortcut_target.path,
		shortcut_path.path,
		shortcut_target.Parent().path
	)
}

Uninstall(*) {
	try FileDelete(shortcut_path.path)
}

shortcut_target := Path('Startup.ahk').Absolute()
shortcut_path   := Path(A_Startup, 'AHK Startup.lnk')

{ ; Window
	win_title := 'Startup Script Installer'
	win_min_w := 220

	{ ; Gui
		win_gui := Gui(, win_title)

		{ ; Force unfocus
			win_gui_nul := win_gui.AddGroupBox(ArrJoin([
				'w-6',
				'h-6',
			], ' '))
			win_gui_nul.Focus()
		}

		{ ; Button: Run startup script
			win_gui_btn2 := win_gui.AddButton(
				ArrJoin([
					'w' win_min_w,
				], ' '),
				'Run startup script'
			)
			win_gui_btn2.OnEvent('Click', (*) => Run(shortcut_target.path))
		}
		{ ; Button: Open startup folder
			win_gui_btn1 := win_gui.AddButton(
				ArrJoin([
					'w' win_min_w,
				], ' '),
				'Open startup folder'
			)
			win_gui_btn1.OnEvent('Click', (*) => Run(A_Startup))
		}
		{ ; Checkbox: Run at startup
			win_gui_cb1 := win_gui.AddCheckbox(,
				'Run Startup.ahk when Windows starts'
			)
			win_gui_cb1.OnEvent(
				'Click',
				(ctrl, info) => ctrl.Value ? Install() : Uninstall()
			)
			win_gui_cb1.Value := shortcut_path.Exists()
		}

		win_gui.Show()
	}
}