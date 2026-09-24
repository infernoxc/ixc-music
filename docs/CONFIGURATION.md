# Configuration

Settings live in **`%LOCALAPPDATA%\IXC-OBS\config.json`** (Start menu › IXC for OBS › IXC settings). Updates keep this file.
After editing it: Start menu › **Stop IXC**, then **Start IXC**.

| Setting | Default | Meaning |
|---|---|---|
| `helper.port` | `8767` | Port of the local IXC Helper. If you change it, change every OBS URL (`http://localhost:<port>/...`). |

That's the only file setting IXC Music needs. Everything else (shuffle, repeat, autoplay, start with OBS, volume, the
queue) is set in the dock and remembered automatically.

If you also use [IXC ChatBox](https://github.com/infernoxc/ixc-chatbox), the same `config.json` holds its sections too
(`tts`, `chatRelay`, `streamerbot`). The installer only ever adds missing sections and never overwrites your values.
