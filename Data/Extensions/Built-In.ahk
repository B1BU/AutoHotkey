#Requires AutoHotkey v2.0

global A_System32        := A_WinDir '\System32'
global A_UserProfile     := EnvGet('USERPROFILE')
global A_AppDataLocal    := EnvGet('LOCALAPPDATA')
global A_ProgramFilesx86 := A_ProgramFiles ' (x86)'

StrSentence(Str) => RegExReplace(Str, '^(\PL*\pL)(.*)', '$U1$L2')