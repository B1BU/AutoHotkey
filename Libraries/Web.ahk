#Requires AutoHotkey v2.0

class Web {
	static PATTERN_URL      := '^\w+?(:\/\/|\.\w)[\w\/@#%&+=.:;?]*$'
	static PATTERN_PROTOCOL := '^\w+?:\/\/'

	static HasProtocol(url) => url ~= Web.PATTERN_PROTOCOL

	static IsUrl(url) => url ~= Web.PATTERN_URL

	static Search(query) {
		if not query
			return

		query := RegExReplace(query, '\s+', '+')

		Run('https://www.google.com/search?q=' query)
	}

	static Open(url) {
		if not url
			return

		if not Web.HasProtocol(url)
			url := 'https://' url

		Run(url)
	}

	static SearchOrOpen(content) {
		if not content
			return

		if Web.IsUrl(content)
			return Web.Open(content)

		Web.Search(content)
	}
}