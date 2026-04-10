#Requires AutoHotkey v2.0

; Set format on PowerToys to "#%ReX%GrX%BlX｜%Re %Gr %Bl"

; ! Add color conversions

#Include ..\..\..\
#Include Core\Lib\Extensions.ahk
#Include Core\Lib\Utils.ahk

class _ColorPicker {
	static title := 'ahk_exe PowerToys.ColorPickerUI.exe'
	static pattern := '^#([0-9A-F]{6})｜(\d{1,3})\s(\d{1,3})\s(\d{1,3})$'

	static x := ''
	static r := ''
	static g := ''
	static b := ''

	static clipboard := ''
	static selected_format := ''

	static formats := {
		red:   (this) => this.r,
		green: (this) => this.g,
		blue:  (this) => this.b,
		rgb:   (this) => this.r . ', ' . this.g . ', ' . this.b,
		hex:   (this) => '#' . this.x,
		hex2:  (this) => this.x,
	}

	static default_format := this.formats.hex

	static IsPicked() {
		if !this.clipboard
			return false

		if A_Clipboard == this.clipboard
			return true

		this.clipboard := ''
		return false
	}

	static GetFormat(format := '') {
		return ObjGet(this.formats, format, this.default_format)(this)
	}

	static CopyFormat(format := '') {
		this.clipboard := A_Clipboard := this.GetFormat(format)
	}

	static ParsePick() {
		if not (RegExMatch(A_Clipboard, this.pattern, &match))
			return

		this.x := match[1]
		this.r := match[2]
		this.g := match[3]
		this.b := match[4]
	}

	static OnClose() {
		this.ParsePick()
		this.CopyFormat()
	}
}

_ColorPickerWatcher() {
	WinWait(_ColorPicker.title)
	WinWaitClose(_ColorPicker.title)
	_ColorPicker.OnClose()
}

SetTimer(_ColorPickerWatcher)

_ColorPickerFormatMenu := Menu()
FillMenu(_ColorPickerFormatMenu, [
	{
		name: 'HEX',
		callback: (*) => _ColorPicker.selected_format := 'hex'
	},
	{
		name: 'HEX Value',
		callback: (*) => _ColorPicker.selected_format := 'hex2'
	},
	{
		name: 'RGB',
		callback: (*) => _ColorPicker.selected_format := 'rgb'
	},
	{
		name: 'Red',
		callback: (*) => _ColorPicker.selected_format := 'red'
	},
	{
		name: 'Green',
		callback: (*) => _ColorPicker.selected_format := 'green'
	},
	{
		name: 'Blue',
		callback: (*) => _ColorPicker.selected_format := 'blue'
	},
])

#!c:: {
	if !_ColorPicker.IsPicked()
		return
	_ColorPickerFormatMenu.Show()
	_ColorPicker.CopyFormat(_ColorPicker.selected_format)
}

#!v:: {
	if !_ColorPicker.IsPicked()
		return
	_ColorPickerFormatMenu.Show()
	_ColorPicker.CopyFormat(_ColorPicker.selected_format)
	Send('^v')
}