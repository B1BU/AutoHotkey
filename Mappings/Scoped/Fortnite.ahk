#Requires AutoHotkey v2.0
A_MenuMaskKey := 'vkE8'

#Include ..\..\Extensions\Object.ahk
#Include ..\..\Data\Apps.ahk

class Fortnite {
	static building := false

	static key := {
		toggle:		'{~}',
		mat:		'{r}',
		wall:		'{F1}',
		floor:		'{F2}',
		stair:		'{F3}',
		pyramid:	'{F4}',
		trap:		'{F5}',
	}
}

#HotIf (WinActive(App.Fortnite.title))
	; General
	Alt::=						; Auto run

	; Menus
	Alt & LButton:: Send('{Enter}')				; Enter
	Alt & RButton:: Send('{Escape}')			; Esc

	; Emotes
	~\:: b										; Lobby emote override

	~\ & q:: {									; Previous page
		Send('{WheelUp}')
		Sleep(100)
	}

	~\ & e:: {									; Next page
		Send('{WheelDown}')
		Sleep(100)
	}

	; Inventory
	~Tab & ~LButton:: {							; View item info
		if not (KeyWait('LButton', 'T0.5')) {
			Send('{v Down}')
			KeyWait('LButton')
			Send('{v Up}')
		}
	}

	~Tab & RButton:: {							; Drop item
		Send('{LButton}{x Down}')
		KeyWait('RButton')
		Send('{x Up}')
	}

	~Tab & MButton:: Send('{LButton}{z}')		; Drop half

	; Comms
	!MButton:: Send('{PgDn}')					; Mark danger

	~MButton & RButton:: Send('{Esc}')			; Close menu

	~MButton & WheelUp::	return				; Supress scroll
	~MButton & WheelDown::	return

	~MButton & q:: {							; Previous page
		Send('{WheelUp}')
		Sleep(100)
	}

	~MButton & e:: {							; Next page
		Send('{WheelDown}')
		Sleep(100)
	}

	; Requests
	~PgUp & RButton:: Send('{Esc}')				; Close requests

	~PgUp & WheelUp::	return					; Supress scroll
	~PgUp & WheelDown::	return

	~PgUp & q:: {								; Previous page
		Send('{WheelUp}')
		Sleep(100)
	}

	~PgUp & e:: {								; Next page
		Send('{WheelDown}')
		Sleep(100)
	}

	; Mod bench
	CapsLock & XButton1:: return				; Disabled
	CapsLock & WheelDown:: return
	CapsLock & WheelUp:: return
	CapsLock & c:: return

	CapsLock & RButton:: Esc					; Exit mod bench

	CapsLock & w:: Send('{z}')					; Previous category
	CapsLock & s:: Send('{c}')					; Next category
	CapsLock & a:: Send('{q}')					; Previous part
	CapsLock & d:: Send('{e}')					; Next part

	CapsLock & LButton:: {						; Buy and equip/Remove mod
		Send('{h Down}{x Down}')
		KeyWait('LButton')
		Send('{h Up}{x Up}')
	}

	; Building
	*XButton2:: XButton2										; Edit piece
	XButton2 & e:: g											; Repair piece

	#HotIf (WinActive(App.Fortnite.title) and not Fortnite.building)
		XButton2 & f:: {													; Build wall
			Send(Fortnite.key.wall)
			Fortnite.building := true
		}
		XButton2 & x:: {													; Build floor
			Send(Fortnite.key.floor)
			Fortnite.building := true
		}
		XButton2 & c:: {													; Build stair
			Send(Fortnite.key.stair)
			Fortnite.building := true
		}
		XButton2 & v:: {													; Build pyramid
			Send(Fortnite.key.pyramid)
			Fortnite.building := true
		}
		XButton2 & z:: {													; Build trap
			Send(Fortnite.key.trap)
			Fortnite.building := true
		}

		XButton2 & q:: {													; Enter build mode
			Send(Fortnite.key.toggle)
			Fortnite.building := true
		}
	#HotIf (WinActive(App.Fortnite.title) and Fortnite.building)
		~XButton1::	Fortnite.building := false					; Pickaxe exit building
		~1::		Fortnite.building := false					; Slot 1 exit building
		~2::		Fortnite.building := false					; Slot 2 exit building
		~3::		Fortnite.building := false					; Slot 3 exit building
		~4::		Fortnite.building := false					; Slot 4 exit building
		~5::		Fortnite.building := false					; Slot 5 exit building

		WheelUp::	Send(Fortnite.key.mat Fortnite.key.mat)		; Previous material
		WheelDown::	Send(Fortnite.key.mat)						; Next material

		f:: Send(Fortnite.key.wall)								; Build wall
		x:: Send(Fortnite.key.floor)							; Build floor
		c:: Send(Fortnite.key.stair)							; Build stair
		v:: Send(Fortnite.key.pyramid)							; Build pyramid
		z:: Send(Fortnite.key.trap)								; Build trap

		q:: {													; Exit build mode
			Send(Fortnite.key.toggle)
			Fortnite.building := false
		}

#HotIf