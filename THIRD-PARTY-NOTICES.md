# Third-party notices

The code in this repository is written by Ishan (InFerNoxC) and released under the [MIT License](LICENSE). IXC Music
**uses, downloads or loads at runtime** the services below. None of their code or assets are included in this repository, they aren't
covered by this project's license, and this project claims no ownership of them.

| Component | How it is used | Owner / terms |
|---|---|---|
| **OBS Studio** and its built-in **obs-websocket** | The pages run in OBS browser sources and docks; IXC sets the music source's audio tracks over obs-websocket. No OBS code is included or linked. | OBS Project, GPL-2.0 |
| **YouTube IFrame Player API** (`youtube.com/iframe_api`) | Loaded by `music/player.html` to play videos. | Google, [YouTube API Services Terms](https://developers.google.com/youtube/terms/api-services-terms-of-service) |
| **YouTube oEmbed** (`youtube.com/oembed`) | Official endpoint used to check links (exists, private). | Google |
| **YouTube web pages** (search results, watch pages) | Read for search and autoplay when no YouTube Data API key is set. Not an official API; may break. | Google, [YouTube Terms of Service](https://www.youtube.com/t/terms) |
| **YouTube Data API v3** (optional, your own key) | Search, if you set `music.youtubeApiKey`. | Google, [YouTube API Services Terms](https://developers.google.com/youtube/terms/api-services-terms-of-service) |
| **Spotify oEmbed** and **Spotify Web API** (optional, your own app keys) | Read song titles, and the song lists of public playlists and albums. No Spotify audio is played or recorded. | Spotify, [Developer Terms](https://developer.spotify.com/terms) |
| **YouTube thumbnails** (`i.ytimg.com`) | Shown in the dock and on the phone. | Google / the video owners |
| **cloudflared** | Only if you use the phone remote: downloaded once from [Cloudflare's GitHub releases](https://github.com/cloudflare/cloudflared/releases) and kept only with a valid Cloudflare signature. Runs a free "quick tunnel" (`trycloudflare.com`), which Cloudflare provides for testing, without uptime guarantees. | Cloudflare, Apache-2.0; service under [Cloudflare's terms](https://www.cloudflare.com/website-terms/) |
| **qrcodejs 1.0.0** (cdnjs) | Loaded only in the phone QR window. | davidshimjs, MIT |
| Microsoft Edge "Read aloud" endpoint | Only used by IXC ChatBox's text-to-speech (IXC Core is shared). | Microsoft |
| Fonts: Bahnschrift, Segoe UI | Referenced by name; they come with Windows. Not distributed. | Microsoft |
| .NET Framework 4.8 (C# compiler, `HttpListener`) and Windows PowerShell 5.1 | Runtime and build. | Microsoft |

**Music:** IXC Music plays whatever YouTube content you choose. Copyright in that content belongs to its owners. Stream only
music you're allowed to use.

The banner and icons in `docs/images` are original artwork for this project (MIT). The dock screenshot shows this project's UI
with NCS track titles and YouTube thumbnails, which belong to their respective owners.
Trademarks belong to their owners. Not affiliated with or endorsed by Google/YouTube, Spotify, Cloudflare or the OBS Project.
