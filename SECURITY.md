# Security policy

Only the latest release gets fixes. Please report vulnerabilities **privately** through
[GitHub private vulnerability reporting](https://github.com/infernoxc/ixc-music/security/advisories/new), not in public issues.
You'll get a reply within 7 days.

## What IXC Music does
- The helper listens on **`localhost:8767` only**, never on your network.
- `/api/*` rejects requests from other websites (foreign `Origin` header); files are served only from the app folders, with path traversal blocked.
- No accounts, API keys, tokens or passwords are used or stored.
- The installer needs **no admin rights**. It writes only to `%LOCALAPPDATA%\IXC-OBS`, your Start menu, one per-user scheduled
  task ("IXC for OBS"), and (only with `-AddObsDocks`) the `ExtraBrowserDocks` line of OBS's `user.ini`, after a backup.
- Outbound connections: `youtube.com`, `i.ytimg.com` (thumbnails).