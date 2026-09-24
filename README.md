<div align="center">

<img src="docs/images/banner.png" alt="IXC Music - YouTube music player + control dock for OBS Studio" width="100%">

[![Download](https://img.shields.io/github/v/release/infernoxc/ixc-music?label=download&color=e3141e)](https://github.com/infernoxc/ixc-music/releases/latest)
[![CI](https://github.com/infernoxc/ixc-music/actions/workflows/ci.yml/badge.svg)](https://github.com/infernoxc/ixc-music/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/license-MIT-e3141e.svg)](LICENSE)
![Windows 10/11](https://img.shields.io/badge/Windows-10%20%7C%2011-0078D4)
![OBS Studio](https://img.shields.io/badge/OBS%20Studio-30%2B-302E31)

**A free, lightweight music player that lives inside OBS Studio.**<br>
Search YouTube or paste YouTube / Spotify links from an OBS dock, and choose with one click whether **Kick, Twitch or YouTube** viewers hear it.

[**⬇ Download the latest release**](https://github.com/infernoxc/ixc-music/releases/latest) · [Install guide](docs/INSTALL.md) · [How to use](docs/USAGE.md) · [Troubleshooting](docs/TROUBLESHOOTING.md)

</div>

---

<img src="docs/images/music-dock.png" alt="IXC Music dock inside OBS" align="right" width="330">

## Features
- 🎯 **Music goes to: ALL · TWITCH ONLY · KICK ONLY · YOUTUBE ONLY.** One click really switches the OBS audio tracks of the player source, then IXC reads them back from OBS to confirm. It's instant, and nothing is added to the audio path.
- 🔎 **Search YouTube from OBS.** No account needed.
- 🔗 **Paste links:**
  - YouTube videos, Shorts, YouTube Music and playlists;
  - **Spotify songs**, matched to the same song on YouTube;
  - **Spotify playlists and albums**, with your own free Spotify developer key.

  Every link is checked first. Private, deleted, duplicate and unsupported links get a clear message.
- 📜 **Queue**, 🔀 **shuffle**, 🔁 **repeat**, ♾️ **autoplay** similar songs, ▶️ **start with OBS** (resumes where it stopped).
- 🛟 **Robust playback:** unexpected pauses resume by themselves; blocked, age-restricted or removed videos are skipped with the reason shown.
- 📱 **Phone remote from anywhere**, including mobile data: now playing, controls, volume, the destination switch and adding songs.
- 🪶 **Light:** one small native background program (**IXC Core**), with instant pushed updates and no polling. About 40 MB RAM and practically 0 % CPU.

<br clear="right">

## Requirements
| | |
|---|---|
| Windows | 10 or 11 (Windows PowerShell 5.1 and .NET Framework 4.8 are built in) |
| OBS Studio | 30 or newer (its built-in WebSocket server is used for the destination switch) |
| Internet | Needed for YouTube |
| Tested on | Windows 11 (build 26200) with OBS Studio 32.2.2 (obs-websocket 5.7.4) |

## Install
1. Download **`IXC-Music-Setup-vX.Y.Z.exe`** or the portable **`.zip`** from [Releases](https://github.com/infernoxc/ixc-music/releases/latest).
2. Close OBS. Run the installer (or unzip and double-click **`Install.bat`**). No admin rights needed.
3. In OBS, add the **browser source** and the **dock**:

| Add in OBS | URL | Settings |
|---|---|---|
| Sources › + › **Browser**: **"IXC Music Player"** | `http://localhost:8767/music/player.html` | 320×180, ✅ Control audio via OBS, custom FPS **30**, keep visible (move it off-canvas) |
| Docks › **Custom Browser Docks**: "IXC Music" | `http://localhost:8767/music/dock.html` | |

4. For the destination switch: OBS › Tools › **WebSocket Server Settings** › ✅ Enable. IXC reads the password from OBS's settings by itself.

The full guide, including the audio-track setup for multistreaming, is in **[docs/INSTALL.md](docs/INSTALL.md)**.

## Honest limitations
- Spotify can't be streamed into OBS (its audio is DRM-protected, and its terms don't allow broadcasting). IXC Music finds the **same song on YouTube** instead. Without Spotify keys the match uses the title only, so it can pick a different version.
- **Spotify playlists and albums** need your own free Spotify developer app ([how](docs/CONFIGURATION.md#spotify-playlists-and-albums)). Spotify doesn't give apps its own editorial or algorithmic playlists (Top 50, Discover Weekly…), or private playlists.
- YouTube search and "similar songs" read YouTube's public web pages. That can break when YouTube changes them. You can add an official **YouTube Data API key** for search. Links are always checked with YouTube's official oEmbed service.
- Age-restricted and region-blocked videos pass the link check but can't play outside youtube.com; they're skipped with the reason when they come up.
- The destination switch changes **which OBS tracks** carry the music. Which track goes to which platform is set in your OBS output or multistream plugin (default map: Twitch 1, Kick 2, YouTube 3; you can change it).

## Documentation
[Install](docs/INSTALL.md) · [Usage](docs/USAGE.md) · [Configuration](docs/CONFIGURATION.md) · [Troubleshooting](docs/TROUBLESHOOTING.md) · [Update and uninstall](docs/UNINSTALL.md) · [Architecture and API](docs/ARCHITECTURE.md) · [Releasing](docs/RELEASING.md)

## Build from source
```powershell
git clone https://github.com/infernoxc/ixc-music.git
cd ixc-music
powershell -ExecutionPolicy Bypass -File tests\smoke.ps1 -Online     # tests (builds IXC Core in a temp folder)
powershell -ExecutionPolicy Bypass -File scripts\install.ps1         # install from source
powershell -ExecutionPolicy Bypass -File build\build.ps1 -Installer  # dist\ ZIP + Setup.exe (needs Inno Setup 6)
```

## ⚠️ Music copyright
Most commercial songs are copyrighted. Streaming them can get VODs muted or your channel struck. Use music that's
licensed for streaming (for example **NCS** or **StreamBeats**), and follow your platform's rules.

## Works great with
**[IXC ChatBox](https://github.com/infernoxc/ixc-chatbox)**: Twitch, Kick and YouTube chat in one OBS dock, with replies and chat TTS. Both share the same IXC Core.

## License and credits
Code © 2026 **Ishan (InFerNoxC)**, released under the [MIT License](LICENSE).
This project uses YouTube's embedded player, oEmbed and public pages, Spotify's oEmbed and Web API, OBS Studio and Cloudflare's tunnel. Those belong to their
owners and have their own terms: see [THIRD-PARTY-NOTICES.md](THIRD-PARTY-NOTICES.md). Not affiliated with or endorsed by YouTube/Google, Spotify, the OBS Project or Cloudflare.

<div align="center"><sub>Made by <a href="https://github.com/infernoxc">InFerNoxC</a>, built for streamers who want music without losing FPS.</sub></div>
