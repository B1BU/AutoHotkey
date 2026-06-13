#Requires AutoHotkey v2.0

B_ActiveBindGroup := ''
SetActiveBindGroup(value := '', syncScrollLock := true) {
	global B_ActiveBindGroup

	B_ActiveBindGroup := String(value)

	if syncScrollLock
		SetScrollLockState(B_ActiveBindGroup ? 'On' : 'Off')
}

#HotIf B_ActiveBindGroup
	ScrollLock:: SetActiveBindGroup()
#HotIf