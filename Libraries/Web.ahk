#Requires AutoHotkey v2.0

class Web {
	static PATTERN_URL      := '^\w+?(:\/\/|\.\w)[\w\/@#%&+=.:;?]*$'
	static PATTERN_PROTOCOL := '^\w+?:\/\/'

	static HasProtocol(url) => url ~= Web.PATTERN_PROTOCOL

	static IsUrl(url) => url ~= Web.PATTERN_URL

	static ToQuery(string) {
		query := Trim(string)
		query := RegExReplace(query, '\s+', '+')
		return query
	}

	static Search(raw_query) {
		if not query := Web.ToQuery(raw_query)
			return
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