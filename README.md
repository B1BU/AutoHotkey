# Bibu's AutoHotkey setup
## Installation
Use the [Setup Script](Setup.ahk) to enable or disable running the [Startup Script](Startup.ahk) when Windows starts.

## Private data files
Some functionality requires private data to be provided.

Please create the following files if needed:

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