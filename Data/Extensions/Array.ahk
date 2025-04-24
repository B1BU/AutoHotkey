#Requires AutoHotkey v2.0

Array.Prototype.Join := (this, sep := ', ') {
	if (this.Length == 1) {
		return this[1]
	}

	result := ''
	for index, value in this {
		if (index > 1) {
			result .= sep
		}
		result .= this[A_Index]
	}
	return result
}

Array.Prototype.Contains := (this, needle) {
	for value in this {
		if (value == needle) {
			return true
		}
	}
	return false
}

Array.Prototype.Filter := (this) {
	result := []
	for value in this {
		if (value) {
			result.Push(value)
		}
	}
	return result
}

Array.Prototype.Slice := (this, start, length := '') {
	len := this.Length

	if (start > len) {
		return []
	}

	if (start < 0) {
		start += len
	}

	if (length == '') {
		length := len - start
	} else if (length < 0) {
		length += len - start
	}

	length := Min(length, len - start)

	result := []
	loop length {
		result.Push(this[start + A_Index])
	}
	return result
}
