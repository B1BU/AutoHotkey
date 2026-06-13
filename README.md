# Bibu's AutoHotkey setup
<a href="https://github.com/B1BU/AutoHotkey"><img src="https://shieldcn.dev/badge/GitHub.svg?size=xs&variant=outline&valueColor=F0F6FC&color=F0F6FC&valueColor=F0F6FC&gradient=F0F6FC20%2C+F0F6FC20&logo=github&logoColor=F0F6FC" alt="badge"></a>

This repo is meant primarily as a way for me to share my personal AutoHotkey setup with my friends. Do not expect something polished.

## Contents
1. [Installation](#installation)
2. [Private data setup](#private-data-setup)

## Installation
<a href="https://www.autohotkey.com/download/ahk-v2.exe"><img src="https://shieldcn.dev/badge/Install-AutoHotkey%20v2.svg?size=xs&variant=outline&valueColor=8CF287&color=8CF287&labelTextColor=8CF287C0&valueColor=8CF287&gradient=8CF28720%2C+8CF28720&logo=autohotkey&logoColor=8CF287" alt="download button"></a>
<a href="https://github.com/B1BU/AutoHotkey/archive/refs/heads/main.zip"><img src="https://shieldcn.dev/badge/Download-Repo.svg?size=xs&variant=outline&valueColor=F0F6FC&color=F0F6FC&labelTextColor=F0F6FCC0&valueColor=F0F6FC&gradient=F0F6FC20%2C+F0F6FC20&logo=github&logoColor=F0F6FC" alt="download button"></a>

1. Download and install [AutoHotkey v2](https://www.autohotkey.com/download/ahk-v2.exe).
2. Download the [repo](https://github.com/B1BU/AutoHotkey/archive/refs/heads/main.zip) and extract it somewhere appropriate.
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