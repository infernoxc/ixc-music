# Update and uninstall

## Update to a new version
1. Download the new release (ZIP or Setup `.exe`).
2. Close OBS, then run `Install.bat` or the Setup `.exe` again.

Your `config.json` (a backup is saved next to it), queue and dock settings are kept. IXC Core is rebuilt, and the player page reloads itself.
Check your version in `%LOCALAPPDATA%\IXC-OBS\app\music\VERSION`.

**From v1.x to v2:** the OBS URLs stay the same. For the new destination switch, enable OBS's WebSocket server and keep the source name
**IXC Music Player** (see [INSTALL.md](INSTALL.md#the-destination-switch-all--twitch--kick--youtube-only)).

## Uninstall
1. **Close OBS**, so the dock can be removed from OBS's settings.
2. Start menu › **IXC for OBS › Uninstall IXC Music**, or double-click `Uninstall.bat` in the download folder.
   To keep your settings: `powershell -ExecutionPolicy Bypass -File "%LOCALAPPDATA%\IXC-OBS\app\scripts\uninstall.ps1" -App music -KeepSettings`
3. In OBS, delete the **IXC Music Player** source from your scenes.

What gets removed: the IXC Music files, its Start menu entry and its OBS dock. If [IXC ChatBox](https://github.com/infernoxc/ixc-chatbox)
is also installed, IXC Core, the login task and your settings stay for ChatBox. Otherwise everything in `%LOCALAPPDATA%\IXC-OBS`
(including the downloaded `cloudflared.exe`), the login task and the Start menu folder are removed too.
If you used the `.exe`, you can also uninstall from **Settings › Apps**.
