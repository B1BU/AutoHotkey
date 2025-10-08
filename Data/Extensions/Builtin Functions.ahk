#Requires AutoHotkey v2.0

StrSentence(str) => RegExReplace(str, '^(\PL*\pL)(.*)', '$U1$L2')