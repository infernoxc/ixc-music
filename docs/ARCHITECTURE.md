# Architecture

```
OBS Studio                                   your PC                                    internet
┌──────────────────────────────┐  HTTP  ┌───────────────────────────────┐
│ Dock "IXC Music"             │ ─────▶ │ IXC Helper  localhost:8767     │ ──▶ youtube.com (search, related songs)
│   /music/dock.html           │ ◀───── │  src/helper/ixc-helper.ps1     │
│ Browser source               │ ─────▶ │  - serves /music/*             │
│   "IXC Music Player"         │ ◀───── │  - command queue dock→player   │
│   /music/player.html ────────┼────────┼──- state player→dock          │ ──▶ YouTube IFrame player (in OBS)
└──────────────────────────────┘        └───────────────────────────────┘
```

| File | Role |
|---|---|
| `src/helper/ixc-helper.ps1` | Windows PowerShell 5.1 `HttpListener` on localhost. Serves the pages, relays commands and state, and scrapes YouTube search and related songs (no API key). Shared with [IXC ChatBox](https://github.com/infernoxc/ixc-chatbox), which is why it also contains TTS endpoints. |
| `src/helper/edge-tts.ps1` | Used only by IXC ChatBox's text-to-speech. Harmless when unused. |
| `src/music/player.html` | YouTube IFrame player. Polls commands every 0.5 s, pushes its state every 1.5 s, and handles autoplay, resume, error skipping and self-reload when its file changes. Stores the queue in the OBS browser's `localStorage`. |
| `src/music/dock.html` | Search, queue and controls. Polls `/api/state` every second. |
| `src/start.ps1` / `stop.ps1` | Start and stop the helper (hidden); run at login by the "IXC for OBS" task. |

## HTTP API (`http://localhost:8767`)
| Method & path | Notes |
|---|---|
| `POST /api/cmd` | Dock → player command JSON: `add{url or item}`, `playnow`, `playnext`, `play`, `pause`, `toggle`, `next`, `prev`, `jump{i}`, `remove{i}`, `move{from,to}`, `clear`, `volume{v}`, `shuffle{on}`, `repeat{on}`, `autoplay{on}`, `autostart{on}`, `seek{t}` |
| `GET /api/cmds?since=N` | `{"seq":N,"cmds":[...]}` polled by the player |
| `POST /api/state`, `GET /api/state` | Player state (queue, index, playing, volume, flags, title, position) |
| `GET /api/search?q=` | Up to 15 `{id,title,length,channel}` |
| `GET /api/related?id=&exclude=` | Up to 8 `{id,title,length}` (music-looking titles first) |
| `GET /api/version` | Newest page file time. The player reloads when it changes and keeps the song and position. |
| `GET` / `POST /api/log`, `GET /api/ping`, `GET /api/stats` | Diagnostics |

**Security:** the helper binds to `localhost` only. `/api/*` rejects requests whose `Origin` header isn't `null`,
`http://localhost:*` or `http://127.0.0.1:*` (so websites in your browser can't control it). Files are served only from the
app folders, with path traversal blocked.

**Data:** `%LOCALAPPDATA%\IXC-OBS\` holds `app\`, `config.json` and `helper.log`. The queue lives in OBS's browser storage.
