# Security policy

Only the latest release gets fixes. Please report vulnerabilities **privately** through
[GitHub private vulnerability reporting](https://github.com/infernoxc/ixc-music/security/advisories/new), not in public issues.
You'll get a reply within 7 days.

## What IXC Music does
- IXC Core listens on **`localhost:8767` only**, never on your network. No firewall rules or router changes are made.
- The API and WebSocket refuse requests from other websites (foreign `Origin`). Files are served only from IXC's folders, with path escapes blocked.
- The **OBS WebSocket password** is read on your PC from `config.json` or OBS's own settings, and used only for the `127.0.0.1` connection.
  IXC only uses these OBS requests: set and read the music source's audio tracks, and read the source list.
- Optional keys (Spotify client secret, YouTube API key) stay in your `config.json` and are sent only to Spotify or Google.
  They're never shown in pages, diagnostics or on phones.
- The installer needs **no admin rights**. It builds IXC Core from its source with the C# compiler in Windows, and writes to:
  - `%LOCALAPPDATA%\IXC-OBS`;
  - your Start menu;
  - one per-user scheduled task ("IXC for OBS");
  - with `-AddObsDocks` only: OBS's `user.ini` dock line, after making a backup.
- **Phone remote:** off until you open the 📱 QR code. It uses an outbound Cloudflare tunnel (HTTPS/WSS) to a listener on `127.0.0.1:8769`
  that serves only the phone page, one-time pairing and one authenticated WebSocket.
  - Pairing codes are single-use and expire after 5 minutes, and sessions expire.
  - Host and Origin are checked, and wrong codes and floods are rate-limited.
  - The tunnel stops after 30 idle minutes.

  The full model is in [IXC ChatBox's SECURITY.md](https://github.com/infernoxc/ixc-chatbox/blob/main/SECURITY.md#security-model) (same code).
- Outbound connections: `youtube.com`, `i.ytimg.com`, `open.spotify.com` (link checks), and only if you set keys, `api.spotify.com` / `accounts.spotify.com` / `googleapis.com`.
  With the phone remote: `github.com` (the one-time cloudflared download) and Cloudflare's tunnel network.
