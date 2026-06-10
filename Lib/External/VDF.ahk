#Requires AutoHotkey v2.0

VdfRead(filePath) {
	text := FileRead(filePath)
	pos := 1
	return VdfParseBlock(text, &pos)
}

VdfWrite(filePath, data) {
	try FileDelete(filePath)
	FileAppend(VdfStringify(data), filePath)
}

VdfParseBlock(text, &pos) {
	obj := Map()
	key := ""

	while (pos <= StrLen(text)) {
		token := VdfNextToken(text, &pos)
		if (token = "")
			break

		if (token = "}")
			break

		if (token = "{") {
			if (key = "")
				continue
			obj[key] := VdfParseBlock(text, &pos)
			key := ""
			continue
		}

		if (key = "") {
			key := token
		} else {
			obj[key] := token
			key := ""
		}
	}

	return obj
}

VdfNextToken(text, &pos) {
	len := StrLen(text)

	while (pos <= len) {
		c := SubStr(text, pos, 1)
		if !InStr(" `t`r`n", c)
			break
		pos++
	}

	if (pos > len)
		return ""

	c := SubStr(text, pos, 1)

	if (c = "{" || c = "}") {
		pos++
		return c
	}

	if (c = '"') {
		pos++
		start := pos

		while (pos <= len) {
			c := SubStr(text, pos, 1)
			if (c = '"')
				break
			pos++
		}

		token := SubStr(text, start, pos - start)
		pos++
		return token
	}

	start := pos

	while (pos <= len) {
		c := SubStr(text, pos, 1)
		if InStr(" `t`r`n{}", c)
			break
		pos++
	}

	return SubStr(text, start, pos - start)
}

VdfStringify(data, indent := 0) {
	space := ""

	Loop indent
		space .= "`t"

	out := ""

	for key, value in data {
		if IsObject(value) {
			out .= space '"' key '"' "`n"
			out .= space "{`n"
			out .= VdfStringify(value, indent + 1)
			out .= space "}`n"
		} else {
			out .= space '"' key '"' "`t" '"' value '"' "`n"
		}
	}

	return out
}