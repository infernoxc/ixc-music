# Architecture

```
OBS Studio                                 your PC                                          internet
┌──────────────────────────────┐ one WS ┌─────────────────────────────────────┐
│ Dock "IXC Music"             │ ◀────▶ │ IXC Core  localhost:8767             │ ──▶ YouTube oEmbed / search / "up next"
│   /music/dock.html           │        │  src/core/*.cs  (ixc-core.exe)        │ ──▶ Spotify oEmbed (+ Web API with your keys)
│ Browser source               │ ◀────▶ │  commands dock → player (push)        │
│   "IXC Music Player"         │        │  state player → docks/phones (push)   │
│   /music/player.html ────────┼──▶ YouTube IFrame player                     │
└───────────▲──────────────────┘        │  obs-websocket client ───────────────┼──▶ OBS :4455 (SetInputAudioTracks)
            └─────────── audio tracks ◀─┘  phone remote 127.0.0.1:8769 ◀── Cloudflare tunnel ◀── phone
```

**IXC Core** is one small native program (C# 5 on .NET Framework 4.8), built on your PC by `src/core/build-core.ps1` with the compiler
that ships with Windows. It replaces the v1 PowerShell helper. Each page keeps one WebSocket, and updates are pushed, so nothing polls.

| File | Role |
|---|---|
| `src/core/Core.cs` | HTTP server, WebSocket hub, config, diagnostics, file serving (no path escapes) |
| `src/core/Links.cs` | Reconnecting obs-websocket 5 client (authenticated) and the Streamer.bot client (used by ChatBox) |
| `src/core/Music.cs` | Command/state relay, YouTube search and related songs, link checks (YouTube + Spotify), audio destination |
| `src/core/Remote.cs` | Phone remote: cloudflared tunnel, one-time pairing, sessions |
| `src/core/Chat.cs`, `Tts.cs` | IXC ChatBox features (inactive when only IXC Music is installed) |
| `src/core/web/` | `ixc.js` (page ↔ core link), `phone.js` (QR dialog), `mobile.html` (phone UI), `diag.html` |
| `src/music/player.html` | YouTube IFrame player: queue, autoplay, resume, error skipping; matches Spotify songs on YouTube when their turn comes |
| `src/music/dock.html` | Search, links, queue, controls, destination switch |

## Audio destination
`music.route {mode}` → `SetInputAudioTracks` on the source named `music.routing.inputName` (only tracks listed in `music.routing.tracks`)
→ `GetInputAudioTracks` to verify → result to every dock and phone. IXC also listens for OBS's `InputAudioTracksChanged` event
(manual changes) and re-applies the saved mode when OBS (re)connects or the source is created or renamed.

## HTTP API (`http://localhost:8767`, requests from other websites are refused)
| Method & path | Notes |
|---|---|
| `POST /api/cmd` | Dock → player command: `add{url or item}`, `addmany{items}`, `playnow`, `playnext`, `play`, `pause`, `toggle`, `next`, `prev`, `jump{i}`, `remove{i}`, `move{from,to}`, `clear`, `volume{v}`, `shuffle{on}`, `repeat{on}`, `autoplay{on}`, `autostart{on}`, `seek{t}` |
| `GET /api/music/resolve?url=` | Checks a link or search words → `{ok, kind, title, item | items, duplicate, note}` or `{ok:false, code, error}` |
| `POST /api/music/add {url, mode, force}` | Resolve + queue (`mode`: `add`, `playnow`, `playnext`) |
| `GET /api/music/match?q=&ms=` | Best YouTube match for a song name (used for Spotify songs) |
| `GET` / `POST /api/music/route {mode}` | Audio destination |
| `GET /api/search?q=` · `GET /api/related?id=&exclude=` | YouTube search · similar songs |
| `GET /api/state` · `GET /api/cmds?since=N` · `GET /api/ping` · `GET /api/diag` | v1-compatible state and command APIs, status, diagnostics |

WebSocket `/ws`: send `{"type":"hello","role":"musicdock","topics":["music.state"]}`. Messages: `music.cmd {c}`, `music.add {url, mode}`,
`music.search {q}`, `music.route {mode}`. The player sends `music.state {s}` (on every change, and every 5 s while playing).

**Data:** `%LOCALAPPDATA%\IXC-OBS\` holds `app\`, `config.json` and `ixc-core.log`. The queue lives in OBS's browser storage.
