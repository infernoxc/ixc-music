# Changelog
All notable changes are listed here ([Keep a Changelog](https://keepachangelog.com/en/1.1.0/), [SemVer](https://semver.org)).

## [Unreleased]

## [2.0.1] - 2026-09-26
### Fixed
- Switching the music destination (ALL / TWITCH ONLY / KICK ONLY / YOUTUBE ONLY) right after OBS starts could fail with
  "OBS is not ready to perform the request." It now retries automatically until OBS finishes loading, instead of failing once.

## [2.0.0] - 2026-09-24
### Added
- **Music goes to: ALL / TWITCH ONLY / KICK ONLY / YOUTUBE ONLY.**
  - Switches the OBS audio tracks of the player source through OBS's built-in obs-websocket, then reads them back to verify.
  - Saved, re-applied when OBS starts, and reports manual changes made in OBS.
  - The platform → track map is configurable.
- **Spotify links:**
  - songs are matched to YouTube (title from Spotify's official oEmbed; exact artist and length with your own Spotify developer keys);
  - playlists and albums (up to 150 songs) through the official Spotify Web API, each song matched only when it's about to play.
- **Link checks** with YouTube's official oEmbed service.
  - Supported: videos, Shorts, YouTube Music and playlists.
  - Clear messages for private, deleted, duplicate and unsupported links, and for YouTube Mixes and short Spotify links.
- Optional official YouTube Data API key for search.
- **Phone remote over the internet** (Cloudflare tunnel, one-time QR pairing): now playing, controls, volume, destination switch, add songs, queue.
- **Diagnostics page** (`/diag`).
### Changed
- **IXC Core**: one small native program replaces the PowerShell helper. Docks and the player get updates pushed over a WebSocket instead
  of polling (the player polled every 0.5 s and posted its state every 1.5 s in v1).
  - v1 in a 60-second test with the usual OBS pages open: 0.065 % CPU and 152 MB RAM.
  - v2 in the same test: 0.011 % CPU and 42 MB RAM (IXC Music + ChatBox together).
- Pages reload by themselves after an update (file watcher instead of 5-second version polling).

## [1.0.0] - 2026-09-24
### Added
- YouTube player browser source and control dock for OBS Studio.
- Search without an API key; paste video / playlist links or video IDs.
- Queue with play now, add, move up, remove and jump; shuffle; repeat.
- Autoplay of similar songs when the queue ends (music only, 1-12 min, no repeats of songs already played).
- Optional start-with-OBS resume at the saved position.
- Recovery from unexpected pauses; blocked or removed videos are skipped with the reason shown.
- Per-user installer and uninstaller (no admin), start at login, Start menu shortcuts, `-AddObsDocks`, `config.json`.
- Smoke tests, CI, and a release build (portable ZIP + Inno Setup installer).

[Unreleased]: https://github.com/infernoxc/ixc-music/compare/v2.0.0...HEAD
[2.0.0]: https://github.com/infernoxc/ixc-music/compare/v1.0.0...v2.0.0
[1.0.0]: https://github.com/infernoxc/ixc-music/releases/tag/v1.0.0
