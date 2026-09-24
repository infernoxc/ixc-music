# Changelog
All notable changes are listed here ([Keep a Changelog](https://keepachangelog.com/en/1.1.0/), [SemVer](https://semver.org)).

## [Unreleased]

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

[Unreleased]: https://github.com/infernoxc/ixc-music/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/infernoxc/ixc-music/releases/tag/v1.0.0