#Requires AutoHotkey v2.0

#Include Path.ahk

#Include Extensions.ahk

PlaySound(sound) {
	_SoundExts := ['wav', 'mp3', 'ogg']

	sound := Path(sound)

	if not (sound.IsAbs()) {
		sound := Path(A_ScriptDir, 'Assets/Sounds', sound.path)
	}

	if (sound.ext) {
		if not (InArray(_SoundExts, sound.ext)) {
			return
		}

		if (FileExist(sound.path) == 'A') { ; Replace with path lib thing
			return SoundPlay(sound.path)
		}
	}

	for ext in _SoundExts {
		guess := sound.path '.' ext

		if (FileExist(guess) == 'A') { ; Replace with path lib thing
			return SoundPlay(guess)
		}
	}
}