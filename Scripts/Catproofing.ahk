#Requires AutoHotkey v2.0
#SingleInstance Force
#NoTrayIcon

StartTime := A_TimeIdle

loop {
	if (A_TimeIdle - StartTime < 0) { ; If any input is sent
		break
	} else if (A_TimeIdle >= 1800000) { ; If no input is sent in the next 30 minutes
		Shutdown(5)
		break
	}
}