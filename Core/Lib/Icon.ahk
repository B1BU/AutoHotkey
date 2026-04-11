; Based on code from https://www.autohotkey.com/boards/viewtopic.php?t=131332
; Assisted by AI

#Requires AutoHotkey v2.0

#Include Extensions.ahk
#Include Utils.ahk

PNGIcon(icon_path, icon_size := 0) {
	buf := FileRead(icon_path, 'RAW')

	; Validate PNG signature
	if (NumGet(buf, 0, "UInt") != 0x474E5089) ; ‰PNG
		Throw(Error("Not a valid PNG"))

	width  := NumGet(buf, 16, "UInt")
	height := NumGet(buf, 20, "UInt")

	if (icon_size) {
		width := height := icon_size
	}

	return 'HICON:' . DllCall(
		'CreateIconFromResourceEx',
		'Ptr', buf,
		'UInt', buf.Size,
		'UInt', true,
		'UInt', 0x30000,
		'Int', width,
		'Int', height,
		'UInt', 0,
		'Ptr'
	)
}

Icon(path, size := 16) {
	ahk_icons_dir := A_AhkDir '\Core\Assets\Icons'

	SplitPath(path, &icon, &dir, &ext)

	if (!icon)
		Throw('Icon ' icon ' not found.')

	if (!ext)
		ext := 'png'

	icon_dir := dir ? ahk_icons_dir '\' dir : ahk_icons_dir

	if ext == 'png' {
		if A_DarkMode {
			icon_path := icon_dir '\' icon '.Dark.png'
			if FileExist(icon_path)
				return PNGIcon(icon_path, size)
		}

		icon_path := icon_dir '\' icon '.png'
		if FileExist(icon_path)
			return PNGIcon(icon_path, size)

		return
	}

	icon_path := icon_dir '\' icon '.png'
	if !FileExist(icon_path)
		return icon_path

	return
}