# Troubleshooting

**First check:** open **http://localhost:8767/diag** (Start menu › IXC for OBS › IXC diagnostics). It shows the player, OBS connection,
destination, errors and recent events. If it doesn't open: Start menu › IXC for OBS › **Start IXC**. Log: `%LOCALAPPDATA%\IXC-OBS\ixc-core.log`.

![IXC diagnostics page](images/diagnostics.png)

| Problem | Fix |
|---|---|
| Dock says **"Music player not connected"** | The *IXC Music Player* browser source must be in the current scene and visible (off-canvas is fine). URL: `http://localhost:8767/music/player.html`. Right-click it › Refresh. |
| Dock says **"IXC is not running"** | Start menu › IXC for OBS › Start IXC. If it still fails, see the log. |
| Destination: "OBS not running (or its WebSocket server is off)" | OBS › Tools › **WebSocket Server Settings** › ✅ Enable WebSocket server. |
| Destination: "OBS refused the password" | Set `obs.password` in config.json to the password shown in OBS's WebSocket Server Settings, then restart IXC. |
| Destination: "OBS has no source named …" | Rename the music browser source to **IXC Music Player**, or set `music.routing.inputName` to its exact name. |
| Destination works, but the wrong platform hears the music | Your track map differs: check which track each output uses and set `music.routing.tracks` (see [USAGE.md](USAGE.md#audio-destination)). |
| Music plays a few seconds, then buffers or stops | Set the player's **custom frame rate to 30**. |
| A song shows ⚠ and is skipped | The owner blocked embedded playback, it's age-restricted or region-blocked, or the video is private or removed. Try another upload. |
| Spotify song plays a different version | Without Spotify keys, the match uses the title only. Add your keys ([CONFIGURATION.md](CONFIGURATION.md#spotify-playlists-and-albums)), or paste the YouTube link. |
| "Spotify playlists need your own free Spotify developer app" | See [CONFIGURATION.md](CONFIGURATION.md#spotify-playlists-and-albums). |
| "Spotify won't share this playlist" | It's private, or one of Spotify's own playlists. Copy the songs into a public playlist of your own. |
| Search finds nothing | You're offline, or YouTube changed its page. Paste a link instead, add a `music.youtubeApiKey`, and please [open an issue](https://github.com/infernoxc/ixc-music/issues). |
| `IXC Core running: NO` after install | Another program uses port 8767 (for example old v1 scripts). Stop it, or set `helper.port`, restart IXC and change the OBS URLs. |
| "running scripts is disabled on this system" | Use `Install.bat`, or run `powershell -ExecutionPolicy Bypass -File scripts\install.ps1`. |

Still stuck? [Open an issue](https://github.com/infernoxc/ixc-music/issues/new/choose) with the **Recent events** from the diagnostics page.
