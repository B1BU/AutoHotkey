#Requires AutoHotkey v2.0

/**
 * @description `StrSentence()`
 * Converts a string to Sentence Case.
 * The first letter of the first word is capitalized.
 * @param {(String)} Str
 * The string to convert.
 * @returns {(String)}
 * A string converted to Sentence Case.
 * @example <caption>Convert text to sentence case.</caption>
 * str := 'sentence case conversion.'
 * MsgBox(str)
 * str := StrSentence(str)
 * MsgBox(str)
 */
StrSentence(Str) => String