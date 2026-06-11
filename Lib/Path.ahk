#Requires AutoHotkey v2.0

#Include Extensions.ahk

PathUpperDrive(_path) {
	if _path is Path
		_path := _path.path

	return RegExReplace(_path, '^([a-z]:)', '$U1')
}
PathNormalize(_path) {
	if _path is Path
		_path := _path.path

	_path := PathUpperDrive(_path)
	_path := RegExReplace(_path, '[\\\/]+', '\')
	return _path
}

PathSplit(_path) {
	if _path is Path
		return _path.parts

	result := StrSplit(PathNormalize(_path), '\')
	return (result.Length) ? result : ['']
}
PathJoin(paths*) {
	if !paths.Length
		return ''

	result := ArrJoin(paths, '\')
	result := PathNormalize(result)
	return result
}

PathAscend(_path, ascend := 1) {
	if _path is Path
		return _path.Ascend(ascend).path

	parts := PathSplit(_path)
	parts := ArrSlice(parts, 0, -ascend)
	result := PathJoin(parts*)
	return result
}

PathToPosix(_path) {
	if _path is Path
		return _path.AsPosix()

	return RegExReplace(_path, '[\\\/]+', '/')
}
PathToAbsolute(_path) {
	if (PathIsAbs(_path))
		return _path

	cwd := Path.Cwd()

	if _path is Path {
		parts := _path.parts
		_path := _path.path
	} else {
		parts := PathSplit(_path)
	}

	if (_path == '')
		return cwd.path

	if parts.Length == 1 {
		part := parts[1]

		if (part == '.')
			return cwd.path

		if (part == '..')
			return cwd.dir
	} else if ( ; Path is '/'
		parts.Length == 2 and
		not parts[1] and
		not parts[2]
	) {
		return cwd.path
	}

	leading_parts := cwd.parts

	for index, part in parts {
		if not (part == '..') {
			ascend := index - 1
			break
		}
	}

	if (ascend > 0) {
		leading_parts := ArrSlice(leading_parts, 0, -ascend)
		parts := ArrSlice(parts, ascend)
	}

	parts.InsertAt(1, leading_parts*)

	return ArrJoin(parts, '\')
}

PathRelativeTo(dir, _path) => '' ; Reserved
PathExists(_path) => ''          ; Reserved
PathIsDir(_path) => ''           ; Reserved
PathIsFile(_path) => ''          ; Reserved

PathIsAbs(_path) {
	if _path is Path
		return _path.drive != ''

	return _path ~= '^[a-zA-Z]:'
}

class Path {
	static Cwd() => Path(A_WorkingDir)

	__New(paths*) {
		fullpath := PathJoin(paths*)

		this.path := fullpath
		this.parts := StrSplit(fullpath, '\')

		this.name := this.dir := this.ext := this.stem := this.drive := ''
		SplitPath(this.path, &this.name, &this.dir, &this.ext, &this.stem, &this.drive)
	}

	ToString() => this.path

	IsAbs() => PathIsAbs(this)

	Ascend(ascend := 1) => Path(ArrSlice(this.parts, 0, -ascend)*)
	Parent() => this.Ascend()
	AsPosix() => ArrJoin(this.parts, '/')
	Absolute() => Path(PathToAbsolute(this))
	Exists() => FileExist(this.path) != ''
}