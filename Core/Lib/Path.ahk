#Requires AutoHotkey v2.0

#Include Extensions.ahk

class Path {
	static sep := (A_OSVersion) ? '\' : '/'

	static cwd := Path(A_WorkingDir)

	static Split(_path) {
		result := StrSplit(Path.Normalize(_path), Path.sep)
		return (result.Length) ? result : ['']
	}

	static Join(_paths*) => Path.Normalize(ArrJoin(_paths, Path.sep))

	static Ascend(_path, _ascend := 1) => Path.Join(ArrSlice(Path.Split(_path), 0, -_ascend)*)

	static ToPosix(_path) => RegExReplace(_path, '[\\\/]+', '/')

	static UpperDrive(_path) => RegExReplace(_path, '^([a-z]:)', '$U1')

	static Normalize(_path) => Path.UpperDrive(RegExReplace(_path, '[\\\/]+', Path.sep))

	static AbsPath(_path) {
		if not (_path) {
			return Path.cwd.path
		}

		if (Path.IsAbs(_path)) {
			return _path
		}

		parts := Path.Split(_path)

		if (parts.Length == 1) {
			item := parts[1]

			if (item == '.') {
				return Path.cwd.path
			}

			if (item == '..') {
				return Path.cwd.dir
			}
		} else if (parts.Length == 2 and not parts[1] and not parts[2]) {
			return Path.cwd.path
		}

		for index, item in parts {
			if not (item == '..') {
				ascend := index - 1
				break
			}
		}

		leadingParts := Path.cwd.parts

		if (ascend > 0) {
			leadingParts := ArrSlice(leadingParts, 0, -ascend)
			parts := ArrSlice(parts, ascend)
		}

		parts.InsertAt(1, leadingParts*)

		return ArrJoin(parts, Path.sep)
	}

	static RelativeTo(_dir, _path) => ''	; Reserved
	static Exists(_path)  => ''				; Reserved
	static IsDir(_path)  => ''				; Reserved
	static IsFile(_path)  => ''				; Reserved

	static IsAbs(_path) => _path ~= '^[a-zA-Z]:'

	__New(_paths*) {
		if not (_paths) {
			return
		}

		this.path := Path.Join(_paths*)

		this.parts := StrSplit(this.path, Path.sep)

		this.name := ''
		this.dir := ''
		this.ext := ''
		this.stem := ''
		this.drive := ''

		SplitPath(this.path, &this.name, &this.dir, &this.ext, &this.stem, &this.drive)
	}

	; ToString() => this.path

	Ascend(_ascend := 1) => Path(ArrSlice(this.parts, 0, -_ascend)*)

	GetParent() => this.Ascend()

	IsAbs() => Path.IsAbs(this.path)
}