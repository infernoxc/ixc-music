# Update and uninstall

## Update to a new version
1. Download the new release (ZIP or Setup `.exe`).
2. Close OBS, then run `Install.bat` or the Setup `.exe` again.

Your `config.json`, queue and dock settings are kept. The player page reloads itself when its files change.
Check your version in `%LOCALAPPDATA%\IXC-OBS\app\music\VERSION`.

## Uninstall
1. **Close OBS**, so the dock can be removed from OBS's settings.
2. Start menu › **IXC for OBS › Uninstall IXC Music**, or double-click `Uninstall.bat` in the download folder.
   To keep your settings: `powershell -ExecutionPolicy Bypass -File "%LOCALAPPDATA%\IXC-OBS\app\scripts\uninstall.ps1" -App music -KeepSettings`
3. In OBS, delete the **IXC Music Player** source from your scenes.

What gets removed: the IXC Music files, its Start menu entry and its OBS dock. If [IXC ChatBox](https://github.com/infernoxc/ixc-chatbox)
is also installed, the shared helper, login task and settings stay for ChatBox. Otherwise everything in `%LOCALAPPDATA%\IXC-OBS`,
the login task and the Start menu folder are removed too.
If you used the `.exe`, you can also uninstall from **Settings › Apps**.
