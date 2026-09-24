# Third-party notices

The code in this repository is written by Ishan (InFerNoxC) and released under the [MIT License](LICENSE). IXC Music
**uses at runtime** the services below. None of their code or assets are included in this repository, they aren't covered by
this project's license, and this project claims no ownership of them.

| Component | How it is used | Owner / terms |
|---|---|---|
| **OBS Studio** | The pages run in OBS browser sources and docks. No OBS code is included or linked. | OBS Project, GPL-2.0 |
| **YouTube IFrame Player API** (`youtube.com/iframe_api`) | Loaded by `music/player.html` to play videos. | Google, [YouTube API Services Terms](https://developers.google.com/youtube/terms/api-services-terms-of-service) |
| **YouTube web pages** (search results, watch pages) | Read by the helper for search and autoplay (no API key). Not an official API; may break. | Google, [YouTube Terms of Service](https://www.youtube.com/t/terms) |
| **YouTube thumbnails** (`i.ytimg.com`) | Shown in the dock. | Google / the video owners |
| Microsoft Edge "Read aloud" endpoint | Only used if IXC ChatBox's text-to-speech is used (the helper is shared). | Microsoft |
| Fonts: Bahnschrift, Segoe UI | Referenced by name; they come with Windows. Not distributed. | Microsoft |
| Windows PowerShell 5.1 / .NET Framework 4.8 | Runtime. | Microsoft |

**Music:** IXC Music plays whatever YouTube content you choose. Copyright in that content belongs to its owners. Stream only
music you're allowed to use.

The banner and icons in `docs/images` are original artwork for this project (MIT). The dock screenshot shows this project's UI
with NCS track titles and YouTube thumbnails, which belong to their respective owners.
Trademarks belong to their owners. Not affiliated with or endorsed by Google/YouTube or the OBS Project.