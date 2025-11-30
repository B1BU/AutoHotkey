#Requires AutoHotkey v2.0
A_MenuMaskKey := 'vkE8'

#Include ..\..\Data\Apps.ahk

FN_INV_SPEC := {
	hotbar: {
		offset:    0,
		x_start:   1200,
		y_start:   705,
		width:     128,
		height:    129,
		x_spacing: 4,
		y_spacing: 0,
		slots: [
			5,
		]
	},
	resources: {
		offset:    1,
		x_start:   1223,
		y_start:   244,
		width:     72,
		height:    80,
		x_spacing: 8,
		y_spacing: 16,
		slots: [
			3,
			4,
			6,
		]
	}
}

FortniteInvGetHover(&row, &slot) {
	row  := 0
	slot := 0

	MouseGetPos(&x, &y)

	if FN_INV_SPEC.hotbar.y_start <= y {
		spec_name := 'hotbar'
		spec := FN_INV_SPEC.hotbar
	} else {
		spec_name := 'resources'
		spec := FN_INV_SPEC.resources
	}

	width     := spec.width
	height    := spec.height
	x_start   := spec.x_start
	y_start   := spec.y_start
	x_spacing := spec.x_spacing
	y_spacing := spec.y_spacing
	offset    := spec.offset
	slots     := spec.slots
	rows      := slots.Length

	rel_x := x - x_start
	rel_y := y - y_start

	y_index := Floor(rel_y / (height + y_spacing)) + 1
	x_index := Floor(rel_x / (width + x_spacing)) + 1

	if not Mod(rel_x, width + x_spacing) < width
		return

	if not Mod(rel_y, height + y_spacing) < height
		return

	if not (1 <= y_index and y_index <= rows)
		return

	if not (1 <= x_index and x_index <= slots[y_index])
		return

	row := rows - y_index + offset + 1
	slot := x_index

	return true
}

#HotIf WinActive(App.Fortnite.title)
	; GENERAL
	Alt:: { ; Prevents autorun from being triggered when pressing alt combos
		KeyWait('Alt')
		Send('{Up}')
	}

	!LButton:: Enter
	!RButton:: Escape

	; EMOTES
	~\:: b ; Lobby emote override

	~\ & q:: { ; Previous page
		Send('{WheelUp}')
		Sleep(100)
	}

	~\ & e:: { ; Next page
		Send('{WheelDown}')
		Sleep(100)
	}

	; INVENTORY
	~Tab & ~LButton:: { ; View item info
		if not KeyWait('LButton', 'T0.375') {
			Send('{v Down}')
			KeyWait('LButton')
			Send('{v Up}')
		}
	}

	~Tab & RButton:: { ; Drop item
		if FortniteInvGetHover(&row, &slot) and row == 1 {
			Send('{Up}{Down}{Up ' row - 1 '}{Right ' slot - 1 '}')
			Send('{x Down}')
			KeyWait('RButton')
			Send('{x Up}')
		}
	}

	~Tab & MButton:: z ; Drop half

	; COMMS
	~RButton & e:: {
		Send('{Home}')
		KeyWait('e')
	}

	; BUILDING
	#HotIf WinActive(App.Fortnite.title) and not GetKeyState('ScrollLock', 'T')
		XButton2 & q:: {
			SetScrollLockState('On')
			Send('{m}')
		}

		XButton2 & e:: ,
		XButton2 & r:: .
		XButton2 & f:: {
			Send('{f1}')
			SetScrollLockState('On')
		}
		XButton2 & x:: {
			Send('{f2}')
			SetScrollLockState('On')
		}
		XButton2 & c:: {
			Send('{f3}')
			SetScrollLockState('On')
		}
		XButton2 & v:: {
			Send('{f4}')
			SetScrollLockState('On')
		}
		XButton2 & z:: {
			Send('{f5}')
			SetScrollLockState('On')
		}
	#HotIf WinActive(App.Fortnite.title) and GetKeyState('ScrollLock', 'T')
		~WheelDown:: SetScrollLockState('Off')
		~WheelUp:: SetScrollLockState('Off')
		~XButton1:: SetScrollLockState('Off')

		q:: {
			SetScrollLockState('Off')
			Send('{m}')
		}

		e:: ,
		r:: .
		f:: Send('{f1}')
		x:: Send('{f2}')
		c:: Send('{f3}')
		v:: Send('{f4}')
		z:: Send('{f5}')
	#HotIf
#HotIf