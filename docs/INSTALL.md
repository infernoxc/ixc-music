# Install IXC Music

About 5 minutes. No programming and no admin rights needed.

## 1. Before you start
- Windows 10 or 11.
- **OBS Studio 30+** from [obsproject.com](https://obsproject.com). Any install location works, including portable, because IXC
  Music doesn't put anything inside the OBS folder.

## 2. Download
From the [latest release](https://github.com/infernoxc/ixc-music/releases/latest), pick one:
- **`IXC-Music-vX.Y.Z.zip`** (portable package): unzip it anywhere.
- **`IXC-Music-Setup-vX.Y.Z.exe`**: a normal installer that does the same thing.

> The files aren't code-signed yet, so Windows SmartScreen may say "Windows protected your PC". Click **More info › Run anyway**,
> but only for files from the official Releases page. To verify a download:
> `Get-FileHash .\IXC-Music-v1.0.0.zip -Algorithm SHA256` and compare the result with `SHA256SUMS.txt` in the release.

## 3. Install
1. **Close OBS** (File › Exit).
2. Double-click **`Install.bat`** (or run the Setup `.exe`).
3. You should see `Helper running: YES`.

This installs to `%LOCALAPPDATA%\IXC-OBS`, starts automatically when you log in to Windows, and adds
**Start menu › IXC for OBS** (Start IXC, Stop IXC, settings, uninstall).
Optional: `scripts\install.ps1 -AddObsDocks` also adds the dock to OBS for you (with OBS closed).

## 4. Add it to OBS
### The player (a browser source)
1. **Sources › + › Browser**, name it **IXC Music Player**.
2. URL: `http://localhost:8767/music/player.html`, Width `320`, Height `180`.
3. ✅ **Control audio via OBS**. ✅ **Use custom frame rate: 30** (lower values make YouTube stutter). ❌ *Shutdown source when not visible*.
4. Drag it **off the canvas** so viewers never see the video. Keep its eye icon **on**.
5. Audio Mixer › ⚙ on *IXC Music Player* › **Advanced Audio Properties**:
   - **Audio Monitoring: Monitor and Output**, so you hear it too.
   - **Tracks:** tick the tracks that should carry music (see [USAGE.md › Audio tracks](USAGE.md#audio-tracks)).
6. Want music in other scenes too? Right-click the source › **Copy**, then in the other scene **Paste (Reference)**.

### The dock (the control panel)
**Docks › Custom Browser Docks...**, Dock Name `IXC Music`, URL `http://localhost:8767/music/dock.html` › **Apply**.
Drag the new dock wherever you like.

## 5. First test
In the IXC Music dock, type `NCS` in the search box, press Enter, then press ▶ on a result. You should hear it, and the dock shows
"▶ playing". If it says **"Music player not connected"**, check step 4 (the source must be in the current scene).

Next: [Usage](USAGE.md) · [Troubleshooting](TROUBLESHOOTING.md)
