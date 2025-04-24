#Requires AutoHotkey v2.0

class URL {
	static urlPattern := '^\w+(?::\/\/|\.\w)[\/\w@#%&+=.:;?]*$'
	static protocolPattern := '^\w+:\/\/'

	static IsValid(_url) => _url ~= URL.urlPattern
	static HasProtocol(_url) => _url ~= URL.protocolPattern
}