# Troubleshooting

**First check:** open http://localhost:8767/api/ping in any browser. You should see `{"ok":true,"app":"ixc-helper",...}`.
If not: Start menu › IXC for OBS › **Start IXC**. The log is at `%LOCALAPPDATA%\IXC-OBS\helper.log`, and player events are at
http://localhost:8767/api/log.

| Problem | Fix |
|---|---|
| Dock says **"Music player not connected"** | The *IXC Music Player* browser source must be in the current scene and visible (off-canvas is fine). URL: `http://localhost:8767/music/player.html`. Right-click it › Refresh. |
| Music plays a few seconds, then buffers or stops | Set the player's **custom frame rate to 30**. Low FPS starves YouTube's player. |
| A song shows ⚠ and is skipped | The owner blocked embedded playback, or the video is private or removed. Try another upload of the song. |
| Search finds nothing | You're offline, or YouTube changed its page. Paste a link instead, and please [open an issue](https://github.com/infernoxc/ixc-music/issues). |
| You hear it but viewers don't (or the other way round) | Advanced Audio Properties: *Monitoring* **Monitor and Output**, and tick the right *Tracks*. Check Settings › Audio › Monitoring Device. |
| `Helper running: NO` after install | Another program uses port 8767. Set `helper.port` in config.json, restart IXC, and change the OBS URLs. |
| "running scripts is disabled on this system" | Use `Install.bat` (it bypasses the policy only for this script), or run `powershell -ExecutionPolicy Bypass -File scripts\install.ps1`. |
| "Windows protected your PC" | The files aren't code-signed. Click **More info › Run anyway**, only for files from the official Releases page. |

Still stuck? [Open an issue](https://github.com/infernoxc/ixc-music/issues/new/choose) with your Windows and OBS versions and the log.
