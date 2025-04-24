#Requires AutoHotkey v2.0

/*	Keybindings
	[Color Picker Open]
	H	- Pick Hex
	C	- Pick RGB
	R	- Pick Red
	G	- Pick Green
	B	- Pick Blue
	X	- Pick Hex without #
*/

#Include ..\..\..\Data\Extensions\Object.ahk

class ColorPicker {
	static title := 'ahk_exe PowerToys.ColorPickerUI.exe'

	static defaultFormat := 'hex'

	static Formatting := {
		x:		(this) => this.x,
		r:		(this) => this.r,
		g:		(this) => this.g,
		b:		(this) => this.b,
		hex:	(this) => '#' this.x,
		rgb:	(this) => this.r ', ' this.g ', ' this.b
	}

	static OnClose() {
		if not (RegExMatch(A_Clipboard, '^#([0-9A-F]{6})｜(\d{1,3})\s(\d{1,3})\s(\d{1,3})$', &match)) {
			return
		}

		this.x := match[1]
		this.r := match[2]
		this.g := match[3]
		this.b := match[4]

		A_Clipboard := this.GetFormat(this.format)
	}

	static Pick(format) {
		ColorPicker.format := format
		Send('{Enter}')
	}

	static GetFormat(format) {
		function := this.Formatting.Get(format) or function := this.Formatting.Get(this.defaultFormat)
		result := function(this)
		return result
	}
}

#HotIf (WinExist(ColorPicker.title))
	h:: ColorPicker.Pick('hex')		; Hex
	x:: ColorPicker.Pick('x')		; Hex without #
	r:: ColorPicker.Pick('r')		; Red
	g:: ColorPicker.Pick('g')		; Green
	b:: ColorPicker.Pick('b')		; Blue
	c:: ColorPicker.Pick('rgb')		; RGB
#HotIf

_ColorPickerWatcher() {
	WinWait(ColorPicker.title)
	ColorPicker.format := ColorPicker.defaultFormat
	WinWaitClose(ColorPicker.title)
	ColorPicker.OnClose()
}

SetTimer(_ColorPickerWatcher)