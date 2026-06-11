# Bibu's AutoHotkey setup
<a href="https://github.com/B1BU/AutoHotkey"><img alt="github" src="https://badgen.net/badge/icon/GitHub?icon=github&label&color=black"></a>
<a href="https://github.com/B1BU/AutoHotkey/archive/refs/heads/main.zip"><img alt="github" src="https://badgen.net/badge/icon/Download?icon=github&label&color=black"></a>

## Contents
1. [Installation](#installation)
2. [Private data setup](#private-data-setup)

## Installation
1. Download and install [AutoHotkey v2](https://www.autohotkey.com/download/ahk-v2.exe).
2. Download the [Repo](https://github.com/B1BU/AutoHotkey/archive/refs/heads/main.zip) and extract it somewhere appropriate.
3. Run [Setup.ahk](Setup.ahk) to configure your setup.
4. Check `Run Startup.ahk when Windows starts`.

## Private data setup
Some functionality requires private data to be provided. Create these files if needed.

### Data/Private/Creds.yaml
```yaml
username: <USERNAME>
password: <PASSWORD>
```

### Data/Private/Servers.yaml
```yaml
<SERVER_NAME>:
  address:  <SERVER_ADDRESS>
  username: <USERNAME>
  password: <PASSWORD>
```