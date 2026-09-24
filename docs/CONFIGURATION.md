# Configuration

Settings live in **`%LOCALAPPDATA%\IXC-OBS\config.json`** (Start menu › IXC for OBS › IXC settings). Updates keep this file.
After editing it: Start menu › **Stop IXC**, then **Start IXC**. Shuffle, repeat, autoplay, volume, the queue and the destination
are set in the dock and remembered automatically.

| Setting | Default | Meaning |
|---|---|---|
| `helper.port` | `8767` | Port of IXC Core. If you change it, change every OBS URL (`http://localhost:<port>/...`). |
| `obs.websocketUrl` | `auto` | obs-websocket address. `auto` reads the port from OBS's own settings. |
| `obs.password` | `""` | Optional. If empty, it's read from OBS's own settings on this PC. |
| `music.routing.inputName` | `IXC Music Player` | Name of the music **browser source** in OBS. It must match exactly. |
| `music.routing.tracks` | `{"twitch":[1],"kick":[2],"youtube":[3]}` | Which OBS track(s) go to each platform. Several tracks per platform are allowed, e.g. `"kick":[2,5]`. |
| `music.routing.mode` | `all` | The last choice of the dock switch (`all`, `twitch`, `kick`, `youtube`, `off`). |
| `music.spotify.clientId` / `clientSecret` | `""` | Optional, for Spotify playlists and albums, and exact artist matching (see below). |
| `music.youtubeApiKey` | `""` | Optional official YouTube Data API v3 key for search (free quota: about 100 searches a day). Without it, search reads YouTube's public results page. |
| `diagnostics.enabled` | `true` | `false` turns off the diagnostics page. |
| `remote.*` | | Phone remote: `enabled`, `port` (8769, localhost only), `sessionHours` (12), `idleMinutes` (30), `allowDownload`, `cloudflaredPath`. |

## Spotify playlists and albums
Spotify only shares playlist contents with registered apps. Registering your own is free and takes 2 minutes:
1. Sign in at [developer.spotify.com/dashboard](https://developer.spotify.com/dashboard) › **Create app**. Any name; Redirect URI `http://127.0.0.1/`; tick **Web API**.
2. Open the app › **Settings**: copy the **Client ID**, and the **Client secret** (View client secret).
3. Put both in `config.json` › `music.spotify`, then restart IXC.

IXC uses Spotify's official Web API with the "client credentials" login. It only reads public song lists and never touches your Spotify account.
Keep the secret private, like a password. Spotify's own editorial / algorithmic playlists and private playlists stay unavailable to apps.

If you also use [IXC ChatBox](https://github.com/infernoxc/ixc-chatbox), the same `config.json` holds its sections too
(`tts`, `chat`, `streamerbot`). The installer only adds missing settings and never overwrites your values.
