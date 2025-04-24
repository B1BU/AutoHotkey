#Requires AutoHotkey v2.0

#Include ..\Libraries\CMD.ahk

class Server {
	__New(address, username, password) {
		this.address := address

		this.creds := {
			username: username,
			password: password
		}
	}

	SSH() {
		CMD.Run(false, 'ssh ' this.creds.username '@' this.address)
		WinWaitActive(A_ComSpec)
		Sleep(100)
		Send(this.creds.password '{Enter}')
	}
}