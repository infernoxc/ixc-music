# Contributing to IXC Music

Thanks for helping! Bug reports, ideas and pull requests are welcome.

**Bugs:** use the *Bug report* issue form and include your Windows and OBS versions, the steps, `%LOCALAPPDATA%\IXC-OBS\ixc-core.log` and the *Recent events* from http://localhost:8767/diag.and http://localhost:8767/api/log. Never post passwords, keys or your config.json.

**Development**
```powershell
git clone https://github.com/infernoxc/ixc-music.git; cd ixc-music
powershell -ExecutionPolicy Bypass -File tests\smoke.ps1          # offline checks (~20 s)
powershell -ExecutionPolicy Bypass -File src\core\build-core.ps1   # builds src\core\ixc-core.exe (C# compiler built into Windows)
src\core\ixc-core.exe --test                                     # run from source on port 8767 (stop an installed copy first); --test enables /api/chat/inject
```
Pages in `src/music` are plain HTML/JS; the player reloads itself when you save a file.

**Pull request rules**
- Windows PowerShell **5.1** compatible (no PowerShell 7-only syntax); no new runtime dependencies or downloads (the only download is the optional, signature-checked cloudflared for the phone remote).
- No personal paths, names, keys or tokens (the smoke test checks common cases).
- Keep it light on CPU. Run `tests\smoke.ps1`, and add a check for new behaviour where possible.
- Add a line under **[Unreleased]** in `CHANGELOG.md`.
- IXC Core is shared with [IXC ChatBox](https://github.com/infernoxc/ixc-chatbox): keep `src/core`, `scripts` and `tests/smoke.ps1` identical in both repos.

By contributing you agree that your contribution is licensed under the MIT License.